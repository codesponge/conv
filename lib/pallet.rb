require File.join(File.dirname(__FILE__),'array')
require File.join(File.dirname(__FILE__),'loop')

require 'rubygems'
require'yaml'

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
  
  
  def to_s
    hex_str
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
  
  def html_chip(index)
    chip_w,chip_h = 50,20
    "<div class='pallet color_chip' style='border:thin solid #000;'>
      <p class='pallet color_chip' style='background-color:#{hex_str};'>
        #{index}  #{hex_str}
      </p>
    </div>\n"
  end
  
end


class Pallet < Array
  include Loopable
  
  attr_reader :collection
  @@DEFAULTS = {:collection_name => :pantoneish }
  def initialize(*args)
    if(args.first.nil?) then
      load_default_collection
    elsif(args.first.class == Range) then
      load_range_from_collection(args.first)
    end
  end
  
  def get_collection_data(file_name)
    fileh = File.read(File.join(File.dirname(__FILE__),'pallets',"#{@@DEFAULTS[:collection_name]}.yaml"))
    dat = YAML.load(fileh)
    dat[ "#{@@DEFAULTS[:collection_name]}" ]
  end
  
  def load_range_from_collection(range)
    #collection choosing is not yet implemented
    col = get_collection_data("#{@@DEFAULTS[:collection_name]}.yaml")
    col[range].each do |c|
      self << Color.new(c)
    end
  end
  
  def load_default_collection
    in_ar = get_collection_data("#{@@DEFAULTS[:collection_name]}.yaml")
    in_ar.each do |c|
      self << Color.new(c)
    end
  end
  
  def html_chips
    blob = ''
    self.each_with_index do |c,i|
      blob << c.html_chip(i)
    end
    blob
  end

end

p = Pallet.new
#puts p.html_chips