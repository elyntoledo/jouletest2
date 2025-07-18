using { sap.common.CodeList } from '@sap/cds/common';

namespace fruitSizeProfile;

entity FruitSizeProfilesCountryCodeList : CodeList {
  @Common.Text : { $value: name, ![@UI.TextArrangement]: #TextOnly }
  key code : String(50);
}

entity FruitSizeProfilesCultivarCodeList : CodeList {
  @Common.Text : { $value: name, ![@UI.TextArrangement]: #TextOnly }
  key code : String(50);
}

entity FruitSizeProfiles {
  key ID: UUID;
  country: Association to FruitSizeProfilesCountryCodeList;
  cultivar: Association to FruitSizeProfilesCultivarCodeList;
  fruitSizeWeightBand: Decimal;
  totalFruitPieces: Integer;
  averageFruitSize: Decimal;
  cropFruitSizeProfileGraph: String(50);
  freshFruitWeightSamples: Association to many FreshFruitWeightSamples on freshFruitWeightSamples.fruitSizeProfiles = $self;
}

entity FreshFruitWeightSamples {
  key ID: UUID;
  freshFruitWeightSamples: String(255);
  averageFreshFruitWeight: Decimal;
  fruitSizeProfiles: Association to FruitSizeProfiles;
}
