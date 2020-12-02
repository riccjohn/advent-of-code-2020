file = File.open('input.txt')
file_data = file.read.split("\n")
file.close

data_array = file_data.map {|n| n.to_i }

def two_sum(nums, target)
    array = []

    nums.each do |curr_num|
        n = target - curr_num

        return [n, curr_num] if array.include? n
        array.push curr_num
    end
end

sum_pair = two_sum(data_array, 2020)

product = sum_pair.inject(1, :*)
pp product

# 403 + 1617
# 403 * 1617 = 651651
