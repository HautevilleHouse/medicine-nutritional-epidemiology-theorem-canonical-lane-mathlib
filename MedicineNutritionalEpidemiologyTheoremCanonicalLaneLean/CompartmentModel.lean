import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

structure CompartmentModel (State : Type) where
  state : Type
  transferRates : state -> state -> Prop
  initialCondition : state -> Prop
  wellMixedAssumption : Prop
  conservationOfMass : Prop

def CompartmentModelClosed {S : Type} (C : CompartmentModel S) : Prop :=
  C.wellMixedAssumption ∧ C.conservationOfMass

structure CompartmentModelEvidence {S : Type} (C : CompartmentModel S) where
  wellMixedAssumptionClosed : C.wellMixedAssumption
  conservationOfMassClosed : C.conservationOfMass

theorem compartment_model_closed_from_evidence {S : Type} (C : CompartmentModel S)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.wellMixedAssumptionClosed E.conservationOfMassClosed

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse