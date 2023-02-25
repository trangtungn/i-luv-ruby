#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(connections, name1, name2)
  return -1 if connections.empty?

  if connections.size == 1
    return 0 if connections.first.include?(name1) && connections.first.include?(name2)

    -1
  end

  con_mapper = {}
  connections.each do |con|
    head, tail = con.split(':')

    con_mapper[head] = [] if con_mapper[head].nil?
    con_mapper[head] << tail
  end

  count = 0
  match = false
  first = name1
  while con_mapper.any?
    last = con_mapper.delete(first)
    return -1 if last.nil? || last.empty?

    count += 1

    last.each do |one, two|
      if con_mapper[last] == name2
        match = true
        break
      end
    end
    first = last
  end

  return count if match == true

  -1
end

def find(conns, name1, name2)
  return -1 if conns.empty?

  last = con_mapper.delete(first)
  return -1 if last.nil? || last.empty?

  count += 1

  last.each do |one, two|
    find(conns, name1, name2)
  end

  return 1 if con_mapper[last] == name2

  first = last
end

args = [
  [['fred:joe', 'joe:mary', 'mary:fred', 'mary:bill'], 'fred', 'bill'],
  [['fred:joe', 'joe:mary', 'kate:sean', 'sean:sally'], 'fred', 'sally'],
  [['fred:joe', 'joe:sally'], 'fred', 'sally'],
  [['fred:joe', 'joe:sean', 'joe:mary', 'kate:sean', 'sean:sally'], 'fred', 'sally'],
]

args.each do |arg|
  p solution(*arg)
  p '-' * 10
end
