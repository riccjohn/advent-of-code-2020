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

def verify_password(password_data)
  idx_a     = password_data[:idx_a]
  idx_b     = password_data[:idx_b]
  char      = password_data[:char]
  password  = password_data[:password]

  char_a = password[idx_a - 1]
  char_b = password[idx_b - 1]

  pp password_data
  pp char_a
  pp char_b

  result = char_a == char || char_b == char
  pp result
end

pp data.select { |p| verify_password(p) }.length

