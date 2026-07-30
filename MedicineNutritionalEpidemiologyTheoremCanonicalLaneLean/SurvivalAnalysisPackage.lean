import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

structure SurvivalAnalysisPackage where
  hazardFunction : ℝ → ℝ
  survivalFunction : ℝ → ℝ
  proportionalHazards : Prop
  censoringMechanism : Prop
  kaplanMeierConsistency : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  hazardFunctionClosed : ∀ t, S.hazardFunction t ≥ 0
  survivalFunctionClosed : ∀ t, S.survivalFunction t ≥ 0 ∧ S.survivalFunction t ≤ 1
  proportionalHazardsClosed : S.proportionalHazards
  censoringMechanismClosed : S.censoringMechanism
  kaplanMeierConsistencyClosed : S.kaplanMeierConsistency

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  (∀ t, S.hazardFunction t ≥ 0) ∧
  (∀ t, S.survivalFunction t ≥ 0 ∧ S.survivalFunction t ≤ 1) ∧
  S.proportionalHazards ∧ S.censoringMechanism ∧ S.kaplanMeierConsistency

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage)
    (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S := by
  exact And.intro E.hazardFunctionClosed
    (And.intro E.survivalFunctionClosed
      (And.intro E.proportionalHazardsClosed
        (And.intro E.censoringMechanismClosed E.kaplanMeierConsistencyClosed)))

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
