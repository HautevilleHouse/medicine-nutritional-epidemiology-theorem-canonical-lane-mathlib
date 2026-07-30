import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def medicineProjection : Projection NutritionalEpidemiologyEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem medicine_projection_idempotent (x : NutritionalEpidemiologyEndgameState) :
    medicineProjection.toFun (medicineProjection.toFun x) = medicineProjection.toFun x := by
  exact medicineProjection.idempotent x

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
