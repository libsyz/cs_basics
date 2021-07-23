require 'rspec'
require 'pry-byebug'

# Worst case: a Reverse sorted list - On^2
# Best case: a perfectly sorted list - On
# Spatial Complexity: Constant

# Insertion sort is great when you know ahead of time that you have
# a list that is mostly sorted. When that is the case, it will operate
# very quickly


def insertion_sort(array)
  binding.pry
  (1..array.length - 1).each do |n|
    number_to_insert = array[n]
    j = n - 1
    while array[j] > number_to_insert && j >= 0
      array[j + 1] = array[j]
      j -= 1
    end
    array[j + 1] = number_to_insert
  end
  array
end


describe 'insertion sort' do
  it 'sorts an array of integers correctly' do
    int_array = [9, 4, 7, 1, 5, 8, 10, 3, 2, 6, 11]
    result = insertion_sort(int_array)
    expect(result).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11])
  end
end
