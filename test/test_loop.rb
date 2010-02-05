require 'helper'

class TestConv < Test::Unit::TestCase
  context "A Loop instance " do
    
    setup do
      @al = Loop.new([1,2,3,4,5,"hog","cannon","globe"])
    end
    
    should "be class loop" do
      assert_equal @al.class, Loop
    end
    
    @expected_methods = %w[next prev forward backward current set_position position]
    @expected_methods.each do |m|    
      should "respond to #{m}" do
        assert_respond_to(@al, m)
      end
      
    end
    
    should "go next and prev" do
      c = @al.current
      n = @al.next
      b = @al.prev
      assert_equal c,b
    end
    
    should "loop from end of array back to begining" do
      @al.set_position(@al.size - 1) # last element
      #the "next" element after the last should be the first
      #element
      assert_equal @al.next, @al.first
    end
    
    should "loop from begining to end when stepping backwards" do
      @al.set_position(0) #first element
      #the "prev" element should be the same as the last element
      assert_equal @al.prev,@al.last
    end
    
    
  end
  
end