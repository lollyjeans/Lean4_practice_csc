--2.4.9

--1. Define a parameterized structure type called Pair that represents a pair of values having not necessarily the same types.

structure Pair (α : Type) (β : Type) where
    first : α
    second : β

--2. Define a polymorphic function that swaps the order of a Pair.
def swap {α β : Type} (p : Pair α β) : Pair β α := ⟨p.second, p.first⟩

#check swap

--3. Create a function f : b -> chooseType b
def chooseType : Bool → Type
    | true => ℕ
    | false => String

def f : (b : Bool) → chooseType b
    | true => (1 : ℕ)
    | false => "abc"


--example
def pair1 : Pair ℕ String := { first := 3, second := "def" }
def pair1_swapped := swap pair1

#eval pair1.first
#eval pair1.second
#eval pair1_swapped.second
#eval pair1_swapped.first

#eval f true
#eval f false


