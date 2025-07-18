using { thinningCalculator } from '../db/schema.cds';

service thinningCalculatorSrv {
  @odata.draft.enabled
  entity ThinningCalculations as projection on thinningCalculator.ThinningCalculations;
  entity FruitVarietyMasters as projection on thinningCalculator.FruitVarietyMasters;
  entity GrowthCurveMasters as projection on thinningCalculator.GrowthCurveMasters;
  entity FruitSizesValuesMasters as projection on thinningCalculator.FruitSizesValuesMasters;
}