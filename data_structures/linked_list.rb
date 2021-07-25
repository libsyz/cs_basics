require 'pry-byebug'

class LinkedList
  attr_reader :length, :tail

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  def push(element)
    node = Node.new(element)
    head ? @tail.next = node : @head = node
    @tail = node
    node.value
  end

  def head
    @head.nil? ? nil : @head.value
  end

  def tail
    @tail.nil? ? nil : @tail.value
  end

  def pop
    delete(@length - 1)
  end

  def delete(index)
    raise ArgumentError unless index.is_a? Integer
    return nil if index > length - 1 || @head.nil?

    if index.zero?
      @head = @head.next
    else
      previous_to_deleted = find(index - 1)
      if index == length - 1
        @head = previous_to_deleted
      else
        previous_to_deleted.next = previous_to_deleted.next.next
    end
  end

  private

  def find(index)
    return nil if index > length - 1 || !@head
    return @head if index === 0

    counter = 0
    until counter == index
      if counter.zero?
        selected = @head
      else
        selected = selected.next
    end
  end
  return selected
end

class Node
  attr_accessor :next
  attr_reader :value

  def initialize(element)
    @value = element
    @next = nil
  end
end


describe Node do
  describe '#initialize' do
    it 'initializes with one value' do
    end
  end

  describe '#next' do
    it 'returns the value of the next node in a linked list' do
    end

    it 'returns nil if there is no next node in the linked list' do
    end
  end
end

describe LinkedList do
  describe '#initialize' do
    it 'has a length of 0 when initialized' do
      list = LinkedList.new
      expect(list.length).to eq 0
    end

    it 'has no head when initialized' do
      list = LinkedList.new
      expect(list.head).to eq nil
    end

    it 'has no tail when initialized' do
      list = LinkedList.new
      expect(list.tail).to eq nil
    end
  end

  describe '#push' do
    it 'takes an argument which could be any object' do
      list = LinkedList.new
      expect { list.push('bender') }.not_to raise_error
    end

    it 'the head and the tail are the same when the first element is pushed' do
      list = LinkedList.new
      list.push('hello')

      expect(list.head).to eq 'hello'
      expect(list.tail).to eq 'hello'
    end

    it 'the head and the tail are different a second element is pushed' do
      list = LinkedList.new
      list.push('hello')
      list.push('world')
      binding.pry
      expect(list.head).to eq 'hello'
      expect(list.tail).to eq 'world'
      expect(list.head.next).to eq 'world'
    end

    it 'the tail changes with a new element is pushed' do
      list = LinkedList.new
      list.push('hello')
      list.push('world')
      expect(list.tail).to eq 'world'
      list.push('!')
      expect(list.tail).to eq '!'
    end
  end



  describe '#delete' do
    it 'takes an index' do
      list = LinkedList.new
      list.push('hello')
      expect { list.delete(0) }.not_to raise_error
      expect { list.delete('hello')}.to raise_error(ArgumentError)
    end

    xit 'deletes the element at the right index' do
      list = LinkedList.new
      list.push('hello')
      list.push('world')

      expect(list.delete(1)).to eq 'world'

      expect(list.length).to eq 1
    end

    xit 'element with index 2 is linked to element with index 4 after deleting element with index 3' do
    end

    xit 'the head becomes the tail when there is only one element in the linked list' do
    end
  end

  describe '#get' do
    xit 'takes an index' do
    end

    xit 'returns the value within a node according to the index passed' do
    end

    xit 'returns nil if the element is not found in the linked list' do
    end
  end
end
