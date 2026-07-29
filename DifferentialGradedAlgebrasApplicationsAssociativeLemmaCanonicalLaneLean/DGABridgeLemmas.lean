import canonicalLaneMathlib.AdmissibleClass
import DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean.DGAAdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DGAWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean
end HautevilleHouse