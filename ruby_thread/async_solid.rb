#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# My adventure with Async Ruby: https://thoughtbot.com/blog/my-adventure-with-async-ruby
# https://socketry.github.io/async/guides/asynchronous-tasks/index
#
require 'async'
require 'async/barrier'

class Article
  def initialize(title_generator, content_generator)
    @title_generator = title_generator
    @content_generator = content_generator
  end

  def to_s(renderer)
    renderer.render(@title_generator, @content_generator)
  end
end

module AsyncGenerator
  def generate_async
    Async do
      generate
    end
  end
end

# TitleGenerator with a clear, single purpose.
class TitleGenerator
  include AsyncGenerator

  def initialize(method = :sync)
    @method = method
  end

  def generate
    sleep 2

    "A title: #{@method}"
  end
end

# ParagraphGenerator decouples paragraph logic.
class BaseContentGenerator
  def generate_paragraph(index)
    sleep 1
    "Paragraph #{index}"
  end
end

# ContentGenerator interface with injection of ParagraphGenerator.
class ContentGenerator < BaseContentGenerator
  def generate
    5.times.map { |i| generate_paragraph(i) }.join("\n")
  end
end

# AsyncContentGenerator now uses composition instead of inheritance.
class AsyncContentGenerator < BaseContentGenerator
  include AsyncGenerator

  def generate
    tasks = 5.times.map { |i| Async { generate_paragraph(i) } }
    tasks.map(&:wait).join("\n")
  end

  def generate_async
    Async do
      generate
    end
  end
end

class AsyncBarrierContentGenerator < BaseContentGenerator
  include AsyncGenerator

  def generate
    paragraphs = []
    barrier = Async::Barrier.new

    5.times do |i|
      barrier.async do
        paragraphs << generate_paragraph(i)
      end
    end

    barrier.wait
    paragraphs.join("\n")
  end

  def generate_async
    Async do
      generate
    end
  end
end

# Abstract Renderer interface for renderers.
class Renderer
  def render(title_generator, content_generator)
    raise NotImplementedError, "Subclasses must implement `render`"
  end
end

# SyncRenderer implements Renderer interface.
class SyncRenderer < Renderer
  def render(title_generator, content_generator)
    <<~MARKDOWN
      # #{title_generator.generate}

      #{content_generator.generate}
    MARKDOWN
  end
end

# AsyncRenderer implements Renderer interface with asynchronous logic.
class AsyncRenderer < Renderer
  def render(title_generator, content_generator)
    Sync do
      title_task = title_generator.generate_async
      content_task = content_generator.generate_async

      title = title_task.wait
      content = content_task.wait

      <<~MARKDOWN
        # #{title}

        #{content}
      MARKDOWN
    end
  end
end

t0 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
article = Article.new(TitleGenerator.new(:sync), ContentGenerator.new)
puts article.to_s(SyncRenderer.new)
t1 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
puts "Time: #{t1 - t0} seconds."
article = Article.new(TitleGenerator.new(:async), AsyncContentGenerator.new)
puts article.to_s(AsyncRenderer.new)
t2 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
puts "Time: #{t2 - t1} seconds."
article = Article.new(TitleGenerator.new(:async_barrier), AsyncBarrierContentGenerator.new)
puts article.to_s(AsyncRenderer.new)
t3 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
puts "Time: #{t3 - t2} seconds."
