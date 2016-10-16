# SudokuSolver

SudokuSolver provides convenient API to solve a sudoku puzzle:
```ruby
SudokuSolver.solve(rows)
```

## Parameter:
  `rows` should be 2D array like object which can be accessed via `each` to get each row and `each` on the row to get individual sudoku elements.
  
  Each element should has value from 1 to 9 except elements that need to figure out its value should be `nil` in order to be recognized by SudokuSolver.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'guava_sudoku_solver'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install guava_sudoku_solver

## Usage
```ruby
  require 'sudoku_solver'

  rows = []
  (0..8).each
    rows << gets.split(' ').map do |element|
      element.to_i == 0 ? nil : element.to_i
    end
  end

  solved_sudoku = SudokuSolver.solve(rows)

  solved_sudoku.each { |row| puts row.join(' ') }
 ```
 
## Contributing

1. Fork it ( https://github.com/tranvictor/sudoku_solver/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
