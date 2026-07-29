import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean.MinimalModel

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean

structure SullivanMinimalModel (A : DGAlgebra ℤ) extends MinimalModel A where
  freeGenerators : Type u
  generatorDegrees : freeGenerators → ℕ
  freeAlgebra : DGAlgebra ℤ
  isomorphism : underlyingAlgebra.carrier ≃ freeAlgebra.carrier

theorem sullivan_minimal_model_closure (A : DGAlgebra ℤ) : Nonempty (SullivanMinimalModel A) := by
  have h : Nonempty (MinimalModel A) := minimal_model_closure A
  rcases h with ⟨M⟩
  refine ⟨{
    toMinimalModel := M
    freeGenerators := M.basis.genIndex
    generatorDegrees := M.basis.degree
    freeAlgebra := M.freeAlgebra
    isomorphism := M.isomorphism
  }⟩

end DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean
end HautevilleHouse