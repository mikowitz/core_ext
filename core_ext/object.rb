class Object
  def self.attr_validate *args
    create_validation_framework
    args.each do |arg|
      create_accessors_for(arg)
    end
  end

  def self.create_validation_framework
    class_eval <<-RUBY
      @_validations = []
      def self.validations; @_validations; end
      def validate
        self.class.validations.each do |validation|
          self.__send__(validation) if self.respond_to?(validation)
        end
      end
    RUBY
  end

  def self.create_accessors_for(arg)
    class_eval <<-RUBY
      @_validations << :"validate_#{arg}"
      def #{arg}; @#{arg}; end
      def #{arg}=(value)
        @#{arg} = value
        self.validate
      end
    RUBY
  end
end
