import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean

structure DGAlgebra where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  differential : carrier → carrier
  gradedDegree : Int
  leibnizRule : Prop
  associativity : Prop
  differentialSquaredZero : Prop

structure DGAlgebraEvidence (A : DGAlgebra) where
  leibnizRuleClosed : A.leibnizRule
  associativityClosed : A.associativity
  differentialSquaredZeroClosed : A.differentialSquaredZero

def DGAlgebraClosed (A : DGAlgebra) : Prop :=
  A.leibnizRule ∧ A.associativity ∧ A.differentialSquaredZero

theorem dg_algebra_closed_from_evidence (A : DGAlgebra) (E : DGAlgebraEvidence A) : DGAlgebraClosed A :=
  And.intro E.leibnizRuleClosed (And.intro E.associativityClosed E.differentialSquaredZeroClosed)

end DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean
end HautevilleHouse