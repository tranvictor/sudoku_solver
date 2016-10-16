require 'minitest/autorun'

class SudokuSolverTest < Minitest::Test
  def test_outter_most_solve_method
    input = [
      [6, 2, nil, 8, 1, 3, 7, 5, 4],
      [7, 8, 3, 9, 5, 4, 6, 2, 1],
      [5, 1, 4, 6, 7, 2, 3, 9, 8],
      [1, 7, 5, 2, 3, 8, 9, 4, 6],
      [9, 3, 2, 4, 6, 1, 8, 7, 5],
      [4, 6, 8, 7, 9, 5, 1, 3, 2],
      [3, 9, 1, 5, 4, 6, 2, 8, 7],
      [8, 4, 6, 3, 2, 7, 5, 1, 9],
      [2, 5, 7, nil, 8, 9, 4, 6, 3]
    ]

    output = SudokuSolver.solve(input)
    assert(SudokuSolver::Table.new(output).final_state?)
  end

  def test_solver
    input = [
      [6, 2, nil, 8, 1, 3, 7, 5, 4],
      [7, 8, 3, 9, 5, 4, 6, 2, 1],
      [5, 1, 4, 6, 7, 2, 3, 9, 8],
      [1, 7, 5, 2, 3, 8, 9, 4, 6],
      [9, 3, 2, 4, 6, 1, 8, 7, 5],
      [4, 6, 8, 7, 9, 5, 1, 3, 2],
      [3, 9, 1, 5, 4, 6, 2, 8, 7],
      [8, 4, 6, 3, 2, 7, 5, 1, 9],
      [2, 5, 7, nil, 8, 9, 4, 6, 3]
    ]

    solver = SudokuSolver::BruteForceSolver.new(input)
    output = solver.solve
    assert(output.final_state?, "Failed! The result is not valid")
  end

  def test_solver_many_slots
    input = [
      [nil, nil, nil, nil, 1, 3, nil, 5, nil],
      [7, nil, nil, 9, 5, nil, 6, nil, nil],
      [5, nil, nil, nil, nil, 2, nil, 9, 8],
      [nil, nil, nil, 2, nil, 8, 9, nil, 6],
      [nil, nil, nil, nil, 6, nil, nil, nil, nil],
      [4, nil, 8, 7, nil, 5, nil, nil, nil],
      [3, 9, nil, 5, nil, nil, nil, nil, 7],
      [nil, nil, 6, nil, 2, 7, nil, nil, 9],
      [nil, 5, nil, 1, 8, nil, nil, nil, nil],
    ]

    solver = SudokuSolver::BruteForceSolver.new(input)
    output = solver.solve
    assert(output.final_state?, "Failed! The result is not valid")
  end

  def test_solver_many_slots_2
    input = [
      [9, nil, nil, nil, nil, 7, nil, nil, nil],
      [nil, 6, 2, nil, 3, nil, nil, nil, 7],
      [nil, nil, nil, nil, nil, 8, 2, nil, nil],
      [nil, 2, 5, nil, nil, nil, 4, nil, 1],
      [nil, 7, 6, 3, nil, 5, 9, 2, nil],
      [1, nil, 8, nil, nil, nil, 5, 7, nil],
      [nil, nil, 9, 5, nil, nil, nil, nil, nil],
      [2, nil, nil, nil, 9, nil, 8, 3, nil],
      [nil, nil, nil, 7, nil, nil, nil, nil, 5],
    ]

    solver = SudokuSolver::BruteForceSolver.new(input)
    output = solver.solve
    assert(output.final_state?, "Failed! The result is not valid")
  end

  # def test_solver_many_slots_3
  #   input = [
  #     [nil, 8, nil, nil, nil, nil, nil, nil, 5],
  #     [nil, nil, nil, nil, 4, nil, nil, nil, nil],
  #     [5, nil, nil, nil, nil, nil, nil, nil, 6],
  #     [nil, 4, 1, nil, nil, nil, 8, nil, nil],
  #     [nil, nil, nil, 3, nil, 8, nil, nil, nil],
  #     [nil, 9, nil, nil, nil, nil, nil, nil, nil],
  #     [nil, nil, nil, nil, nil, 5, nil, nil, nil],
  #     [3, nil, nil, 6, nil, 7, nil, nil, nil],
  #     [nil, nil, nil, nil, nil, nil, 4, 1, nil],
  #   ]

  #   solver = SudokuSolver.new(input)
  #   output = solver.solve
  #   assert(output.final_state?, "Failed! The result is not valid")
  # end

  def test_solver_all_empty
    input = [
      [nil, nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil, nil],
    ]

    solver = SudokuSolver::BruteForceSolver.new(input)
    output = solver.solve
    assert(output.final_state?, "Failed! The result is not valid")
  end
end
