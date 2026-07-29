import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean

structure KadeishviliMinimalModelPackage (D : DGAlgebraPackage) where
  minimalModel : DGAlgebraPackage
  quasiIsomorphism : minimalModel.underlyingAlgebra → D.underlyingAlgebra
  inducesIsomorphismOnHomology : ∀ n, Function.Bijective (homologyMap (D := minimalModel) (E := D) quasiIsomorphism n)
  minimalityCondition : ∀ x, differential x = 0 → minimalModel.differential x = 0

structure KadeishviliMinimalModelEvidence (D : DGAlgebraPackage) (M : KadeishviliMinimalModelPackage D) where
  quasiIsomorphismClosed : M.inducesIsomorphismOnHomology
  minimalityConditionClosed : M.minimalityCondition

def KadeishviliMinimalModelClosed (D : DGAlgebraPackage) (M : KadeishviliMinimalModelPackage D) : Prop :=
  M.inducesIsomorphismOnHomology ∧ M.minimalityCondition

theorem kadeishvili_minimal_model_closed_from_evidence (D : DGAlgebraPackage) (M : KadeishviliMinimalModelPackage D)
    (E : KadeishviliMinimalModelEvidence D M) : KadeishviliMinimalModelClosed D M := by
  exact And.intro E.quasiIsomorphismClosed E.minimalityConditionClosed

end DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean
end HautevilleHouse