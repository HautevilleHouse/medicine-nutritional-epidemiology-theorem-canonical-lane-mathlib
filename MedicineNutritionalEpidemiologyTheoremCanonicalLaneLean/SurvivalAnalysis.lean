import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean.MedicineObjects

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

structure SurvivalAnalysisPackage (A : AdmissibleClass) where
  timeToEventDefined : Prop
  censoringMechanism : Prop
  hazardRatioEstimated : Prop
  kaplanMeierCurve : Prop
  proportionalHazardsChecked : Prop

structure SurvivalAnalysisEvidence (A : AdmissibleClass) (S : SurvivalAnalysisPackage A) where
  timeToEventDefinedClosed : S.timeToEventDefined
  censoringMechanismClosed : S.censoringMechanism
  hazardRatioEstimatedClosed : S.hazardRatioEstimated
  kaplanMeierCurveClosed : S.kaplanMeierCurve
  proportionalHazardsCheckedClosed : S.proportionalHazardsChecked

def SurvivalAnalysisClosed (A : AdmissibleClass) (S : SurvivalAnalysisPackage A) : Prop :=
  S.timeToEventDefined ∧ S.censoringMechanism ∧ S.hazardRatioEstimated ∧ S.kaplanMeierCurve ∧ S.proportionalHazardsChecked

theorem survival_analysis_closed_from_evidence (A : AdmissibleClass) (S : SurvivalAnalysisPackage A) (E : SurvivalAnalysisEvidence A S) : SurvivalAnalysisClosed A S := by
  exact And.intro E.timeToEventDefinedClosed (And.intro E.censoringMechanismClosed (And.intro E.hazardRatioEstimatedClosed (And.intro E.kaplanMeierCurveClosed E.proportionalHazardsCheckedClosed)))

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse