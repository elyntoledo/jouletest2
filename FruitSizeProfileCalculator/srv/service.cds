using { fruitSizeProfile } from '../db/schema.cds';

service fruitSizeProfileSrv {
  @odata.draft.enabled
  entity FruitSizeProfiles as projection on fruitSizeProfile.FruitSizeProfiles;
  entity FreshFruitWeightSamples as projection on fruitSizeProfile.FreshFruitWeightSamples;
}