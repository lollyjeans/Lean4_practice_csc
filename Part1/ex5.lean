--2.3.27

--Define a lambda abstraction, called double, that takes a Church numeral and doubles it. Evaluate it on a few examples.

def church_numeral := ∀ {α : Type}, (α → α) → α → α

--fun y = f ∘ f
--fun x = ((f ∘ f)^n) (x)
def double (n : church_numeral) : church_numeral :=
    fun f x => n (fun y => f (f y)) x

def church_one : church_numeral := fun f x => f x
def church_two : church_numeral := fun f x => f (f x)

--utility method for converting church num into natural num
def churchToNat (n : church_numeral) : ℕ :=
    n (fun x => x + 1) 0

#eval churchToNat (double church_one)
#eval churchToNat (double church_two)
#eval churchToNat (double (double church_two))

