require 'pry-byebug'
require 'rspec'

# merge sort uses a divide and conquer strategy to sort items


def merge(sorted_left, sorted_right)
  result = []

  until sorted_right.empty? || sorted_left.empty?
    if sorted_left.first < sorted_right.first
      result.push(sorted_left.shift)
    else
      result.push(sorted_right.shift)
    end
  end
  result.concat(sorted_left, sorted_right)
end

def merge_sort(arr)
  # base case - return if the array is of length 1
  return arr if arr.length == 1
  # break up the array in two pieces
  center = arr.length / 2
  left = arr[0, center]
  right = arr[center, arr.length - 1]

  # call merge_sort on the left array
  sorted_left = merge_sort(left)
  # call merge_sort on the right array
  sorted_right = merge_sort(right)

  # return the merge / stitch of the left and right array
  merge(sorted_left, sorted_right)
end


describe 'merge sort' do
  it 'sorts an array of integers' do
    unsorted_array =  [8, 9, 7, 1, 10, 3, 5, 4, 6, 2]
    result = merge_sort(unsorted_array)
    expect(result).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
  end
end
