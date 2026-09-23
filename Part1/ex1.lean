--1.3.9

--1. Define a function abs_diff that takes two natural numbers and returns the absolute value of their difference. Use only the constructs defined so far.
def abs_diff (x y : ℕ) : ℕ :=
    if x < y then
        y - x
    else
        x - y

#eval abs_diff 23 89
#eval abs_diff 101 89

--2. Define a function apply_twice_when_even that takes a function f and a natural number x and returns a function that applies f twice if x is even, and once otherwise.

def apply_twice_when_even (f : ℕ → ℕ) (x : ℕ) : ℕ :=
    let rem := x % 2
    if rem = 0 then
        f (f x)
    else
        f x


#eval apply_twice_when_even (abs_diff 10) 8
#eval apply_twice_when_even (abs_diff 10) 11

--(Optional) Show that abs_diff is symmetric in its arguments
theorem abs_diff_is_symmetric_in_its_arguments (x y : ℕ) : abs_diff x y = abs_diff y x := by
    unfold abs_diff
    split_ifs
    --1. x < y and y < x
    {
    rename_i h1 h2
    --new hypothesis; if y < x then NOT(y > x)
    have h_not : ¬ (x < y) := Nat.not_lt_of_gt h2
    contradiction
    }
    --2. x < y and NOT y < x
    {
    rename_i h1 h2
    rfl
    }
    --3. NOT x < y and y < x
    {
    rename_i h1 h2
    rfl
    }
    --4. NOT x < y and NOT y < x
    {
    rename_i h1 h2
    --due to assumptions, x = y
    have h_eq : x = y := Nat.le_antisymm (Nat.le_of_not_lt h2) (Nat.le_of_not_lt h1)
    rw [h_eq]
    }


