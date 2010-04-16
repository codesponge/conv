class Array
  
  # returns a random element from the array
  def rand
    self[Kernel.rand(self.length)]
  end
  
  # returns array with the vales at index_a swaped
  # with index_b
  def swap(ind1,ind2)
    ar = self
    ar[ind1], ar[ind2] = ar[ind2],ar[ind1]
  end

  # swaps the vale at index_a with index_b
  # returns the modified self
  def swap!(ind1,ind2)
       self[ind1], self[ind2] = self[ind2], self[ind1]
  self
  end

end