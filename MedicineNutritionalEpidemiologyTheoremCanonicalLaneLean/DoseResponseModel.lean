import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean.MedicineObjects

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

structure DoseResponsePackage (A : AdmissibleClass) where
  exposureQuantified : Prop
  monotonicityAssumption : Prop
  thresholdModel : Prop
  nonlinearTrend : Prop
  effectSizeControlled : Prop

structure DoseResponseEvidence (A : AdmissibleClass) (D : DoseResponsePackage A) where
  exposureQuantifiedClosed : D.exposureQuantified
  monotonicityAssumptionClosed : D.monotonicityAssumption
  thresholdModelClosed : D.thresholdModel
  nonlinearTrendClosed : D.nonlinearTrend
  effectSizeControlledClosed : D.effectSizeControlled

def DoseResponseClosed (A : AdmissibleClass) (D : DoseResponsePackage A) : Prop :=
  D.exposureQuantified ∧ D.monotonicityAssumption ∧ D.thresholdModel ∧ D.nonlinearTrend ∧ D.effectSizeControlled

theorem dose_response_closed_from_evidence (A : AdmissibleClass) (D : DoseResponsePackage A) (E : DoseResponseEvidence A D) : DoseResponseClosed A D := by
  exact And.intro E.exposureQuantifiedClosed (And.intro E.monotonicityAssumptionClosed (And.intro E.thresholdModelClosed (And.intro E.nonlinearTrendClosed E.effectSizeControlledClosed)))

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse