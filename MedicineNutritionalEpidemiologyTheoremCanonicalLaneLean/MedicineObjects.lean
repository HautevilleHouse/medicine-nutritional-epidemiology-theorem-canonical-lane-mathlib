import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure EpidemiologicSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure NutritionalAssessmentData where
  exposure : String
  outcome : String
  confounders : List String
  doseResponseType : Prop
  interactionTerms : Prop

structure MedicineAdmittedObject where
  space : EpidemiologicSpace
  studyDesign : NutritionalAssessmentData
  doseResponseModeled : Prop
  covariateBalance : Prop
  causalConclusion : Prop
  conclusion : causalConclusion

structure MedicineEndgameState where
  object : MedicineAdmittedObject

def MedicineWitnessClosed (O : MedicineAdmittedObject) : Prop :=
  O.causalConclusion

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse