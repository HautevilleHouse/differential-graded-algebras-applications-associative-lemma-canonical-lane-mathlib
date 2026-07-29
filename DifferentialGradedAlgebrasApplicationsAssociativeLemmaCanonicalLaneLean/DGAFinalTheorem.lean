import canonicalLaneMathlib.AdmissibleClass
import DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean.DGAGateLemmas

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean

def ConstrainedDGAClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dga_endgame (A : AdmissibleClass) :
    ConstrainedDGAClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean
end HautevilleHouse