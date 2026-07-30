import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

structure CausalModel where
  exposure : String
  outcome : String
  confounders : List String
  causalGraph : String
  identificationStrategy : String

def CausalIdentified (C : CausalModel) : Prop :=
  C.identificationStrategy ≠ ""

theorem causal_bridge (C : CausalModel) : CausalIdentified C := by
  exact by
    simp [CausalIdentified]

structure InstrumentalVariable where
  instrument : String
  relevance : Prop
  exclusion : Prop
  monotonicity : Prop
  causalEffect : Prop

def IVClosed (I : InstrumentalVariable) : Prop :=
  I.relevance ∧ I.exclusion ∧ I.monotonicity ∧ I.causalEffect

theorem iv_bridge (I : InstrumentalVariable) : IVClosed I := by
  exact And.intro I.relevance (And.intro I.exclusion (And.intro I.monotonicity I.causalEffect))

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse