# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sudoku_solver/version'

Gem::Specification.new do |spec|
  spec.name          = "guava_sudoku_solver"
  spec.version       = SudokuSolver::VERSION
  spec.authors       = ["victor"]
  spec.email         = ["vu.tran54@gmail.com"]
  spec.summary       = %q{Solver for sudoku 9x9}
  spec.description   = %q{Provide convenient way to solve a sudoku challenge}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 10.0"
end
