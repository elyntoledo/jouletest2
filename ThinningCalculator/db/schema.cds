using { sap.common.CodeList } from '@sap/cds/common';

namespace thinningCalculator;

entity ThinningCalculationsVarietyCodeList : CodeList {
  @Common.Text : { $value: name, ![@UI.TextArrangement]: #TextOnly }
  key code : String(50);
}

entity ThinningCalculationsTargetSizeRemoveCodeList : CodeList {
  @Common.Text : { $value: name, ![@UI.TextArrangement]: #TextOnly }
  key code : String(50);
  criticality : Integer;
}

entity ThinningCalculations {
  key ID: UUID;
  country: String(50) @assert.unique @mandatory;
  variety: Association to ThinningCalculationsVarietyCodeList;
  dateFullBloom: Date;
  dateThinning: Date;
  dateHarvest: Date;
  targetSizeRemove: Association to ThinningCalculationsTargetSizeRemoveCodeList;
  thinningWeight: Decimal;
  fruitVarietyMaster: Association to many FruitVarietyMasters on fruitVarietyMaster.thinningCalculations = $self;
  growthCurveMaster: Association to many GrowthCurveMasters on growthCurveMaster.thinningCalculations = $self;
  fruitSizesValuesMaster: Association to many FruitSizesValuesMasters on fruitSizesValuesMaster.thinningCalculations = $self;
}

entity FruitVarietyMasters {
  key ID: UUID;
  fruitVariety: String(50) @assert.unique @mandatory;
  thinningCalculations: Association to ThinningCalculations;
}

entity GrowthCurveMasters {
  key ID: UUID;
  growthCurveId: String(50) @assert.unique @mandatory;
  thinningCalculations: Association to ThinningCalculations;
}

entity FruitSizesValuesMasters {
  key ID: UUID;
  fruitSizeValue: String(50) @assert.unique @mandatory;
  thinningCalculations: Association to ThinningCalculations;
}
