module Enumerable
  # Your code goes here
  def my_each_with_index
    ind = 0
    self.my_each do |elem|
      yield(elem, ind)
      ind += 1
    end
    self
  end

  def my_select
    filtered = []
    self.my_each do |elem|
      filtered << elem if yield(elem)
    end
    filtered
  end

  def my_all?
    till_now = true
    self.my_each do |elem|
      till_now = till_now && yield(elem)
    end
    till_now
  end

  def my_any?
    till_now = false
    self.my_each do |elem|
      till_now = till_now || yield(elem)
    end
    till_now
  end

  def my_none?(&b)
    !self.my_any?(&b)
  end

  def my_count
    c = 0
    unless block_given?
      self.my_each {c += 1}
    else
      self.my_each {|elem| c += 1 if yield(elem)}
    end
    c
  end
  
  def my_map
    mapped = []
    self.my_each do |elem|
      mapped << yield(elem)
    end
    mapped
  end

  def my_inject(initial_value)
    result = initial_value
    self.my_each do |elem|
      result = yield(result, elem)
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for i in self
      yield(i)
    end
    self
  end
end
