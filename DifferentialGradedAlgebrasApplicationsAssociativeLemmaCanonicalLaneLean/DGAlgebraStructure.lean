import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean

structure DGAlgebraPackage where
  underlyingAlgebra : Type u
  differential : underlyingAlgebra → underlyingAlgebra
  degree : ℤ
  dSquaredZero : ∀ x, differential (differential x) = 0
  leibnizRule : ∀ a b, differential (a * b) = differential a * b + (-1)^(degree : ℤ) * a * differential b

structure DGAlgebraEvidence (D : DGAlgebraPackage) where
  dSquaredZeroClosed : D.dSquaredZero
  leibnizRuleClosed : D.leibnizRule

def DGAlgebraClosed (D : DGAlgebraPackage) : Prop :=
  D.dSquaredZero ∧ D.leibnizRule

theorem dg_algebra_closed_from_evidence (D : DGAlgebraPackage) (E : DGAlgebraEvidence D) :
    DGAlgebraClosed D := by
  exact And.intro E.dSquaredZeroClosed E.leibnizRuleClosed

end DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean
end HautevilleHouse