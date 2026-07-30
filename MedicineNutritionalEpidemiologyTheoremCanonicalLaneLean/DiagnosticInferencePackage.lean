import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

structure DiagnosticInferencePackage where
  sensitivity : ℚ
  specificity : ℚ
  priorPrevalence : ℚ
  likelihoodRatio : ℚ
  posteriorProbabilityFormula : ℚ → ℚ
  bayesianConsistency : Prop
  thresholdValid : Prop

structure DiagnosticInferenceEvidence (D : DiagnosticInferencePackage) where
  sensitivityClosed : 0 ≤ D.sensitivity ∧ D.sensitivity ≤ 1
  specificityClosed : 0 ≤ D.specificity ∧ D.specificity ≤ 1
  priorPrevalenceClosed : 0 ≤ D.priorPrevalence ∧ D.priorPrevalence ≤ 1
  likelihoodRatioClosed : D.likelihoodRatio ≥ 0
  posteriorProbabilityFormulaClosed : ∀ p, 0 ≤ p ∧ p ≤ 1 → 0 ≤ D.posteriorProbabilityFormula p ∧ D.posteriorProbabilityFormula p ≤ 1
  bayesianConsistencyClosed : D.bayesianConsistency
  thresholdValidClosed : D.thresholdValid

def DiagnosticInferenceClosed (D : DiagnosticInferencePackage) : Prop :=
  (0 ≤ D.sensitivity ∧ D.sensitivity ≤ 1) ∧
  (0 ≤ D.specificity ∧ D.specificity ≤ 1) ∧
  (0 ≤ D.priorPrevalence ∧ D.priorPrevalence ≤ 1) ∧
  D.likelihoodRatio ≥ 0 ∧
  (∀ p, 0 ≤ p ∧ p ≤ 1 → 0 ≤ D.posteriorProbabilityFormula p ∧ D.posteriorProbabilityFormula p ≤ 1) ∧
  D.bayesianConsistency ∧ D.thresholdValid

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticInferencePackage)
    (E : DiagnosticInferenceEvidence D) : DiagnosticInferenceClosed D := by
  exact And.intro E.sensitivityClosed
    (And.intro E.specificityClosed
      (And.intro E.priorPrevalenceClosed
        (And.intro E.likelihoodRatioClosed
          (And.intro E.posteriorProbabilityFormulaClosed
            (And.intro E.bayesianConsistencyClosed E.thresholdValidClosed)))))

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
