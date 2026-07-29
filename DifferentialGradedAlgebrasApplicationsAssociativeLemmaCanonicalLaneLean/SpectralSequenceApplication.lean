import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean

structure SpectralSequence (A : Type u) where
  baseAlgebra : DGAlgebra A
  filtration : ℕ → Set A
  page : ℕ → Type v
  differentialPage : ∀ n : ℕ, page n → page n
  convergence : Prop

structure SpectralSequenceEvidence (S : SpectralSequence A) where
  filtrationCompatible : ∀ n : ℕ, ∀ x : A, x ∈ S.filtration n → S.baseAlgebra.differential x ∈ S.filtration n
  differentialPageSqZero : ∀ n : ℕ, ∀ x : S.page n, S.differentialPage n (S.differentialPage n x) = 0
  convergenceClosed : S.convergence

def SpectralSequenceClosed (S : SpectralSequence A) : Prop :=
  S.convergence

theorem spectral_sequence_closed_from_evidence (S : SpectralSequence A) (E : SpectralSequenceEvidence S) : SpectralSequenceClosed S := by
  exact E.convergenceClosed

end DifferentialGradedAlgebrasApplicationsAssociativeLemmaCanonicalLaneLean
end HautevilleHouse