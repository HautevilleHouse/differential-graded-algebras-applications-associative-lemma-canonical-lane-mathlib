import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean

structure BarConstruction (A : Type u) where
  algebra : AssociativeStructure A
  barComplex : ℕ → Type v
  barDifferential : ∀ n : ℕ, barComplex n → barComplex (n+1)
  contractingHomotopy : ∀ n : ℕ, barComplex (n+1) → barComplex n
  acyclicity : Prop

structure BarConstructionEvidence (B : BarConstruction A) where
  differentialSqZero : ∀ n : ℕ, ∀ x : B.barComplex n, B.barDifferential (n+1) (B.barDifferential n x) = 0
  contractingHomotopyCondition : ∀ n : ℕ, ∀ x : B.barComplex n, 
    B.contractingHomotopy (n+1) (B.barDifferential n x) + B.barDifferential (n-1) (B.contractingHomotopy n x) = x
  acyclicityClosed : B.acyclicity

def BarConstructionClosed (B : BarConstruction A) : Prop :=
  B.acyclicity

theorem bar_construction_closed_from_evidence (B : BarConstruction A) (E : BarConstructionEvidence B) : BarConstructionClosed B := by
  exact E.acyclicityClosed

end DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean
end HautevilleHouse