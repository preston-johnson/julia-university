# Add Whole Numbers
# https://openstax.org/books/prealgebra-2e/pages/1-2-add-whole-numbers

section(name::String) = println("-----\n", name)

isidentical(x::Any, y::Any) = x === y

section("Example 1.15")
println("0 + 11 = 11 ? :", isidentical(0 + 11, 11))
println("42 + 0 = 42 ? :", isidentical(42 + 0, 42))