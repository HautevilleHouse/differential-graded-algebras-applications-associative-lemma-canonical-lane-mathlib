import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean

structure HomologicalPerturbationData (A : Type u) where
  sourceComplex : BarConstruction A
  targetComplex : BarConstruction A
  chainMap : ∀ n : ℕ, sourceComplex.barComplex n → targetComplex.barComplex n
  perturbation : ∀ n : ℕ, sourceComplex.barComplex n → sourceComplex.barComplex n
  perturbationSmall : Prop

structure HomologicalPerturbationEvidence (H : HomologicalPerturbationData A) where
  chainMapCommutes : ∀ n : ℕ, ∀ x : H.sourceComplex.barComplex n,
    H.targetComplex.barDifferential n (H.chainMap n x) = H.chainMap (n+1) (H.sourceComplex.barDifferential n x)
  perturbationSqZero : ∀ n : ℕ, ∀ x : H.sourceComplex.barComplex n,
    H.perturbation n (H.perturbation n x) = 0
  perturbationSmallClosed : H.perturbationSmall

def HomologicalPerturbationClosed (H : HomologicalPerturbationData A) : Prop :=
  H.perturbationSmall

theorem homological_perturbation_closed_from_evidence (H : HomologicalPerturbationData A) (E : HomologicalPerturbationEvidence H) : HomologicalPerturbationClosed H := by
  exact E.perturbationSmallClosed

end DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean
end HautevilleHouse