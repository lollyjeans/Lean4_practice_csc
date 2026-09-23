--3.5.21

--Base code
inductive Person where
    | mary
    | steve
    | ed
    | jolin

open Person

def on_right (p q : Person) : Prop := match p with
    | mary => q = steve
    | steve => q = ed
    | ed => q = jolin
    | jolin => q = mary

def next_to (p q : Person) := on_right p q ∨ on_right q p


--proof1
example : ∀ p : Person, ∃ q : Person, next_to p q := by
    intro h
    rcases h with ⟨x, hx⟩
    {
        use steve
        unfold next_to
        unfold on_right
        simp
    }
    {
        use ed
        unfold next_to
        unfold on_right
        simp
    }
    {
        use jolin
        unfold next_to
        unfold on_right
        simp
    }
    {
        use mary
        unfold next_to
        unfold on_right
        simp
    }


--proof2
example : ∀ p : Person, ∃ q : Person, ¬next_to p q := by
    intro h
    rcases h with ⟨x, hx⟩
    {
        use mary
        unfold next_to
        unfold on_right
        simp
    }
    {
        use jolin
        unfold next_to
        unfold on_right
        simp
    }
    {
        use ed
        unfold next_to
        unfold on_right
        simp
    }
    {
        use steve
        unfold next_to
        unfold on_right
        simp
    }
