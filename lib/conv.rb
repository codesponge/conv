#!/usr/bin/env ruby -wKU


#Files to load when conv in required
%w{array loop pallet}.each { |file| require File.join(File.dirname(__FILE__),file) }
