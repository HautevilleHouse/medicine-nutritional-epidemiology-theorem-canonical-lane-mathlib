import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

structure PrimitiveCompartmentModel where
  Population : Type
  Compartments : List String
  stateVector : Population -> Vector ℝ (List.length Compartments)
  transitions : Type
  inflowRates : transitions -> ℝ
  outflowRates : transitions -> ℝ
  compartmentalEquationsDefined : Prop
  positiveInvariant : Prop
  compartmentalEquationsDefinedTerm : compartmentalEquationsDefined
  positiveInvariantTerm : positiveInvariant

structure PrimitiveExposureModel (M : PrimitiveCompartmentModel) where
  exposurePathway : Type
  doseMetric : M.Population -> ℝ
  exposureWindow : (ℝ × ℝ)
  internalDose : Prop
  internalDoseTerm : internalDose

structure PrimitiveBaselineCovariates (M : PrimitiveCompartmentModel) where
  demographicFactors : Type
  lifestyleFactors : Type
  geneticFactors : Type
  baselineDataCollected : Prop
  baselineDataCollectedTerm : baselineDataCollected

structure PrimitiveOutcomeModel (M : PrimitiveCompartmentModel) where
  healthOutcome : Type
  outcomeMeasurementScale : String
  longitudinalDataStructure : Prop
  outcomeAssessedAtTimes : List ℝ
  longitudinalDataStructureTerm : longitudinalDataStructure

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
