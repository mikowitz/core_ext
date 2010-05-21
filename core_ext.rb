$:.unshift File.dirname(__FILE__) + "/core_ext"

%w{ array enumerable string }.each do |file|
  require file
end
