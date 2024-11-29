#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# https://thoughtbot.com/blog/my-adventure-with-async-ruby
# https://socketry.github.io/async/guides/asynchronous-tasks/index
#
require 'async'
require 'async/barrier'

class Article
  def initialize(method = :sync)
    @method = method
  end

  def to_s
    <<~MARKDOWN
      # #{generate_title}

      #{generate_body}
    MARKDOWN
  end

  def generate_title
    sleep 2

    "A title: #{@method}"
  end

  def generate_body
    case @method
    when :sync
      generate_content
    when :async
      generate_content_async
    when :async_barrier
      generate_content_async_barrier
    end
  end

  def generate_content
    5.times.map { |i|
      generate_paragraph(i)
    }.join("\n")
  end

  def generate_content_async
    paragraphs = []

    Sync do
      paragraphs << 5.times.map { |i|
        Async do
          generate_paragraph(i)
        end
      }
      .map(&:wait) # <--- wait after creating all tasks
    end

    paragraphs.join("\n")
  end

  def generate_content_async_barrier
    paragraphs = []

    wait_all do |barrier|
      Async do
        5.times do |i|
          barrier.async do
            paragraphs << generate_paragraph(i)
          end
        end
      end
    end

    paragraphs.join("\n")
  end

  private

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
puts Article.new.to_s
t1 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
puts "Time: #{t1 - t0} seconds."
puts Article.new(:async).to_s
t2 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
puts "Time: #{t2 - t1} seconds."
puts Article.new(:async_barrier).to_s
t3 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
puts "Time: #{t3 - t2} seconds."
