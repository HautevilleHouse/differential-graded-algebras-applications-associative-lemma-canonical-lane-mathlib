import canonicalLaneMathlib.AdmissibleClass
import DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean.DGAlgebraDefinition

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean

open DGAlgebra

structure KoszulDualityPair (A B : DGAlgebra) where
  pairingDefined : Prop
  koszulDuality : Prop
  barCobarEquivalence : Prop

structure KoszulDualityEvidence {A B : DGAlgebra} (K : KoszulDualityPair A B) where
  pairingDefinedClosed : K.pairingDefined
  koszulDualityClosed : K.koszulDuality
  barCobarEquivalenceClosed : K.barCobarEquivalence

def KoszulDualityClosed {A B : DGAlgebra} (K : KoszulDualityPair A B) : Prop :=
  K.pairingDefined ∧ K.koszulDuality ∧ K.barCobarEquivalence

theorem koszul_duality_closed_from_evidence {A B : DGAlgebra} (K : KoszulDualityPair A B) (E : KoszulDualityEvidence K) : KoszulDualityClosed K :=
  And.intro E.pairingDefinedClosed (And.intro E.koszulDualityClosed E.barCobarEquivalenceClosed)

end DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean
end HautevilleHouse