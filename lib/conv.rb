#Files to load when conv in required
%w{array loop pallet}.each do |file|
  require File.join(File.dirname(__FILE__),file)

end
