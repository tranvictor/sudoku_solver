module SudokuSolver
  class Table
    def initialize(rows)
      @data = Array.new(9) { Array.new(9, nil) }
      rows.each_with_index do |row, row_index|
        row.each_with_index do |element, col_index|
          @data[row_index][col_index] = element
        end
      end
    end

    def build_brute_force_corpus
      corpus = BruteForceCorpus.new
      (0..8).each do |row|
        (0..8).each do |col|
          if @data[row][col] == nil
            corpus.add_variable(row, col)
          else
            corpus.acquire(Variable.new(row, col, corpus), @data[row][col])
          end
        end
      end
      corpus
    end

    def apply(variable, value)
      @data[variable.row][variable.col] = value
    end

    def final_state?
      # check if every row is valid
      (0..8).each do |row|
        elements = []
        (0..8).each do |col|
          elements << @data[row][col]
        end
        return false unless valid?(elements)
      end

      # check if every column is valid
      (0..8).each do |col|
        elements = []
        (0..8).each do |row|
          elements << @data[row][col]
        end
        return false unless valid?(elements)
      end

      # check if every square is valid
      (0..2).each do |sq_row|
        (0..2).each do |sq_col|
          elements = []
          (0..2).each do |row|
            (0..2).each do |col|
              elements << @data[sq_row * 3 + row][sq_col * 3 + col]
            end
          end
          return false unless valid?(elements)
        end
      end
      return true
    end

    def to_a
      @data
    end

    private
    def valid?(elements)
      masks = Array.new(9, nil)
      elements.each do |element|
        return false if element == nil || masks[element - 1] != nil
        masks[element - 1] = 1
      end
      return true
    end
  end
end
