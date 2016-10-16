# Bruteforcable module provides conventional brute-force search mechanism
# for any classes, objects that can handle message `build_brute_force_corpus`.
#
# By including Bruteforcable, the class is responsible for calling
# `setup_for_brute_force(corpus, initial_state)` before issuing brute force
# process by calling `brute_force`.
#
# Brute force basically try to assign available value to every variables and apply
# to the state to see if it's a stop state.
#
# The process stops as soon as it reach a stop state.
#
# *Duck typing requirements:*
#
# `corpus` is supposed to handle these messages:
#   1. `no_variables` which usually means number of variables
#   2. `available_values(index)` which returns a set of available values for
#       variable number index
#   3. `variable_at(index)` returns variable instance number index
#   4. `sort_variable(&comp_func)` (optional) sort all variables as compare
#       function passed as a block
#   5. `acquire(variable, value)`, strategy to handle value before assigning
#       it to the variable
#   6. `release(variable, value)`, strategy to handle value before assigning
#       the variable to another value
#
# `initial_state` is supposed to handle these messages:
#   1. `final_state?` which returns true if it's a stop state, false otherwise
#   2. `apply(variable, value)` which apply a variable with specified value
#       to itself
#
module Bruteforcable
  attr_accessor :corpus
  attr_accessor :state

  def brute_force
    if self.corpus.no_variables > 0
      try(corpus, 0, self.state)
    end
    return (self.state.final_state? ? self.state : nil)
  end

  def try(corpus, index, state)
    variable = corpus.variable_at(index)
    corpus.available_values(variable).each do |value|
      corpus.acquire(variable, value)
      state.apply(corpus.variable_at(index), value)
      if index == corpus.no_variables - 1
        return true if state.final_state?
      else
        return true if try(corpus, index + 1, state)
      end
      corpus.release(variable, value)
    end
    return false
  end

  def setup_for_brute_force(corpus, initial_state)
    self.corpus = corpus
    self.state = initial_state
  end

  def sort_variables(&comp_func)
    if comp_func
      self.corpus.sort_variables do |a, b|
        comp_func.call(a, b)
      end
    else
      self.curpus.sort_variables
    end
  end
end
