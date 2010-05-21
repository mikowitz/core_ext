class Array
  #
  # Transforms an array into an array of strings
  # containing the contents of the original array
  # joined into strings of length +length+
  #
  def to_lines_of_length(length=50)
    _this, _ret = self.dup, []
    while !_this.empty?
      _new_str, _this = _this.split_off_string_of_length(length)
      _ret << _new_str
    end
    _ret
  end

  def sum
    self.map{|item| Array(item) }.flatten.map(&:to_f).inject(&:+)
  end

  def split_off_string_of_length(length=50)
    _this, _new_str = self.dup, ""
    while _new_str.length < length && _new_str !~ /\n\s?$/
      break if _this.empty?
      _new_str << _this.shift << " "
    end
    [_new_str.strip, _this]
  end
end
