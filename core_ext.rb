$:.unshift File.dirname(__FILE__) + "/core_ext"

%w{ array enumerable }.each do |file|
  require file
end
