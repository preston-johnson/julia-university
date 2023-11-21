# Introduction to Whole Numbers
# https://openstax.org/books/prealgebra-2e/pages/1-1-introduction-to-whole-numbers

section(name::String) = println("-----\n", name)

# A number is positive if it is greater than zero.
ispositive(n::Number) = n > 0
# A number is negative if it is less than zero.
isnegative(n::Number) = n < 0
# A number has no remainder if it is evenly divisible by 1.
noremainder(n::Number) = n % 1 == 0
# A number is a "counting number" if it is positive and has no remainder.
iscounting(n::Number) = noremainder(n) && ispositive(n)
# A number is nonnegative if it is positive or zero.
nonnegative(n::Number) = ispositive(n) || n == 0
# A number is whole if it is nonnegative and has no remainder.
iswhole(n::Number) = noremainder(n) && nonnegative(n)

section("Example 1.1")
example_1_1 = [0, 1//4, 3, 5.2, 15, 105]
counting_numbers = [Int(n) for n in example_1_1 if iscounting(n)]
whole_numbers = [Int(n) for n in example_1_1 if iswhole(n)]
println("Given: $(example_1_1)")
println("Counting numbers: ", counting_numbers)
println("Whole numbers: ", whole_numbers)

section("Try It 1.1")
try_it_1_1 = [0, 2//3, 2, 9, 11.8, 241, 376]
counting_numbers = [Int(n) for n in try_it_1_1 if iscounting(n)]
whole_numbers = [Int(n) for n in try_it_1_1 if iswhole(n)]
println("Given: $(try_it_1_1)")
println("Counting numbers: ", counting_numbers)
println("Whole numbers: ", whole_numbers)

section("Try It 1.2")
try_it_1_2 = [0, 5//3, 7, 8.8, 13, 201]
counting_numbers = [Int(n) for n in try_it_1_2 if iscounting(n)]
whole_numbers = [Int(n) for n in try_it_1_2 if iswhole(n)]
println("Given: $(try_it_1_2)")
println("Counting numbers: ", counting_numbers)
println("Whole numbers: ", whole_numbers)

place_values(;ones=0, tens=0, hundreds=0) = ones + (tens * 10) + (hundreds * 100)

section("Example 1.2")
example_1_2 = place_values(ones=5, tens=1, hundreds=2)
println("Given: ones=5, tens=1, hundreds=2")
println("Place value: ", example_1_2)

section("Try It 1.3")
try_it_1_3 = place_values(ones=6, tens=7, hundreds=1)
println("Given: ones=6, tens=7, hundreds=1")
println("Place value: ", try_it_1_3)

section("Try It 1.4")
try_it_1_4 = place_values(ones=7, tens=3, hundreds=2)
println("Given: ones=7, tens=3, hundreds=2")
println("Place value: ", try_it_1_4)

function get_place_value(digit::Int, value::Int)
    places = Dict(
        1 => "ones",
        10 => "tens",
        100 => "hundreds",
        1000 => "thousands",
        10_000 => "ten thousands",
        100_000 => "hundred thousands",
        1_000_000 => "millions",
        10_000_000 => "ten millions",
        100_000_000 => "hundred millions",
        1_000_000_000 => "billions",
        10_000_000_000 => "ten billions",
        100_000_000_000 => "hundred billions",
        1_000_000_000_000 => "trillions")
    
    value_string = string(value)
    digit_string = string(digit)
    digit_position = findfirst(digit_string, value_string)
    if typeof(digit_position) === Nothing
        return "Not found."
    end
    return places[10 ^ (length(value_string) - digit_position[1])]
end

section("Example 1.3")
example_1_3 = 63_407_218
println("Given: ", example_1_3)
# FInd the place values of 7, 0, 1, 6, and 3
println("Place value of 7: ", get_place_value(7, example_1_3))
println("Place value of 0: ", get_place_value(0, example_1_3))
println("Place value of 1: ", get_place_value(1, example_1_3))
println("Place value of 6: ", get_place_value(6, example_1_3))
println("Place value of 3: ", get_place_value(3, example_1_3))

section("Try It 1.5")
try_it_1_5 = 27_493_615
println("Given: ", try_it_1_5)
# FInd the place values of 2, 1, 4, 7, and 5
println("Place value of 2: ", get_place_value(2, try_it_1_5))
println("Place value of 1: ", get_place_value(1, try_it_1_5))
println("Place value of 4: ", get_place_value(4, try_it_1_5))
println("Place value of 7: ", get_place_value(7, try_it_1_5))
println("Place value of 5: ", get_place_value(5, try_it_1_5))

section("Try It 1.6")
try_it_1_6 = 519_711_641_328
println("Given: ", try_it_1_6)
# Find the place values of 9, 4, 2, 6, and 7
println("Place value of 9: ", get_place_value(9, try_it_1_6))
println("Place value of 4: ", get_place_value(4, try_it_1_6))
println("Place value of 2: ", get_place_value(2, try_it_1_6))
println("Place value of 6: ", get_place_value(6, try_it_1_6))
println("Place value of 7: ", get_place_value(7, try_it_1_6))

# Conversion of numbers to English words is (maybe) surprisingly difficult for computers.
# This step is omitted for the sake of brevity.

round_to_nearest(;n=0, nearest=1) = Int(round(n / nearest) * nearest)

section("Example 1.8")
example_1_8 = 843
println("Given: ", example_1_8)
println("Rounded to the nearest ten: ", round_to_nearest(n=example_1_8, nearest=10))

section("Try It 1.15")
try_it_1_15 = 157
println("Given: ", try_it_1_15)
println("Rounded to the nearest ten: ", round_to_nearest(n=try_it_1_15, nearest=10))

section("Try It 1.16")
try_it_1_16 = 884
println("Given: ", try_it_1_16)
println("Rounded to the nearest ten: ", round_to_nearest(n=try_it_1_16, nearest=10))

section("Example 1.9")
example_1_9_a = 23_658
example_1_9_b = 3_978
println("Given: ", example_1_9_a, " and ", example_1_9_b)
println("Rounded to the nearest hundred: ", round_to_nearest(n=example_1_9_a, nearest=100))
println("Rounded to the nearest hundred: ", round_to_nearest(n=example_1_9_b, nearest=100))

section("Try It 1.17")
try_it_1_17 = 17_852
println("Given: ", try_it_1_17)
println("Rounded to the nearest hundred: ", round_to_nearest(n=try_it_1_17, nearest=100))

section("Try It 1.18")
try_it_1_18 = 4_951
println("Given: ", try_it_1_18)
println("Rounded to the nearest hundred: ", round_to_nearest(n=try_it_1_18, nearest=100))

section("Example 1.10")
example_1_10_a = 147_032
example_1_10_b = 29_504
println("Given: ", example_1_10_a, " and ", example_1_10_b)
println("Rounded to the nearest thousand: ", round_to_nearest(n=example_1_10_a, nearest=1000))
println("Rounded to the nearest thousand: ", round_to_nearest(n=example_1_10_b, nearest=1000))

section("Try It 1.19")
try_it_1_19 = 63_921
println("Given: ", try_it_1_19)
println("Rounded to the nearest thousand: ", round_to_nearest(n=try_it_1_19, nearest=1000))

section("Try It 1.20")
try_it_1_20 = 156_437
println("Given: ", try_it_1_20)
println("Rounded to the nearest thousand: ", round_to_nearest(n=try_it_1_20, nearest=1000))

# Exercises

section("Exercises for 1.1")

exercise_1_1_1 = [0, 2//3, 5, 8.1, 125]
counting_numbers = [Int(n) for n in exercise_1_1_1 if iscounting(n)]
whole_numbers = [Int(n) for n in exercise_1_1_1 if iswhole(n)]
println("\nGiven: $(exercise_1_1_1)")
println("Counting numbers: ", counting_numbers)
println("Whole numbers: ", whole_numbers)

exercise_1_1_2 = [0, 7//10, 3, 20.5, 300]
counting_numbers = [Int(n) for n in exercise_1_1_2 if iscounting(n)]
whole_numbers = [Int(n) for n in exercise_1_1_2 if iswhole(n)]
println("\nGiven: $(exercise_1_1_2)")
println("Counting numbers: ", counting_numbers)
println("Whole numbers: ", whole_numbers)

exercise_1_1_3 = [0, 4//9, 3.9, 50, 221]
counting_numbers = [Int(n) for n in exercise_1_1_3 if iscounting(n)]
whole_numbers = [Int(n) for n in exercise_1_1_3 if iswhole(n)]
println("\nGiven: $(exercise_1_1_3)")
println("Counting numbers: ", counting_numbers)
println("Whole numbers: ", whole_numbers)

exercise_1_1_4 = [0, 3//5, 10, 303, 422.6]
counting_numbers = [Int(n) for n in exercise_1_1_4 if iscounting(n)]
whole_numbers = [Int(n) for n in exercise_1_1_4 if iswhole(n)]
println("\nGiven: $(exercise_1_1_4)")
println("Counting numbers: ", counting_numbers)
println("Whole numbers: ", whole_numbers)

exercise_1_1_5 = place_values(ones=1, tens=6, hundreds=5)
println("\nGiven: ones=1, tens=6, hundreds=5")
println("Place value: ", exercise_1_1_5)

exercise_1_1_6 = place_values(ones=4, tens=8, hundreds=3)
println("\nGiven: ones=4, tens=8, hundreds=3")
println("Place value: ", exercise_1_1_6)

exercise_1_1_7 = place_values(ones=7, tens=0, hundreds=4)
println("\nGiven: ones=7, tens=0, hundreds=4")
println("Place value: ", exercise_1_1_7)

exercise_1_1_8 = place_values(ones=0, tens=2, hundreds=6)
println("\nGiven: ones=0, tens=2, hundreds=6")
println("Place value: ", exercise_1_1_8)

exercise_1_1_9 = 579_601
println("\nGiven: ", exercise_1_1_9)
# FInd the place values of 9, 6, 0, 7, and 5
println("Place value of 9: ", get_place_value(9, exercise_1_1_9))
println("Place value of 6: ", get_place_value(6, exercise_1_1_9))
println("Place value of 0: ", get_place_value(0, exercise_1_1_9))
println("Place value of 7: ", get_place_value(7, exercise_1_1_9))
println("Place value of 5: ", get_place_value(5, exercise_1_1_9))

exercise_1_1_10 = 398_127
println("\nGiven: ", exercise_1_1_10)
# FInd the place values of 9, 3, 2, 8, and 7
println("Place value of 9: ", get_place_value(9, exercise_1_1_10))
println("Place value of 3: ", get_place_value(3, exercise_1_1_10))
println("Place value of 2: ", get_place_value(2, exercise_1_1_10))
println("Place value of 8: ", get_place_value(8, exercise_1_1_10))
println("Place value of 7: ", get_place_value(7, exercise_1_1_10))

exercise_1_1_11 = 56_804_379
println("\nGiven: ", exercise_1_1_11)
# FInd the place values of 8, 6, 4, 7, and 0
println("Place value of 8: ", get_place_value(8, exercise_1_1_11))
println("Place value of 6: ", get_place_value(6, exercise_1_1_11))
println("Place value of 4: ", get_place_value(4, exercise_1_1_11))
println("Place value of 7: ", get_place_value(7, exercise_1_1_11))
println("Place value of 0: ", get_place_value(0, exercise_1_1_11))

exercise_1_1_12 = 78_320_465
println("\nGiven: ", exercise_1_1_12)
# FInd the place values of 8, 4, 2, 6, and 7
println("Place value of 8: ", get_place_value(8, exercise_1_1_12))
println("Place value of 4: ", get_place_value(4, exercise_1_1_12))
println("Place value of 2: ", get_place_value(2, exercise_1_1_12))
println("Place value of 6: ", get_place_value(6, exercise_1_1_12))
println("Place value of 7: ", get_place_value(7, exercise_1_1_12))

# Conversion of numbers to English words is skipped here, as above.

exercise_1_1_43_a = 386
exercise_1_1_43_b = 2_931
println("\nGiven: ", exercise_1_1_43_a, " and ", exercise_1_1_43_b)
println("Rounded to the nearest ten: ", round_to_nearest(n=exercise_1_1_43_a, nearest=10))
println("Rounded to the nearest ten: ", round_to_nearest(n=exercise_1_1_43_b, nearest=10))

exercise_1_1_44_a = 792
exercise_1_1_44_b = 5_647
println("\nGiven: ", exercise_1_1_44_a, " and ", exercise_1_1_44_b)
println("Rounded to the nearest ten: ", round_to_nearest(n=exercise_1_1_44_a, nearest=10))
println("Rounded to the nearest ten: ", round_to_nearest(n=exercise_1_1_44_b, nearest=10))

exercise_1_1_45_a = 13_748
exercise_1_1_45_b = 391_794
println("\nGiven: ", exercise_1_1_45_a, " and ", exercise_1_1_45_b)
println("Rounded to the nearest hundred: ", round_to_nearest(n=exercise_1_1_45_a, nearest=100))
println("Rounded to the nearest hundred: ", round_to_nearest(n=exercise_1_1_45_b, nearest=100))

exercise_1_1_46_a = 28_166
exercise_1_1_46_b = 481_628
println("\nGiven: ", exercise_1_1_46_a, " and ", exercise_1_1_46_b)
println("Rounded to the nearest hundred: ", round_to_nearest(n=exercise_1_1_46_a, nearest=100))
println("Rounded to the nearest hundred: ", round_to_nearest(n=exercise_1_1_46_b, nearest=100))

exercise_1_1_47_a = 1_492
exercise_1_1_47_b = 1_497
println("\nGiven: ", exercise_1_1_47_a, " and ", exercise_1_1_47_b)
println("Rounded to the nearest ten: ", round_to_nearest(n=exercise_1_1_47_a, nearest=10))
println("Rounded to the nearest ten: ", round_to_nearest(n=exercise_1_1_47_b, nearest=10))

exercise_1_1_48_a = 2_391
exercise_1_1_48_b = 2_795
println("\nGiven: ", exercise_1_1_48_a, " and ", exercise_1_1_48_b)
println("Rounded to the nearest thousand: ", round_to_nearest(n=exercise_1_1_48_a, nearest=1000))
println("Rounded to the nearest thousand: ", round_to_nearest(n=exercise_1_1_48_b, nearest=1000))

exercise_1_1_49_a = 63_994
exercise_1_1_49_b = 63_949
println("\nGiven: ", exercise_1_1_49_a, " and ", exercise_1_1_49_b)
println("Rounded to the nearest hundred: ", round_to_nearest(n=exercise_1_1_49_a, nearest=100))
println("Rounded to the nearest hundred: ", round_to_nearest(n=exercise_1_1_49_b, nearest=100))

exercise_1_1_50_a = 163_584
exercise_1_1_50_b = 163_246
println("\nGiven: ", exercise_1_1_50_a, " and ", exercise_1_1_50_b)
println("Rounded to the nearest thousand: ", round_to_nearest(n=exercise_1_1_50_a, nearest=1000))
println("Rounded to the nearest thousand: ", round_to_nearest(n=exercise_1_1_50_b, nearest=1000))

# Conversion of numbers to English words is skipped here, as above.

exercise_1_1_53 = 24_493
println("\nGiven: ", exercise_1_1_53)
println("Rounded to the nearest ten: ", round_to_nearest(n=exercise_1_1_53, nearest=10))
println("Rounded to the nearest hundred: ", round_to_nearest(n=exercise_1_1_53, nearest=100))
println("Rounded to the nearest thousand: ", round_to_nearest(n=exercise_1_1_53, nearest=1000))
println("Rounded to the nearest ten thousand: ", round_to_nearest(n=exercise_1_1_53, nearest=10_000))

exercise_1_1_54 = 18_549
println("\nGiven: ", exercise_1_1_54)
println("Rounded to the nearest ten: ", round_to_nearest(n=exercise_1_1_54, nearest=10))
println("Rounded to the nearest hundred: ", round_to_nearest(n=exercise_1_1_54, nearest=100))
println("Rounded to the nearest thousand: ", round_to_nearest(n=exercise_1_1_54, nearest=1000))
println("Rounded to the nearest ten thousand: ", round_to_nearest(n=exercise_1_1_54, nearest=10_000))

exercise_1_1_55 = 1_355_692_544
println("\nGiven: ", exercise_1_1_55)
println("Rounded to the nearest billion: ", round_to_nearest(n=exercise_1_1_55, nearest=1_000_000_000))
println("Rounded to the nearest hundred million: ", round_to_nearest(n=exercise_1_1_55, nearest=100_000_000))
println("Rounded to the nearest million: ", round_to_nearest(n=exercise_1_1_55, nearest=1_000_000))

exercise_1_1_56 = 149_597_888
println("\nGiven: ", exercise_1_1_56)
println("Rounded to the nearest hundred million: ", round_to_nearest(n=exercise_1_1_56, nearest=100_000_000))
println("Rounded to the nearest ten million: ", round_to_nearest(n=exercise_1_1_56, nearest=10_000_000))
println("Rounded to the nearest million: ", round_to_nearest(n=exercise_1_1_56, nearest=1_000_000))
