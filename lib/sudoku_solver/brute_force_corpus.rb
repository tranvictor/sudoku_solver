require 'set'

module SudokuSolver
  class BruteForceCorpus

    def initialize
      @variables = []
      @available_in_row = Array.new(9) { Set.new 1..9 }
      @available_in_col = Array.new(9) { Set.new 1..9 }
      @available_in_sq = Array.new(3) do
        Array.new(3) { Set.new 1..9 }
      end
    end

    def no_variables
      @variables.size
    end

    def add_variable(row, col)
      @variables << Variable.new(row, col, self)
    end

    def variable_at(index)
      @variables[index]
    end

    def acquire(variable, value)
      @available_in_row[variable.row].delete(value)
      @available_in_col[variable.col].delete(value)
      @available_in_sq[variable.row/3][variable.col/3].delete(value)
    end

    def release(variable, value)
      @available_in_row[variable.row].add(value)
      @available_in_col[variable.col].add(value)
      @available_in_sq[variable.row/3][variable.col/3].add(value)
    end

    def available_values(variable)
      @available_in_row[variable.row] &
        @available_in_col[variable.col] &
        @available_in_sq[variable.row/3][variable.col/3]
    end

    def sort_variables(&comp_func)
      if comp_func
        @variables.sort! do |a, b|
          comp_func.call(a, b)
        end
      else
        @variables.sort!
      end
    end
  end
end
