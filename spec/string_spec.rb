require File.dirname(__FILE__) + "/spec_helper"

describe "String" do
  before do
    @single = "method"
    @long   = "longer_method_name"
  end
  describe "#camel_case" do
    describe "should, by default, not capitalize the first letter" do
      it "for a short method name" do
        @single.camel_case.should == "method"
      end
      it "for a longer method name" do
        @long.camel_case.should == "longerMethodName"
      end
    end
    describe "should capitalize the first letter if true is passed as the first argument" do
      it "for a short method name" do
        @single.camel_case(true).should == "Method"
      end
      it "for a longer method name" do
        @long.camel_case(true).should == "LongerMethodName"
      end
    end
  end

  describe "#snake_case" do
    before do
      @single_cap = "Method"
      @long = "longerMethodName"
      @long_cap = "LongerMethodName"
    end
    describe "for a short method" do
      it "should return a downcased version" do
        @single.snake_case.should == "method"
      end
      it "should return a downcased version for a capitalized string" do
        @single_cap.snake_case.should == "method"
      end
    end
    describe "for a longer method" do
      it "should return a downcased version with '_'s" do
        @long.snake_case.should == "longer_method_name"
      end
      it "shourd return a downcased version with '_'s for a capitalized string" do
        @long_cap.snake_case.should == "longer_method_name"
      end
    end
  end
end
