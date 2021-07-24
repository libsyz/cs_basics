
def quick_sort(arr)
  # base case - Array of length 1 is already sorted
  return arr if arr.length <= 1
  # choose the pivot
  pivot = arr.last
  # split the array into right and left
  left = []
  right = []
  arr.each_with_index do |el, idx|
    # pivot is the last number so we don't want to capture it
    next if idx == arr.length - 1
    el < pivot ? left.push(el) : right.push(el)
  end
  # call quicksort on left and right
  sorted_left = quick_sort(left)
  sorted_right = quick_sort(right)
  return sorted_left.concat([pivot], sorted_right)
end


describe 'quick sort' do
  it 'sorts an array of integers' do
    unsorted_array =  [8, 9, 7, 1, 10, 3, 5, 4, 6, 2]
    result = quick_sort(unsorted_array)
    expect(result).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
  end
end
