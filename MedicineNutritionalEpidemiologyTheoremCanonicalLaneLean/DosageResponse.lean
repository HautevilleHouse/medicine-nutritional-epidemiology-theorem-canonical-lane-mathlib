import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

structure DosageResponsePackage where
  monotonicityAssumption : Prop
  thresholdEffect : Prop
  nonlinearShape : Prop
  marginalEffectEstimate : Prop

structure DosageResponseEvidence (D : DosageResponsePackage) where
  monotonicityAssumptionClosed : D.monotonicityAssumption
  thresholdEffectClosed : D.thresholdEffect
  nonlinearShapeClosed : D.nonlinearShape
  marginalEffectEstimateClosed : D.marginalEffectEstimate

def DosageResponseClosed (D : DosageResponsePackage) : Prop :=
  D.monotonicityAssumption ∧ D.thresholdEffect ∧ D.nonlinearShape ∧ D.marginalEffectEstimate

theorem dosage_response_closed_from_evidence (D : DosageResponsePackage)
    (Ev : DosageResponseEvidence D) : DosageResponseClosed D := by
  exact And.intro Ev.monotonicityAssumptionClosed
    (And.intro Ev.thresholdEffectClosed
      (And.intro Ev.nonlinearShapeClosed Ev.marginalEffectEstimateClosed))

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse