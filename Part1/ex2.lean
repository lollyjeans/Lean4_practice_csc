--1.3.18

--Recall the Fibonacci sequence is defined by
--fib 0 = 1
--fib 1 = 1
--fib n = fib n-1 + fib n-2

--1. Define fib using head recursion.
def fib_head (n : ℕ) : ℕ :=
    match n with
    | 0 => 1
    | 1 => 1
    | k + 2 => fib_head (k+1) + fib_head k

#eval fib_head 0
#eval fib_head 15

--2. Define fib using tail recursion.
--k = counter
--xa + yb; x = (k+1)st fibonacci term; y = (k+2)th term
--term numbering starts from 0
def fib_tail (n : ℕ) : ℕ :=
    let rec aux (n a b : ℕ) : ℕ := --local recursive function
        match n with
        | 0 => a
        | 1 => b
        | k + 2 => aux (k+1) b (a + b)
    aux n 1 1

#eval fib_tail 0
#eval fib_tail 15


