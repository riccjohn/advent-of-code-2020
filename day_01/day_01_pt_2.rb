file = File.open('input.txt')
file_data = file.read.split("\n")
file.close

data_array = file_data.map {|n| n.to_i }

def three_sum(nums, target)
  nums.sort!
  [0, 0, 0]
end

sum_trio = three_sum(data_array, 2020)

pp sum_trio

pp sum_trio[0] * sum_trio[1] * sum_trio[2]
