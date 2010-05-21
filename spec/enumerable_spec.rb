require File.dirname(__FILE__) + "/spec_helper"

describe "Enumerable" do
  describe "#map_with_index" do
    before do
      @arr = [1,2,3,4,5]
      @mapped = @arr.map_with_index do |n, i|
        n * i
      end
    end
    it "should return the correct array" do
      @mapped.should == [0, 2, 6, 12, 20]
    end
    it "should not change the original array" do
      @arr.should == [1,2,3,4,5]
    end
  end
  describe "#map_with_index!" do
    before do
      @arr = [1,2,3,4,5]
      @mapped = @arr.map_with_index! do |n, i|
        n * i
      end
    end
    it "should return the correct array" do
      @mapped.should == [0, 2, 6, 12, 20]
    end
    it "should change the original array" do
      @arr.should_not == [1,2,3,4,5]
    end
  end
end
