class Test::Unit::TestCase
  class NullObject
    def method_missing(m, *args, &block)
    end
  end
  def null_object
    @default_null_object ||= NullObject.new
  end
end