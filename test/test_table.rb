require 'minitest/autorun'
require 'sudoku_solver'

class TableTest < Minitest::Test
  def test_final_state_true
    table = SudokuSolver::Table.new([
      [6, 2, 9, 8, 1, 3, 7, 5, 4],
      [7, 8, 3, 9, 5, 4, 6, 2, 1],
      [5, 1, 4, 6, 7, 2, 3, 9, 8],
      [1, 7, 5, 2, 3, 8, 9, 4, 6],
      [9, 3, 2, 4, 6, 1, 8, 7, 5],
      [4, 6, 8, 7, 9, 5, 1, 3, 2],
      [3, 9, 1, 5, 4, 6, 2, 8, 7],
      [8, 4, 6, 3, 2, 7, 5, 1, 9],
      [2, 5, 7, 1, 8, 9, 4, 6, 3]]
    )

    assert(table.final_state?, "Failed! Expected the final_state? returns true")
  end

  def test_final_state_false_because_of_missing_slots
    table = SudokuSolver::Table.new([
      [6, 2, nil, 8, 1, 3, 7, 5, 4],
      [7, 8, 3, 9, 5, 4, 6, 2, 1],
      [5, 1, 4, 6, 7, 2, 3, 9, 8],
      [1, 7, 5, 2, 3, 8, 9, 4, 6],
      [9, 3, 2, 4, 6, 1, 8, 7, 5],
      [4, 6, 8, 7, 9, 5, 1, 3, 2],
      [3, 9, 1, 5, 4, 6, 2, 8, 7],
      [8, 4, 6, 3, 2, 7, 5, 1, 9],
      [2, 5, 7, nil, 8, 9, 4, 6, 3]]
    )

    assert(
      !table.final_state?,
      "Failed! Expected the final_state? returns false if any slots are missing")
  end

  def test_final_state_false_because_of_dup_value
    table = SudokuSolver::Table.new([
      [6, 2, 9, 8, 1, 3, 7, 5, 4],
      [7, 8, 3, 9, 5, 4, 6, 2, 1],
      [5, 1, 4, 6, 7, 2, 3, 9, 8],
      [1, 7, 5, 2, 3, 8, 9, 4, 6],
      [9, 3, 2, 4, 6, 1, 8, 7, 5],
      [4, 6, 8, 7, 9, 5, 1, 3, 2],
      [3, 9, 1, 5, 4, 6, 2, 8, 7],
      [8, 4, 6, 3, 2, 7, 5, 2, 9],
      [2, 5, 7, 1, 8, 9, 4, 6, 3]]
    )

    assert(
      !table.final_state?,
      "Failed! Expected the final_state? returns false if any slots are duplicated")
  end
end
