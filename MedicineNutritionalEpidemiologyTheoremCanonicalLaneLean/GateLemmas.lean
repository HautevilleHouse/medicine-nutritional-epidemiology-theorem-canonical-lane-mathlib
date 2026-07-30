import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse