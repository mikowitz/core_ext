require File.dirname(__FILE__) + "/spec_helper"

class Foo
  attr_validate :name

  def initialize(name=nil)
    @name = name
  end

  def validate_name
    raise ArgumentError if @name.nil?
  end
end

describe "Object" do
  describe "with a validation on the presence of @name" do
    before { @foo = Foo.new }
    describe "#validate" do
      describe "when the validation is not met" do
        it "should raise an error" do
          lambda { @foo.validate }.should raise_error(ArgumentError)
        end
      end
      describe "when the validation is met" do
        before { @foo = Foo.new("my name") }
        it "should not raise an error" do
          lambda { @foo.validate }.should_not raise_error(ArgumentError)
        end
        it "but should raise an error when the object is modified to not meet the validation" do
          lambda { @foo.name = nil }.should raise_error(ArgumentError)
        end
      end
    end
  end
end
