$:.unshift File.dirname(__FILE__) + "/core_ext"

%w{ array }.each do |file|
  require file
end
