module SudokuSolver
  class BruteForceSolver
    include Bruteforcable

    def initialize(rows)
      @rows = rows
    end

    def solve
      table = Table.new(@rows)
      setup_for_brute_force(table.build_brute_force_corpus, table)
      sort_variables do |a, b|
        a.available_values_size <=> b.available_values_size
      end
      brute_force
    end
  end
end
