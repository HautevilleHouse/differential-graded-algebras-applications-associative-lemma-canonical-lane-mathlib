import DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : DGAAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DGAClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean
end HautevilleHouse
