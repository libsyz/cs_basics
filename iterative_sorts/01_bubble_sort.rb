
require 'rspec'
# Bubble sort is not an algorithm that you will use in production,
# but it's good because it fits the most basic mental model of
# how to go about sorting something

# Computational Complexity os On^2, because every single item needs to
# be compared to every other item
# Worst case: a Reverse sorted list
# Best case: a perfectly sorted list
# Spatial Complexity: Constant

def bubble_sort(arr)
  loop do
    swapped = false
    arr.each_with_index do |_, idx|
      # comparison below cannot happen at the end of the array
      next if idx == arr.length - 1

      if arr[idx] > arr[idx + 1]
        swap = arr[idx + 1]
        arr[idx + 1] = arr[idx]
        arr[idx] = swap
        swapped = true
      end
    end

    break if swapped == false
  end
  return arr
end

describe 'bubble sort' do
  it 'sorts an array of integers correctly' do
    int_array = [9, 4, 7, 1, 5, 8, 3, 2, 10, 6]
    result = bubble_sort(int_array)
    expect(result).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
  end
end
