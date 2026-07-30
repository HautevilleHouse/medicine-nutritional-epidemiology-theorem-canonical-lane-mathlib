import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

structure NutritionalEpidemiologyCore where
  nutrientIntakeModel : Type u
  healthOutcome : Type v
  doseResponseCurve : nutrientIntakeModel → ℝ → ℝ
  confoundingControl : Prop
  reverseCausationCheck : Prop
  mediationAnalysis : Prop

structure NutritionalEpidemiologyEvidence (N : NutritionalEpidemiologyCore) where
  nutrientIntakeModelClosed : Nonempty N.nutrientIntakeModel
  healthOutcomeClosed : Nonempty N.healthOutcome
  doseResponseCurveClosed : ∀ i, N.doseResponseCurve i 0 = 0
  confoundingControlClosed : N.confoundingControl
  reverseCausationCheckClosed : N.reverseCausationCheck
  mediationAnalysisClosed : N.mediationAnalysis

def NutritionalEpidemiologyClosed (N : NutritionalEpidemiologyCore) : Prop :=
  Nonempty N.nutrientIntakeModel ∧ Nonempty N.healthOutcome ∧
  (∀ i, N.doseResponseCurve i 0 = 0) ∧
  N.confoundingControl ∧ N.reverseCausationCheck ∧ N.mediationAnalysis

theorem nutritional_epidemiology_closed_from_evidence (N : NutritionalEpidemiologyCore)
    (E : NutritionalEpidemiologyEvidence N) : NutritionalEpidemiologyClosed N := by
  exact And.intro E.nutrientIntakeModelClosed
    (And.intro E.healthOutcomeClosed
      (And.intro E.doseResponseCurveClosed
        (And.intro E.confoundingControlClosed
          (And.intro E.reverseCausationCheckClosed E.mediationAnalysisClosed))))

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
