import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean

structure CohomologyGroupStructure where
  group : Type u
  addition : group → group → group
  zero : group
  degree : ℕ
  cocycleCondition : Prop
  coboundaryCondition : Prop
  wellDefined : Prop

def CohomologyGroupClosed (H : CohomologyGroupStructure) : Prop :=
  H.cocycleCondition ∧ H.coboundaryCondition ∧ H.wellDefined

structure CohomologyGroupEvidence (H : CohomologyGroupStructure) where
  cocycleConditionClosed : H.cocycleCondition
  coboundaryConditionClosed : H.coboundaryCondition
  wellDefinedClosed : H.wellDefined

theorem cohomology_group_closed_from_evidence (H : CohomologyGroupStructure)
    (E : CohomologyGroupEvidence H) : CohomologyGroupClosed H := by
  exact And.intro E.cocycleConditionClosed
    (And.intro E.coboundaryConditionClosed E.wellDefinedClosed)

end DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean
end HautevilleHouse