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
