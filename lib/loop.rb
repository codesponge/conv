
module Loopable
# Mixin for Array like objects

  #set the position
  def set_position(index)
    @position = index
  end
  alias_method :set_pos, :set_position

  #returns the position ( current index )
  def position
    unless(defined?(@position)) then
      @position = 0
    end
    @position
  end
  alias_method :current_index, :position
  alias_method :pointer, :position

  #retruns the object at position
  def current
    #call the loopable_current method on the object if
    #is defined.
    self[position].loopable_current if self[position].respond_to?('loopable_current')

    self[position]
  end

  #increments position, looping back to begining
  #if necessary
  # returns the object at the new position
  def next
    if(position == self.size - 1) then
      @position = 0
    else
      @position = @position + 1
    end
    current
  end



  #moves the position forward a number of steps and
  #returns the object stored there
  def forward(steps = 1)
    steps.times { self.next }
    current
  end

  # decrements position, looping back from the end
  #if necessary
  def prev
    if(position == 0) then
      @position = self.size - 1
    else
      @position = @position - 1
    end
      current
  end

  #moves the position back a number of steps and
  #returns the object stored there
  def backward(steps = 1)
    steps.times { self.prev }
    current
  end

end # => module Loop

class Loop < Array
  include Loopable
end

