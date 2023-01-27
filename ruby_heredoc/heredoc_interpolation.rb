#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

type  = 'healthy'
table = 'food'

query = <<-SQL
  SELECT * FROM #{table}
  WHERE #{type} = true
SQL

p query

doc = <<-TIME
  Current time is #{Time.now}
TIME

p doc
