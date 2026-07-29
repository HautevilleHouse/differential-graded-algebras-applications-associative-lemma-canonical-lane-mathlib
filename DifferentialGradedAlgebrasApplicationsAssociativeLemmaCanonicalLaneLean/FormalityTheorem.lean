import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean

structure FormalityTheoremPackage (D : DGAlgebraPackage) where
  minimalModel : KadeishviliMinimalModelPackage D
  quasiIsomorphismChain : List (DGAlgebraPackage → DGAlgebraPackage)
  formalityCondition : ∀ n, homology D n ≅ homology (minimalModel.minimalModel) n

structure FormalityTheoremEvidence (D : DGAlgebraPackage) (F : FormalityTheoremPackage D) where
  formalityConditionClosed : F.formalityCondition

def FormalityTheoremClosed (D : DGAlgebraPackage) (F : FormalityTheoremPackage D) : Prop :=
  F.formalityCondition

theorem formality_theorem_closed_from_evidence (D : DGAlgebraPackage) (F : FormalityTheoremPackage D)
    (E : FormalityTheoremEvidence D F) : FormalityTheoremClosed D F := by
  exact E.formalityConditionClosed

end DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean
end HautevilleHouse