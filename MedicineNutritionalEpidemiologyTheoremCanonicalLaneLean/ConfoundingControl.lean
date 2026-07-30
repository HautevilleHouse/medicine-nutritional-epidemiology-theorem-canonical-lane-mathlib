import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

structure ConfoundingControlPackage where
  measuredConfounders : Prop
  propensityScoreModel : Prop
  inverseProbabilityWeighting : Prop
  sensitivityAnalysis : Prop

structure ConfoundingControlEvidence (C : ConfoundingControlPackage) where
  measuredConfoundersClosed : C.measuredConfounders
  propensityScoreModelClosed : C.propensityScoreModel
  inverseProbabilityWeightingClosed : C.inverseProbabilityWeighting
  sensitivityAnalysisClosed : C.sensitivityAnalysis

def ConfoundingControlClosed (C : ConfoundingControlPackage) : Prop :=
  C.measuredConfounders ∧ C.propensityScoreModel ∧ C.inverseProbabilityWeighting ∧ C.sensitivityAnalysis

theorem confounding_control_closed_from_evidence (C : ConfoundingControlPackage)
    (Ev : ConfoundingControlEvidence C) : ConfoundingControlClosed C := by
  exact And.intro Ev.measuredConfoundersClosed
    (And.intro Ev.propensityScoreModelClosed
      (And.intro Ev.inverseProbabilityWeightingClosed Ev.sensitivityAnalysisClosed))

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse