#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

p 'To remove extra indentation at the start of every line'

page = <<-HTML
  Heredocs are cool & useful
HTML
# "  Heredocs are cool & useful\n"

p page

page = <<~HTML
  Heredocs are cool & useful
HTML
# "Heredocs are cool & useful\n"

p page

page = <<~HTML.strip
  Heredocs are cool & useful
HTML
# "Heredocs are cool & useful"

p page
