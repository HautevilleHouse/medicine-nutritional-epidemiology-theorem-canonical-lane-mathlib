import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

structure EpidemiologyAdmittedObject where
  population : Type
  studyDesign : Prop
  exposure : Prop
  outcome : Prop
  confounding : Prop
  effectEstimate : Prop
  conclusion : effectEstimate

def EpidemiologyWitnessClosed (O : EpidemiologyAdmittedObject) : Prop :=
  O.effectEstimate

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse