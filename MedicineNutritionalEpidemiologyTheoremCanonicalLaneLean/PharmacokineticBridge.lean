import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean

structure PharmacokineticPackage where
  absorptionRate : ℝ
  distributionVolume : ℝ
  eliminationRate : ℝ
  doseResponse : ℝ → ℝ
  steadyState : Prop

structure PharmacokineticEvidence (P : PharmacokineticPackage) where
  absorptionRateClosed : P.absorptionRate > 0
  distributionVolumeClosed : P.distributionVolume > 0
  eliminationRateClosed : P.eliminationRate > 0
  doseResponseClosed : P.doseResponse 0 = 0
  steadyStateClosed : P.steadyState

def PharmacokineticClosed (P : PharmacokineticPackage) : Prop :=
  P.absorptionRate > 0 ∧ P.distributionVolume > 0 ∧
  P.eliminationRate > 0 ∧ P.doseResponse 0 = 0 ∧ P.steadyState

theorem pharmacokinetic_closed_from_evidence (P : PharmacokineticPackage)
    (E : PharmacokineticEvidence P) : PharmacokineticClosed P := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.distributionVolumeClosed
      (And.intro E.eliminationRateClosed
        (And.intro E.doseResponseClosed E.steadyStateClosed)))

end MedicineNutritionalEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
