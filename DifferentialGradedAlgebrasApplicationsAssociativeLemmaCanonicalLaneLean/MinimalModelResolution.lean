import canonicalLaneMathlib.AdmissibleClass
import DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean.DGAlgebraDefinition

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean

open DGAlgebra

structure MinimalModel (A : DGAlgebra) where
  minimalAlgebra : DGAlgebra
  quasiIsomorphism : Prop
  minimality : Prop
  resolutionProperty : Prop

structure MinimalModelEvidence {A : DGAlgebra} (M : MinimalModel A) where
  quasiIsomorphismClosed : M.quasiIsomorphism
  minimalityClosed : M.minimality
  resolutionPropertyClosed : M.resolutionProperty

def MinimalModelClosed {A : DGAlgebra} (M : MinimalModel A) : Prop :=
  M.quasiIsomorphism ∧ M.minimality ∧ M.resolutionProperty

theorem minimal_model_closed_from_evidence {A : DGAlgebra} (M : MinimalModel A) (E : MinimalModelEvidence M) : MinimalModelClosed M :=
  And.intro E.quasiIsomorphismClosed (And.intro E.minimalityClosed E.resolutionPropertyClosed)

end DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean
end HautevilleHouse