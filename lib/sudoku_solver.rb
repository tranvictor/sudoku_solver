require "sudoku_solver/version"
require "sudoku_solver/brute_force/bruteforcable"
require "sudoku_solver/table"
require "sudoku_solver/variable"
require "sudoku_solver/brute_force_corpus"
require "sudoku_solver/brute_force_solver"

# SudokuSolver provides convenient API to solve a sudoku puzzle:
# `SudokuSolver.solve(rows)`
#
# Parameter:
# `rows` should be 2D array like object which can be accessed via `each` to get
# each row and `each` on the row to get individual sudoku elements.
#
# Each element should has value from 1 to 9 except elements that need to figure
# out its value should be `nil` in order to be recognized by SudokuSolver.
#
# Example:
#
# ```ruby
# require 'sudoku_solver'
#
# rows = []
# (0..8).each
#   rows << gets.split(' ').map do |element|
#     element.to_i == 0 ? nil : element.to_i
#   end
# end
#
# solved_sudoku = SudokuSolver.solve(rows)
#
# solved_sudoku.each { |row| puts row.join(' ') }
# ```
#
module SudokuSolver
  def SudokuSolver.solve(rows)
    final_table = BruteForceSolver.new(rows).solve
    final_table.to_a
  end
end
