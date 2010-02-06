require 'helper'

class TestPallet < Test::Unit::TestCase
  context "A pallet instance" do
    
    context "with out any arguments" do
      setup do
        @pal = Pallet.new()
      end
      
      should "Load a default collection of colors" do
        assert @pal.size > 0, " There are no colors!"
      end
      
      should "return an object of type Color" do
        assert_equal @pal.first.class, Color
      end
    
    
    
    end
    
    
    
  end
  
  
  
end