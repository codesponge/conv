class Array
  # => rand
  # returns a random element from the array
  def rand
    self[Kernel.rand(self.length)]
  end
  
end