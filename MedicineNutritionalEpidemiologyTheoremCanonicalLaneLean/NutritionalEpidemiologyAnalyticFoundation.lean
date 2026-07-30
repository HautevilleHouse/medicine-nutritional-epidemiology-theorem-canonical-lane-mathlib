import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

structure NutritionalEpidemiologyAnalyticFoundation where
  compartmentModel : PrimitiveCompartmentModel
  compartmentEvidence : compartmentalModelClosedCompartmentModel
  exposureModel : PrimitiveExposureModel compartmentModel
  exposureEvidence : exposureAssessedClosedExposureModel
  baselineCovariates : PrimitiveBaselineCovariates compartmentModel
  baselineCovariatesEvidence : baselineDataCollectedClosedBaselineCovariates
  outcomeModel : PrimitiveOutcomeModel compartmentModel
  outcomeEvidence : longitudinalDataStructureClosedOutcomeModel

def NutritionalEpidemiologyAnalyticFoundationClosed (A : NutritionalEpidemiologyAnalyticFoundation) : Prop :=
  A.compartmentalModelClosed ∧ A.exposureAssessedClosed ∧ A.baselineDataCollectedClosed ∧ A.longitudinalDataStructureClosed

theorem nutritional_epidemiology_analytic_foundation_closed_from_evidence
    (A : NutritionalEpidemiologyAnalyticFoundation) :
    NutritionalEpidemiologyAnalyticFoundationClosed A := by
  exact And.intro A.compartmentEvidence
    (And.intro A.exposureEvidence
      (And.intro A.baselineCovariatesEvidence A.outcomeEvidence))

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
