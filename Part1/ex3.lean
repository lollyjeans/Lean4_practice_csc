--1.4.8
--1. Define an alternative complex number in terms of its magnitude and argument. 

--z = re^(i*theta)
--0<=theta<2*pi

inductive AlternativeComplex where
    | mk (r : NNReal) (θ : Real.Angle) : AlternativeComplex


#check AlternativeComplex.mk 2.24 (1.11 : ℝ)
#check AlternativeComplex.mk 3 Real.pi

noncomputable def z1 := AlternativeComplex.mk 4 (2 * Real.pi : ℝ)

def AlternativeComplex.mag (x : AlternativeComplex) : NNReal :=
    match x with
    | mk a _ => a

def AlternativeComplex.rad (x : AlternativeComplex) : Real.Angle :=
    match x with
    | mk _ b => b

--for proving equivalence of "Complex.mk a b" and "AlternativeComplex r θ"
namespace AlternativeComplex

noncomputable def toCartesianCoord (x : AlternativeComplex) : ℂ :=
    match x with
    | mk r θ => Complex.mk ((r : ℝ) * Real.cos θ.toReal) ((r : ℝ) * Real.sin θ.toReal)

lemma alternative_eq_complex (r : NNReal) (θ : Real.Angle) (a b : ℝ)
(h1 : a = (r : ℝ) * Real.cos θ.toReal) (h2 : b = (r : ℝ) * Real.sin θ.toReal) :
Complex.mk a b = (AlternativeComplex.mk r θ).toCartesianCoord := by
    simp only [toCartesianCoord]
    rw [h1, h2]

end AlternativeComplex

--cartesian (-1,0) = (1, pi) in polar coordinates
example : Complex.mk (-1) 0 = (AlternativeComplex.mk 1 Real.pi).toCartesianCoord := by
    apply AlternativeComplex.alternative_eq_complex
    all_goals
        simp


--2. Define "or" for "tribool"

inductive TriBool where
    | T : TriBool
    | F : TriBool
    | U : TriBool

open TriBool

def and (A B : TriBool) :=
    match A, B with
        | T, x => x
        | F, _ => F
        | U, F => F
        | U, _ => U

#eval and T (and U F)

def or (A B : TriBool) :=
    match A, B with
        | T, _ => T
        | F, x => x
        | U, T => T
        | U, _ => U

--3. Lean's ration number type ℚ defines 1/0 to be 0. define a function reciprocal (x : ℚ) : Option ℚ
-- that returns none when x is zero

--using Option Monad
def reciprocal (x : ℚ) : Option ℚ :=
    match x with
        | 0 => none
        | k => some k⁻¹

#eval reciprocal 3
#eval reciprocal 0


