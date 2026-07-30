import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean.MedicineObjects

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  let O := A.object
  match O with
  | @MedicineAdmittedObject _ _ _ _ _ _ => MedicineWitnessClosed O
  | _ => False

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  unfold bridgeClosed
  exact A.object.conclusion

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse