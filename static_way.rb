require 'benchmark'

#
# Example code
#

# via include

module SuperFuntionality
  def additional_funtionality
    10.times do
      @foo *= @foo
    end
  end
end

class MyObjectStatic

  attr_accessor :foo

  include ::SuperFuntionality

  def initialize
    @foo = 2
  end
end


# via generally inheritance

class SuperFuntionalityClazz
  def additional_funtionality
    10.times do
      @foo *= @foo
    end
  end
end

class MyObjectStaticClazz < SuperFuntionalityClazz

  attr_accessor :foo

  def initialize
    @foo = 2
  end
end


#
# Benchmarks
#

Benchmark.bmbm do |bm|
  bm.report('Static via include') do
    ITERATIONS_FOR_BENCHMARK.times do
      MyObjectStatic.new.additional_funtionality
    end
  end

  bm.report('Static via generally inheritance') do
    ITERATIONS_FOR_BENCHMARK.times do
      MyObjectStatic.new.additional_funtionality
    end
  end
end

