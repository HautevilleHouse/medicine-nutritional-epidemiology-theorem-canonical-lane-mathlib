import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

structure CompartmentModel where
  compartments : List String
  transitionRates : String
  conservationLaw : Prop
  compartmentEqns : Prop

structure DoseResponseCurve where
  dose : String
  response : String
  curveType : String
  auc : Prop

structure PharmacokineticParameters where
  absorptionRate : Prop
  distributionVolume : Prop
  eliminationRate : Prop
  halfLife : Prop
  parametersClosed : Prop

def CompartmentClosure (C : CompartmentModel) (P : PharmacokineticParameters) : Prop :=
  C.conservationLaw ∧ C.compartmentEqns ∧ P.parametersClosed

theorem compartment_bridge (C : CompartmentModel) (P : PharmacokineticParameters) :
    CompartmentClosure C P := by
  exact And.intro C.conservationLaw (And.intro C.compartmentEqns P.parametersClosed)

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse