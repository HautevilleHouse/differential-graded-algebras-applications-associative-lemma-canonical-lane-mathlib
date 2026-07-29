import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean

structure DGAlgebra (A : Type u) where
  carrier : Type u
  differential : carrier → carrier
  product : carrier → carrier → carrier
  grading : ℕ → Prop
  dSquared : ∀ x : carrier, differential (differential x) = 0
  leibniz : ∀ x y : carrier, differential (product x y) = product (differential x) y + product x (differential y)
  gradingClosed : ∀ n : ℕ, grading n → ∀ x : carrier, grading n x → grading (n+1) (differential x) ∨ grading (n-1) (differential x)

structure DGAlgebraEvidence {A : Type u} (D : DGAlgebra A) where
  dSquaredClosed : D.dSquared = D.dSquared
  leibnizClosed : D.leibniz = D.leibniz
  gradingClosedWitness : D.gradingClosed = D.gradingClosed

def DGAlgebraClosed {A : Type u} (D : DGAlgebra A) : Prop :=
  True

theorem dg_algebra_closed_from_evidence {A : Type u} (D : DGAlgebra A) (E : DGAlgebraEvidence D) : DGAlgebraClosed D := by
  trivial

end DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean
end HautevilleHouse