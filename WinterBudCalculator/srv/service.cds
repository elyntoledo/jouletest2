using { winterBudCalculatorApp } from '../db/schema.cds';

service winterBudCalculatorAppSrv {
  @odata.draft.enabled
  entity WinterBudCalculators as projection on winterBudCalculatorApp.WinterBudCalculators;
  entity CalculatorA as projection on winterBudCalculatorApp.CalculatorA;
  entity CalculatorB as projection on winterBudCalculatorApp.CalculatorB;
}