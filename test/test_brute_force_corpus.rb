require 'minitest/autorun'
require 'sudoku_solver'

class BruteForceCorpusTest < Minitest::Test
  def test_no_variables_is_0_at_initialization
    corpus = SudokuSolver::BruteForceCorpus.new
    assert(corpus.no_variables == 0)
  end

  def test_no_variables_is_increased_after_adding_variables
    corpus = SudokuSolver::BruteForceCorpus.new
    corpus.add_variable(1, 1)
    assert(corpus.no_variables == 1)
  end

  def test_add_variable_adds_variable_instance_to_variable_list
    corpus = SudokuSolver::BruteForceCorpus.new
    corpus.add_variable(1, 1)
    assert(corpus.variable_at(0).is_a?(SudokuSolver::Variable))
  end

  def test_variable_at_gets_variable_at_specified_index
    corpus = SudokuSolver::BruteForceCorpus.new
    corpus.add_variable(1, 1)
    corpus.add_variable(1, 2)
    corpus.add_variable(3, 4)
    variable = corpus.variable_at(2)
    assert(variable.row == 3 && variable.col == 4)
  end

  def test_acquire_remove_value_from_row_col_and_square_that_the_variable_belongs_to
    corpus = SudokuSolver::BruteForceCorpus.new
    corpus.acquire(SudokuSolver::Variable.new(1, 1, corpus), 1)
    value_for_row_1 = corpus.available_values(
      SudokuSolver::Variable.new(1, 2, corpus))
    assert(!value_for_row_1.include?(1))
    value_for_col_1 = corpus.available_values(
      SudokuSolver::Variable.new(2, 1, corpus))
    assert(!value_for_col_1.include?(1))
    value_for_sq = corpus.available_values(
      SudokuSolver::Variable.new(2, 2, corpus))
    assert(!value_for_sq.include?(1))
  end

  def test_release_add_value_to_row_col_and_square_that_the_variable_belongs_to
    corpus = SudokuSolver::BruteForceCorpus.new
    corpus.acquire(SudokuSolver::Variable.new(1, 1, corpus), 1)
    corpus.release(SudokuSolver::Variable.new(1, 1, corpus), 1)
    value_for_row_1 = corpus.available_values(
      SudokuSolver::Variable.new(1, 2, corpus))
    assert(value_for_row_1.include?(1))
    value_for_col_1 = corpus.available_values(
      SudokuSolver::Variable.new(2, 1, corpus))
    assert(value_for_col_1.include?(1))
    value_for_sq = corpus.available_values(
      SudokuSolver::Variable.new(2, 2, corpus))
    assert(value_for_sq.include?(1))
  end

  def test_available_values_returns_values_that_the_variable_can_be_assigned
    corpus = SudokuSolver::BruteForceCorpus.new
    corpus.acquire(SudokuSolver::Variable.new(1, 1, corpus), 1)
    corpus.acquire(SudokuSolver::Variable.new(1, 2, corpus), 2)
    corpus.acquire(SudokuSolver::Variable.new(1, 3, corpus), 3)
    corpus.acquire(SudokuSolver::Variable.new(1, 4, corpus), 4)
    corpus.acquire(SudokuSolver::Variable.new(1, 5, corpus), 5)
    corpus.acquire(SudokuSolver::Variable.new(1, 6, corpus), 6)
    corpus.acquire(SudokuSolver::Variable.new(1, 7, corpus), 7)
    corpus.acquire(SudokuSolver::Variable.new(1, 8, corpus), 8)

    value_for_row = corpus.available_values(
      SudokuSolver::Variable.new(1, 0, corpus))
    assert(value_for_row.size == 1)
    assert(value_for_row.to_a[0] == 9)
  end

  def test_sort_variables_sorts_variable_by_a_block
    corpus = SudokuSolver::BruteForceCorpus.new
    corpus.add_variable(1, 1)
    corpus.add_variable(0, 1)
    corpus.sort_variables do |v1, v2|
      v1.row <=> v2.row
    end
    assert(corpus.variable_at(0).row == 0)
    assert(corpus.variable_at(1).row == 1)
  end
end
