#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

p <<~INTRO.strip
  A heredoc is a way to define a multiline string, while maintaining the original indentation & formatting.
  This is used to embed snippets of code, like SQL or HTML.

INTRO

p '1. Define a heredoc'
query = <<-SQL
  SELECT * FROM food
  WHERE healthy = true
SQL

p query

p '2. Or'
query = %(
  Article about heredocs
)

p query

p '3. To remove trailing newline'
query = <<-HTML.chomp
  Article about heredocs
HTML

p query
