class String
  def camel_case(capitalize_initial=false)
    self.gsub(/\_\w/) {|s| s[1].chr.upcase}.
      gsub(/^\w/) {|s| capitalize_initial ? s.upcase : s }
  end

  def snake_case
    self.gsub(/[A-Z]/) {|s| "_" + s.downcase}.gsub(/^\_/, "")
  end
end
