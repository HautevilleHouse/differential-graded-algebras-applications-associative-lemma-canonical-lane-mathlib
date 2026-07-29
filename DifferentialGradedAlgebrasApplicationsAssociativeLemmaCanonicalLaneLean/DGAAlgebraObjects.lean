import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean

structure DGAlgebraObject where
  carrier : Type
  differential : carrier → carrier
  product : carrier → carrier → carrier
  degree : ℤ
  dSquared : ∀ x : carrier, differential (differential x) = 0
  derivation : ∀ x y : carrier, differential (product x y) = product (differential x) y + product x (differential y)
  associativity : ∀ x y z : carrier, product (product x y) z = product x (product y z)

structure DGAAdmittedObject where
  algebra : DGAlgebraObject
  homologyFiniteDimensional : Prop
  quasiIsomorphismToMinimal : Prop
  conclusion : quasiIsomorphismToMinimal

def DGAWitnessClosed (O : DGAAdmittedObject) : Prop :=
  O.quasiIsomorphismToMinimal

end DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean
end HautevilleHouse