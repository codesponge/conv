require 'helper'

class TestConv < Test::Unit::TestCase
  context "An array" do
    setup do
      @ar = [1,2,3,4,5]
    end
    should "respond to rand" do
      assert @ar.respond_to?('rand')
    end
  end

end
