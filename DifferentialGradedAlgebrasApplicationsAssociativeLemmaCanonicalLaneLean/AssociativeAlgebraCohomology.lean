import canonicalLaneMathlib.AdmissibleClass
import DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean.DGAlgebraDefinition

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean

open DGAlgebra

structure HochschildComplex (A : DGAlgebra) where
  chainGroups : ℕ → Type u
  differentialMap : (n : ℕ) → chainGroups n → chainGroups (n+1)
  cohomologyGroups : ℕ → Type u
  hochschildCohomology : (n : ℕ) → Prop
  associativeAlgebraCohomologyDefined : Prop

structure HochschildComplexEvidence {A : DGAlgebra} (H : HochschildComplex A) where
  hochschildCohomologyClosed : ∀ n, H.hochschildCohomology n
  associativeAlgebraCohomologyDefinedClosed : H.associativeAlgebraCohomologyDefined

def HochschildComplexClosed {A : DGAlgebra} (H : HochschildComplex A) : Prop :=
  (∀ n, H.hochschildCohomology n) ∧ H.associativeAlgebraCohomologyDefined

theorem hochschild_complex_closed_from_evidence {A : DGAlgebra} (H : HochschildComplex A) (E : HochschildComplexEvidence H) : HochschildComplexClosed H :=
  And.intro E.hochschildCohomologyClosed E.associativeAlgebraCohomologyDefinedClosed

end DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean
end HautevilleHouse