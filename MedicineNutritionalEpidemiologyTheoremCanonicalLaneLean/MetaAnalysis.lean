import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

structure StudyResult where
  effectSize : Prop
  variance : Prop
  sampleSize : Nat
  studyDesign : String

structure MetaAnalysisModel where
  fixedEffect : Prop
  randomEffect : Prop
  heterogeneity : Prop
  publicationBias : Prop
  pooledEstimate : Prop

def MetaAnalysisClosed (M : MetaAnalysisModel) : Prop :=
  M.fixedEffect ∧ M.randomEffect ∧ M.heterogeneity ∧ M.publicationBias ∧ M.pooledEstimate

theorem meta_bridge (M : MetaAnalysisModel) : MetaAnalysisClosed M := by
  exact And.intro M.fixedEffect (And.intro M.randomEffect (And.intro M.heterogeneity (And.intro M.publicationBias M.pooledEstimate)))

structure EvidenceSynthesis where
  studies : List StudyResult
  summaryMeasure : Prop
  confidenceInterval : Prop
  forestPlot : Prop

def SynthesisClosed (E : EvidenceSynthesis) : Prop :=
  E.summaryMeasure ∧ E.confidenceInterval ∧ E.forestPlot

theorem synthesis_bridge (E : EvidenceSynthesis) : SynthesisClosed E := by
  exact And.intro E.summaryMeasure (And.intro E.confidenceInterval E.forestPlot)

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse