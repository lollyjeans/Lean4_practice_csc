--1.4.36

--1. Rewrite your cross product function in terms of Q x Q x Q

def alternativeCrossProduct : (ℚ × ℚ × ℚ) → (ℚ × ℚ × ℚ) -> (ℚ × ℚ × ℚ)
    | (u1, u2, u3), (v1, v2, v3) => (u2 * v3 - u3 * v2, u3 * v1 - u1 * v3, u1 * v2 - u2 * v1)


--2. Define functions area (s : Shape) : Q and perimeter (s : Shape) : Q. Approximate pi with 22/7.

--Showcasing of:
--Pi-type (function signatures; (x:A) -> B x),
--Sum-type (def Shape),
--Product-type (Shape for rectangles; (a:A) x B a)

--Circle = specified with radius r
--Rectangle = specified with x=width and y=height

def Shape := ℚ ⊕ (ℚ × ℚ)

def area (s : Shape) : ℚ  :=
    match s with
        | .inl x => (22 / 7) * x * x
        | .inr (x, y) => x * y

#check area

def perimeter (s : Shape) : ℚ :=
    match s with
        | .inl x => 2 * (22 / 7) * x
        | .inr (x, y) => (2 * x) + (2 * y)

#check Real.pi

