require 'helper'

class TestArray < Test::Unit::TestCase
  context "An array" do
    setup do
      @ar = [1,2,3,4,5]
    end
    should "respond to rand" do
      assert @ar.respond_to?('rand')
    end

    should "return random element when rand is called" do
      re = @ar.rand
      assert @ar.include?(re)
    end
  end
end
