import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

structure EffectEstimationPackage where
  hazardRatioModel : Prop
  competingRisks : Prop
  subgroupAnalysis : Prop
  overallSummaryEstimate : Prop

structure EffectEstimationEvidence (E : EffectEstimationPackage) where
  hazardRatioModelClosed : E.hazardRatioModel
  competingRisksClosed : E.competingRisks
  subgroupAnalysisClosed : E.subgroupAnalysis
  overallSummaryEstimateClosed : E.overallSummaryEstimate

def EffectEstimationClosed (E : EffectEstimationPackage) : Prop :=
  E.hazardRatioModel ∧ E.competingRisks ∧ E.subgroupAnalysis ∧ E.overallSummaryEstimate

theorem effect_estimation_closed_from_evidence (E : EffectEstimationPackage)
    (Ev : EffectEstimationEvidence E) : EffectEstimationClosed E := by
  exact And.intro Ev.hazardRatioModelClosed
    (And.intro Ev.competingRisksClosed
      (And.intro Ev.subgroupAnalysisClosed Ev.overallSummaryEstimateClosed))

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse