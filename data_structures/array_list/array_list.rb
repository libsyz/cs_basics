require 'rspec'
require 'pry-byebug'

class ArrayList
  def initialize(*args)
    raise ArgumentError if args.length.zero?
    # we are going to store
    # all the elements of the array list
    # in hash
    @data = {}
    args.each_with_index do |element, idx|
      @data[idx] = element
    end
  end

  def length
    # return the length of the array_list
    # without using hash or array built in functions
    counter = 0
    @data.keys.each do |_|
      counter += 1
    end
    counter
  end

  def pop
    # delete the last element of the array
    # and return it
    @data.delete(self.length - 1)
  end

  def get(index)
    # return the nth element of the ArrayList
    # simulates a linear lookup
    @data.keys.each do |k|
      if k == index
        return @data[k]
      end
    end

    return nil
  end

  def delete(index)
    # delete something and shift all other elements up!
    # tough!

    deleted = false
    @data.keys.each do |k|
      if k == index
        @data.delete(k)
        deleted = true
      end
    end

    if deleted
      @data.transform_keys! do |k|
        k -= 1 if k > index
      end
    else
      nil
    end
  end

  def push(value)
    # add an element to the ArrayList
    @data[self.length] = value
  end
end


describe ArrayList do
  describe '#initialize' do
    it 'initializes with an arbitrary number of items' do
      expect { ArrayList.new(1,2,4)  }.not_to(raise_error)
    end

    it 'raises an error when initialized with no arguments' do
      expect { ArrayList.new  }.to (raise_error ArgumentError)
    end
  end

  describe '#length' do
    it 'returns the length of the ArrayList as an integer' do
      array_list = ArrayList.new(1,2,3)
      expect(array_list.length).to eq 3
    end
  end

  describe '#pop' do
    it 'deletes the last element of the ArrayList' do
      array_list = ArrayList.new(1,2,3)
      array_list.pop
      expect(array_list.length).to eq 2
    end

    it 'returns the last element of the ArrayList' do
      array_list = ArrayList.new(1,2,3)
      result = array_list.pop
      expect(result).to eq 3
    end
  end

  describe '#get' do
    it 'gets the value stored in the index passed as an argument' do
      array_list = ArrayList.new('Prima', 'Liana', 'Miguel')
      result = array_list.get(2)
      expect(result).to eq 'Miguel'
    end

    it 'return nil when the index is not found in the ArrayList' do
      array_list = ArrayList.new('Prima', 'Liana', 'Miguel')
      result = array_list.get(3)
      expect(result).to be_nil
    end
  end

  describe '#push' do
    it 'stores a new value in the right index' do
      array_list = ArrayList.new('Prima', 'Liana', 'Miguel')
      array_list.push('Dirk')
      expect(array_list.length).to eq 4
      expect(array_list.get(3)).to eq 'Dirk'
    end
  end

  describe '#delete' do
    it 'successfully deletes a value in the ArrayList' do
      array_list = ArrayList.new('Prima', 'Liana', 'Miguel')
      expect(array_list.get(0)).to eq('Prima')
      array_list.delete(0)
      expect(array_list.get(0)).not_to eq('Prima')
    end

    it 'shifts all the indexes up when a value is deleted' do
      array_list = ArrayList.new('Prima', 'Liana', 'Miguel')
      array_list.delete(0)
      expect(array_list.get(0)).to eq('Liana')
      expect(array_list.get(1)).to eq('Miguel')
    end

    it 'returns nil when an index is not found' do
      array_list = ArrayList.new('Prima', 'Liana', 'Miguel')
      result = array_list.delete(6)
      expect(result).to be_nil

    end
  end
end
