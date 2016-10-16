require 'minitest/autorun'
require 'sudoku_solver'

# We are going to demonstrate using bruteforcable to solve an equation
# of: x^3 + y^3 = 2000
# where x, y are positive integer
class DumpCorpus
  def no_variables
    2
  end

  def available_values(index)
    1..10
  end

  def acquire(variable, value)
  end

  def release(variable, value)
  end

  def variable_at(index)
    if index == 0
      "x"
    elsif index == 1
      "y"
    end
  end
end

class DumpEquationState
  attr_accessor :x, :y

  def final_state?
    self.x ** 3 + self.y ** 3 == 2000
  end

  def apply(variable, value)
    if variable == "x"
      self.x = value
    elsif variable == "y"
      self.y = value
    end
  end
end

class EquationSolver
  include Bruteforcable

  def initialize
    corpus = DumpCorpus.new
    initial_state = DumpEquationState.new
    setup_for_brute_force(corpus, initial_state)
  end

  def solve
    brute_force
  end
end

class BruteforcableTest < Minitest::Test
  def test_bruteforcable_provide_a_brute_force_process_to_any_problem
    solver = EquationSolver.new
    result = solver.solve
    assert(result.x == 10 && result.y == 10)
  end
end
