import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

structure ExposureMeasurementPackage where
  nutrientIntakeQuantification : Prop
  biomarkerValidation : Prop
  measurementErrorModel : Prop
  calibrationEquation : Prop

structure ExposureMeasurementEvidence (E : ExposureMeasurementPackage) where
  nutrientIntakeQuantificationClosed : E.nutrientIntakeQuantification
  biomarkerValidationClosed : E.biomarkerValidation
  measurementErrorModelClosed : E.measurementErrorModel
  calibrationEquationClosed : E.calibrationEquation

def ExposureMeasurementClosed (E : ExposureMeasurementPackage) : Prop :=
  E.nutrientIntakeQuantification ∧ E.biomarkerValidation ∧ E.measurementErrorModel ∧ E.calibrationEquation

theorem exposure_measurement_closed_from_evidence (E : ExposureMeasurementPackage)
    (Ev : ExposureMeasurementEvidence E) : ExposureMeasurementClosed E := by
  exact And.intro Ev.nutrientIntakeQuantificationClosed
    (And.intro Ev.biomarkerValidationClosed
      (And.intro Ev.measurementErrorModelClosed Ev.calibrationEquationClosed))

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse