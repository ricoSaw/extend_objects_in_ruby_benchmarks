

#
# Example code
#

# via extends

module SuperFuntionalityDyn
  def additional_funtionality
    10.times do
      @foo *= @foo
    end
  end
end

class MyObjectDyn

  attr_accessor :foo

  def initialize
    @foo = 2
  end
end


# via composition

class SuperFuntionalityClazzDyn

  def initialize decorate_me
    @decorated_obj = decorate_me
  end

  def additional_funtionality
    10.times do
      @decorated_obj.foo *= @decorated_obj.foo
    end
  end
end

class MyObjectClazzDyn

  attr_accessor :foo

  def initialize
    @foo = 2
  end
end


# Wrapper Object

class WrapperObjectDyn

  class << self
    def feature_via_extends
      obj_with_functionality = MyObjectDyn.new
      obj_with_functionality.extend ::SuperFuntionalityDyn
      obj_with_functionality.additional_funtionality
    end

    def feature_via_composition
      obj_with_functionality = SuperFuntionalityClazzDyn.new( MyObjectClazzDyn.new )
      obj_with_functionality.additional_funtionality
    end
  end
end


#
# Benchmarks
#

Benchmark.bmbm do |bm|
  bm.report('Dynamic via exclude') do
    ITERATIONS_FOR_BENCHMARK.times do
      WrapperObjectDyn.feature_via_extends
    end
  end

  bm.report('Dynamic via composition on plain old ruby objects') do
    ITERATIONS_FOR_BENCHMARK.times do
      WrapperObjectDyn.feature_via_composition
    end
  end
end

