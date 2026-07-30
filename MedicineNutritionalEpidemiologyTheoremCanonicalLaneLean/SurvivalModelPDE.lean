import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

structure SurvivalModelPackage (G : PrimitiveCompartmentModel) where
  hazardFunction : Type
  survivalFunction : Type
  censoringMechanism : Prop
  proportionalHazardsAssumption : Prop
  timeScale : ℝ
  hazardDefined : hazardFunction
  survivalDerived : survivalFunction

def survivalModelClosed {G : PrimitiveCompartmentModel} (F : SurvivalModelPackage G) : Prop :=
  F.censoringMechanism ∧ F.proportionalHazardsAssumption

theorem survival_model_closed_from_evidence {G : PrimitiveCompartmentModel}
    (F : SurvivalModelPackage G) (E : F.censoringMechanism ∧ F.proportionalHazardsAssumption) : survivalModelClosed F := by
  exact E

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
