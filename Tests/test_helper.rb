class Test::Unit::TestCase
  def null_object
    c = Class.new
    def c.method_missing(m, *args, &block)
    end
    c
  end
end