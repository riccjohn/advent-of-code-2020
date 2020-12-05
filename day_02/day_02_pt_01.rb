#!/usr/bin/env ruby

file_data = File.readlines(File.expand_path('./day_02_input.txt', __dir__))

def parse_data(arr)
  arr.map do |p|
    obj = {}
    range = p.slice(0, p.index(" ")).split("-")
    obj[:min] = range[0].to_i
    obj[:max] = range[1].to_i

    chars = p.slice(p.index(" "), p.length - 1).lstrip.split(": ")

    obj[:char] = chars[0]
    obj[:password] = chars[1]

    obj
  end
end

data = parse_data(file_data)

def verify_password(password_data)
  chars = password_data[:password].split("").select { |c| c === password_data[:char]}
  chars.length >= password_data[:min] && chars.length <= password_data[:max]
end

pp data.select { |p| verify_password(p) }.length

