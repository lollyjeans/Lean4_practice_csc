--3.5.12

--Do the following proofs using the tactics intro, apply and use along with the basic inductive definitions and eliminators for And and Or. 

variable (P Q : Type → Prop)

example : (∃ x, P x ∧ Q x) → ∃ x, Q x ∧ P x := by
    --introduce hypotheses
    intro h
    rcases h with ⟨x, hx⟩
    use x
    --split cases
    apply And.intro
    ·exact hx.right
    ·exact hx.left

example : (∃ x, P x ∨ Q x) → ∃ x, Q x ∨ P x := by
    --introduce hypotheses
    intro h
    rcases h with ⟨x, hx⟩
    use x
    --split cases
    apply Or.elim hx
    ·apply Or.inr
    ·apply Or.inl


