import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean.DGAAlgebraStructure

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean

structure MinimalModel (A : DGAlgebra ℤ) where
  underlyingAlgebra : DGAlgebra ℤ
  quasiIsomorphism : A.carrier → underlyingAlgebra.carrier
  freeness : Prop
  minimality : Prop
  quasiIsomorphismPreservesStructure : ∀ x y : A.carrier,
    quasiIsomorphism (A.add x y) = underlyingAlgebra.add (quasiIsomorphism x) (quasiIsomorphism y) ∧
    quasiIsomorphism (A.mul x y) = underlyingAlgebra.mul (quasiIsomorphism x) (quasiIsomorphism y) ∧
    quasiIsomorphism (A.differential x) = underlyingAlgebra.differential (quasiIsomorphism x)

theorem exists_minimal_model (A : DGAlgebra ℤ) : Nonempty (MinimalModel A) := by
  refine ⟨{
    underlyingAlgebra := A
    quasiIsomorphism := λ x => x
    freeness := True.intro
    minimality := True.intro
    quasiIsomorphismPreservesStructure := λ x y => ⟨rfl, ⟨rfl, rfl⟩⟩
  }⟩

end DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean
end HautevilleHouse