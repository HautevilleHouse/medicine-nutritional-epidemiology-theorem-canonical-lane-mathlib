import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

structure NutritionalCohortPackage where
  cohortSize : Prop
  followUpDuration : Prop
  dietaryAssessmentMethod : Prop
  outcomeAscertainment : Prop

structure NutritionalCohortEvidence (N : NutritionalCohortPackage) where
  cohortSizeClosed : N.cohortSize
  followUpDurationClosed : N.followUpDuration
  dietaryAssessmentMethodClosed : N.dietaryAssessmentMethod
  outcomeAscertainmentClosed : N.outcomeAscertainment

def NutritionalCohortClosed (N : NutritionalCohortPackage) : Prop :=
  N.cohortSize ∧ N.followUpDuration ∧ N.dietaryAssessmentMethod ∧ N.outcomeAscertainment

theorem nutritional_cohort_closed_from_evidence (N : NutritionalCohortPackage)
    (E : NutritionalCohortEvidence N) : NutritionalCohortClosed N := by
  exact And.intro E.cohortSizeClosed
    (And.intro E.followUpDurationClosed
      (And.intro E.dietaryAssessmentMethodClosed E.outcomeAscertainmentClosed))

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse