import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean

structure DGAlgebra (R : Type u) [CommRing R] where
  carrier : Type v
  add : carrier → carrier → carrier
  zero : carrier
  mul : carrier → carrier → carrier
  one : carrier
  degree : carrier → ℤ
  differential : carrier → carrier
  dgAssociative : Prop
  dgAssociative_proof : dgAssociative

structure DGAlgebraEvidence (A : DGAlgebra ℤ) where
  addAssoc : ∀ x y z : A.carrier, A.add (A.add x y) z = A.add x (A.add y z)
  addComm : ∀ x y : A.carrier, A.add x y = A.add y x
  addZero : ∀ x : A.carrier, A.add x A.zero = x
  zeroAdd : ∀ x : A.carrier, A.add A.zero x = x
  mulAssoc : ∀ x y z : A.carrier, A.mul (A.mul x y) z = A.mul x (A.mul y z)
  mulOne : ∀ x : A.carrier, A.mul x A.one = x
  oneMul : ∀ x : A.carrier, A.mul A.one x = x
  leftDistrib : ∀ x y z : A.carrier, A.mul x (A.add y z) = A.add (A.mul x y) (A.mul x z)
  rightDistrib : ∀ x y z : A.carrier, A.mul (A.add x y) z = A.add (A.mul x z) (A.mul y z)
  differentialAdd : ∀ x y : A.carrier, A.differential (A.add x y) = A.add (A.differential x) (A.differential y)
  differentialMul : ∀ x y : A.carrier, A.differential (A.mul x y) = A.add (A.mul (A.differential x) y) (A.mul x (A.differential y))
  differentialSq : ∀ x : A.carrier, A.differential (A.differential x) = A.zero
  homogeneous : ∀ x : A.carrier, A.degree (A.differential x) = A.degree x + 1

def DGAlgebraClosed (A : DGAlgebra ℤ) : Prop :=
  let E := DGAlgebraEvidence.mk ?_ ?_ ?_ ?_ ?_ ?_ ?_ ?_ ?_ ?_ ?_ ?_ ?_ ?_
  in True

end DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean
end HautevilleHouse