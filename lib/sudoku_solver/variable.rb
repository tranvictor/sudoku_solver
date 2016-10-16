module SudokuSolver
  class Variable
    attr_accessor :row, :col, :corpus

    def initialize(row, col, corpus)
      self.row = row
      self.col = col
      self.corpus = corpus
    end

    def available_values_size
      corpus.available_values(self).size
    end
  end
end
