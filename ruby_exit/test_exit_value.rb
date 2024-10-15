#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# https://rderik.com/blog/exit-codes-for-ruby-scripts/#exit-codes
# Every command, after completing execution, returns an exit status.
# The exit status is represented by an integer: a 0 (zero) means success and anything else is an error.
# Read the BSD Sysexits or The Linux Documentation Project - Exit codes for some ideas.
# In general most of the codes form 1-255 have a specific meaning if you want to raise a custom exit signal, choose a number above 255.
# To get the exit status of the last command, use the special variable $?.
# echo $?

balance = 10_000
expenses = 11_000

if expenses < balance
  puts "Run script to make payments to our employees"
else
  puts "ERROR: we don't have enough money to pay our employees"
  exit 1
end

# Run this command to get the exit status of the last command, should be 1
# echo $?
