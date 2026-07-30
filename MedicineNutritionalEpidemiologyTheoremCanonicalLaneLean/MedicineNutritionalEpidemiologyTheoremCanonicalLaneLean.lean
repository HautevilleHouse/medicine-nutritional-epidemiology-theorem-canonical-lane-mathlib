import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean.NutritionalCohortModels
import HautevilleHouse.MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean.ExposureMeasurement
import HautevilleHouse.MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean.ConfoundingControl
import HautevilleHouse.MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean.DosageResponse
import HautevilleHouse.MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean.EffectEstimation

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

open NutritionalCohortModels
open ExposureMeasurement
open ConfoundingControl
open DosageResponse
open EffectEstimation

structure NutritionalEpidemiologyEvidence where
  cohort : NutritionalCohortPackage
  exposure : ExposureMeasurementPackage
  confounding : ConfoundingControlPackage
  dosage : DosageResponsePackage
  effect : EffectEstimationPackage
  cohortEvidence : NutritionalCohortEvidence cohort
  exposureEvidence : ExposureMeasurementEvidence exposure
  confoundingEvidence : ConfoundingControlEvidence confounding
  dosageEvidence : DosageResponseEvidence dosage
  effectEvidence : EffectEstimationEvidence effect

def MedicineNutritionalEpidemiologyTheoremClosed (c : NutritionalEpidemiologyEvidence) : Prop :=
  NutritionalCohortClosed c.cohort ∧
  ExposureMeasurementClosed c.exposure ∧
  ConfoundingControlClosed c.confounding ∧
  DosageResponseClosed c.dosage ∧
  EffectEstimationClosed c.effect

theorem medicine_nutritional_epidemiology_theorem_closed_from_evidence
    (c : NutritionalEpidemiologyEvidence) : MedicineNutritionalEpidemiologyTheoremClosed c := by
  refine And.intro (nutritional_cohort_closed_from_evidence c.cohort c.cohortEvidence)
    (And.intro (exposure_measurement_closed_from_evidence c.exposure c.exposureEvidence)
      (And.intro (confounding_control_closed_from_evidence c.confounding c.confoundingEvidence)
        (And.intro (dosage_response_closed_from_evidence c.dosage c.dosageEvidence)
          (effect_estimation_closed_from_evidence c.effect c.effectEvidence))))

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse