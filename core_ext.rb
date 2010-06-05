$:.unshift File.dirname(__FILE__) + "/core_ext"

%w{ array enumerable object string }.each do |file|
  require file
end
