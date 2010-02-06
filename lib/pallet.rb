require'rubygems'
require'yaml'
require 'conv'


class Color

  def initialize(*args)
    begin
      if args.first.kind_of? String then
        set_hexval_from_string(args)
      end
    rescue ArgumentError => e
      puts "#{e}"
      puts "Bailing out till bad color is fixed in #{__FILE__} around line #{__LINE__}"
      
    end
  end
  
  
  def hex_val
    @hex_val
  end
  
  def hex_str
    "##{hex_val}"
  end
  
  def set_hexval_from_string(str)
      if (str.first.strip =~ /#*([A-F0-9]{3,6})/i) then
          val = $+
          if(val.size == 3) then
            val = "#{val[0] * 2}#{val[1] * 2}#{val[2] * 2}"
          end
          @hex_val = val
      else
          raise ArgumentError, "#{self} Expected a string of form '0F0F0F' or '#0F0F0F' got '#{str}'"
      end      
      true
  end  
  
  def html_chip
    chip_w,chip_h = 50,50
    "<div class='pallet color_chip'>
      <p class='pallet color_chip' background-color:#{hex_str};width:#{chip_w}px;height:#{chip_h}px;'>
        
      </p>
      #{hex_str}
    </div>"
  end
  
end


class Pallet < Array
  include Loopable
  
  attr_reader :collection
  @@DEFAULTS = {:collection_name => :pantoneish }
  def initialize(*args)
    if(args.first.nil?) then
      load_default_collection
    end
  end
  
  def load_default_collection
    fileh = File.read(File.join(File.dirname(__FILE__),'pallets',"#{@@DEFAULTS[:collection_name]}.yaml"))
    dat = YAML.load(fileh)
    in_ar = dat[ "#{@@DEFAULTS[:collection_name]}" ]
    in_ar.each do |c|
      self << Color.new(c)
    end
  end



end