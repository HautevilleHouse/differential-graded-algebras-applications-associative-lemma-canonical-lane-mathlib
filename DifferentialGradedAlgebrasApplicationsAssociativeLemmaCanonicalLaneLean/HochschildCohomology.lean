import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean

structure HochschildCohomologyPackage (A : Type u) where
  algebra : Type u
  bimodule : Type u
  cochainComplex : Type u
  differential : cochainComplex → cochainComplex
  cohomologyGroups : ℕ → Type v
  vanishingCondition : ∀ n > 0, cohomologyGroups n = True

structure HochschildCohomologyEvidence (A : Type u) (H : HochschildCohomologyPackage A) where
  differentialWellDefined : ∀ x, H.differential (H.differential x) = 0
  vanishingConditionClosed : H.vanishingCondition

def HochschildCohomologyClosed (A : Type u) (H : HochschildCohomologyPackage A) : Prop :=
  H.vanishingCondition

theorem hochschild_cohomology_closed_from_evidence (A : Type u) (H : HochschildCohomologyPackage A)
    (E : HochschildCohomologyEvidence A H) : HochschildCohomologyClosed A H := by
  exact E.vanishingConditionClosed

end DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean
end HautevilleHouse