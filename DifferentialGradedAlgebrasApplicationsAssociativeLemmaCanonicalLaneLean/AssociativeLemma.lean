import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean

structure AssociativeLemmaPackage (D : DGAlgebraPackage) where
  hochschildCochains : Type u
  cupProduct : hochschildCochains → hochschildCochains → hochschildCochains
  associativity : ∀ a b c, cupProduct (cupProduct a b) c = cupProduct a (cupProduct b c)
  steenrodCupOne : hochschildCochains → hochschildCochains
  homotopyFormula : ∀ a, steenrodCupOne (differential a) + differential (steenrodCupOne a) = cupProduct a a

structure AssociativeLemmaEvidence (D : DGAlgebraPackage) (A : AssociativeLemmaPackage D) where
  associativityClosed : A.associativity
  homotopyFormulaClosed : A.homotopyFormula

def AssociativeLemmaClosed (D : DGAlgebraPackage) (A : AssociativeLemmaPackage D) : Prop :=
  A.associativity ∧ A.homotopyFormula

theorem associative_lemma_closed_from_evidence (D : DGAlgebraPackage) (A : AssociativeLemmaPackage D)
    (E : AssociativeLemmaEvidence D A) : AssociativeLemmaClosed D A := by
  exact And.intro E.associativityClosed E.homotopyFormulaClosed

end DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean
end HautevilleHouse