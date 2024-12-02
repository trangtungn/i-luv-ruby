#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# My adventure with Async Ruby: https://thoughtbot.com/blog/my-adventure-with-async-ruby
# https://socketry.github.io/async/guides/asynchronous-tasks/index
#
require 'async'
require 'async/barrier'

class Article
  def initialize(method = :sync)
    @method = method
  end

  def to_s
    case @method
    when :sync
      to_s_sync
    when :async
      to_s_async
    when :async_barrier
      to_s_async_barrier
    end
  end

  private

  def to_s_sync
    <<~MARKDOWN
      # #{generate_title}

      #{generate_content}
    MARKDOWN
  end

  def to_s_async
    Sync do
      title_task = Async { generate_title }
      content_task = Async { generate_content_async } # <--- Async here is not required, but it's a good practice
      # to create 2 concurrent tasks (title_task and content_task)
      # and then in content_task, create n tasks, each for generating a paragraph

      title = title_task.wait
      content = content_task.wait

      <<~MARKDOWN
        # #{title}

        #{content}
      MARKDOWN
    end
  end

  def to_s_async_barrier
    Sync do
      title_task = Async { generate_title }
      content_task = Async { generate_content_async_barrier }

      title = title_task.wait
      content = content_task.wait

      <<~MARKDOWN
        # #{title}

        #{content}
      MARKDOWN
    end
  end

  def generate_title
    sleep 2

    "A title: #{@method}"
  end

  def generate_content
    5.times.map { |i|
      generate_paragraph(i)
    }.join("\n")
  end

  def generate_content_async
    paragraphs = []

    5.times do |i|
      Async do
        paragraphs << generate_paragraph(i)
      end
    end

    paragraphs.map(&:wait).join("\n")
  end

  def generate_content_async_barrier
    paragraphs = []

    wait_all do |barrier|
      5.times do |i|
        barrier.async do
          paragraphs << generate_paragraph(i)
        end
      end
    end

    paragraphs.join("\n")
  end

  def wait_all(&block)
    barrier = Async::Barrier.new

    block.call(barrier)

    barrier.wait
  end

  def generate_paragraph(i)
    sleep 1

    "Paragraph #{i}"
  end
end

t0 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
puts Article.new(:sync).to_s
t1 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
puts "Time: #{t1 - t0} seconds."
puts Article.new(:async).to_s
t2 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
puts "Time: #{t2 - t1} seconds."
puts Article.new(:async_barrier).to_s
t3 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
puts "Time: #{t3 - t2} seconds."
