import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

structure CompartmentModelPackage where
  susceptibleCompartment : Type u
  exposedCompartment : Type v
  infectedCompartment : Type w
  recoveredCompartment : Type x
  transitionLaws : Prop
  conservationLaw : Prop
  positiveInvariant : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  transitionLawsClosed : C.transitionLaws
  conservationLawClosed : C.conservationLaw
  positiveInvariantClosed : C.positiveInvariant

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.transitionLaws ∧ C.conservationLaw ∧ C.positiveInvariant

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.transitionLawsClosed
    (And.intro E.conservationLawClosed E.positiveInvariantClosed)

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
