module Enumerable
  def map_with_index
    index = -1
    self.map{|element| index += 1; yield(element, index) }
  end

  def map_with_index! &block
    replace(self.map_with_index(&block))
  end
end
