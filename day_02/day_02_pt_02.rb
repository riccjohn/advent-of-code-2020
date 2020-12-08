#!/usr/bin/env ruby

file_data = File.readlines(File.expand_path('./day_02_input.txt', __dir__))

def parse_data(arr)
  arr.map do |p|
    obj = {}
    range = p.slice(0, p.index(" ")).split("-")
    obj[:idx_a] = range[0].to_i
    obj[:idx_b] = range[1].to_i

    chars = p.slice(p.index(" "), p.length - 1).lstrip.split(": ")

    obj[:char] = chars[0]
    obj[:password] = chars[1]

    obj
  end
end

data = parse_data(file_data)

results = {
  :pass => 0,
  :fail => 0,
}

data.each do |line|
  idx_a     = line[:idx_a]
  idx_b     = line[:idx_b]
  char      = line[:char]
  password  = line[:password]

  char_a = password[idx_a - 1]
  char_b = password[idx_b - 1]

  chars = [char_a, char_b]

  if (chars.select { |c| c == char}.length == 1)
    results[:pass] += 1
  else
    results[:fail] += 1
  end
end

pp results
pp results[:pass] + results[:fail] == data.length

