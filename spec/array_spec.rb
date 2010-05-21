require File.dirname(__FILE__) + "/spec_helper"

describe "Array" do
  describe "#to_lines_of_length should return arrays of the correct size" do
      before do
        @arr = %w{this is a short array}
        @nl_arr = ["force", "a", "\n", "new", "line"]
      end
      it "for a very short array" do
        arr = @arr.to_lines_of_length
        arr.size.should == 1
        arr.first.should == "this is a short array"
      end
      it "for an array that takes up two lines" do
        arr = @arr.to_lines_of_length(10)
        arr.size.should == 2
        arr.should == ["this is a", "short array"]
      end
      it "for an array that takes up three lines" do
        arr = @arr.to_lines_of_length(7)
        arr.size.should == 3
        arr.should == ["this is", "a short", "array"]
      end
      it "for an array containing a \\n character" do
        arr = @nl_arr.to_lines_of_length
        arr.size.should == 2
        arr.should == ["force a", "new line"]
      end
      it "for an array containing a \\n character with short lines" do
        arr = @nl_arr.to_lines_of_length(5)
        arr.size.should == 3
        arr.should == ["force", "a", "new line"]
      end
    end
  end

  describe "#sum should return the correct value" do
    it "for an array of only numbers" do
      [1,2,3,4.5,Math::PI].sum.should == 10.5 + Math::PI
    end
    it "for an array including strings" do
      [1,10,"4","hello"].sum.should == 15.0
    end
    it "for an array including an array and hash" do
      [[1,2,3], 5, "foo", {1 => 2, "3" => "hello"}].sum.should == 17.0
    end
  end
end

