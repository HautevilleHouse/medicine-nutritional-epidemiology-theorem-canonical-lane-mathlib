import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

structure DiagnosticTest where
  sensitivity : Prop
  specificity : Prop
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop

def TestPerformanceClosed (T : DiagnosticTest) : Prop :=
  T.sensitivity ∧ T.specificity ∧ T.positivePredictiveValue ∧ T.negativePredictiveValue

theorem diagnostic_bridge (T : DiagnosticTest) : TestPerformanceClosed T := by
  exact And.intro T.sensitivity (And.intro T.specificity (And.intro T.positivePredictiveValue T.negativePredictiveValue))

structure ROCAnalysis where
  rocCurve : String
  aucROC : Prop
  optimalThreshold : Prop

def ROCClosed (R : ROCAnalysis) : Prop :=
  R.aucROC ∧ R.optimalThreshold

theorem roc_bridge (R : ROCAnalysis) : ROCClosed R := by
  exact And.intro R.aucROC R.optimalThreshold

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse