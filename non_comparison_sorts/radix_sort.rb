require 'rspec'

def radix_sort(array)
  # max number
  max = array.max
  # max amount of digits
  buckets = {
    0 => [],
    1 => [],
    2 => [],
    3 => [],
    4 => [],
    5 => [],
    6 => [],
    7 => [],
    8 => [],
    9 => [],
  }

  for i in (0..max.digits.length - 1) do
    # go through all the numbers and enqueue them in the right buckets
    array.each do |n|
      if n.digits[i].nil?
        buckets[0].push(n)
      else
        buckets[n.digits[i]].push(n)
      end
    end
    # go through all the buckets in order and dequeue them into dequeued
    array.clear
    buckets.each_pair do |_, v|
      while v.length.positive?
        array.push(v.shift)
      end
    end
  end
  array
end



describe 'radix sort' do
  it 'sorts an array of integers' do
    unsorted_array = [49, 456, 3, 11, 996, 678, 74, 69, 63, 822]
    result = radix_sort(unsorted_array)
    expect(result).to eq([3, 11, 49, 63, 69, 74, 456, 678, 822, 996])
  end
end
