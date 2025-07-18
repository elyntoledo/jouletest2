namespace winterBudCalculatorApp;

entity WinterBudCalculators {
  key ID: UUID;
  name: String(50) @assert.unique @mandatory;
  calculatorA: Association to many CalculatorA on calculatorA.winterBudCalculators = $self;
  calculatorB: Association to many CalculatorB on calculatorB.winterBudCalculators = $self;
}

entity CalculatorA {
  key ID: UUID;
  targetClass1Trays: String(50) @assert.unique @mandatory;
  averageSize: String(50);
  orchardThinRejectPerc: String(50);
  packoutRejectPerc: String(50);
  unproductivePerc: String(50);
  flowersPerBud: Integer;
  internodeSpacing: Decimal;
  fruitVolumeM2: Decimal;
  winterBudVolume: Decimal;
  caneSpacing: Decimal;
  winterBudCalculators: Association to WinterBudCalculators;
}

entity CalculatorB {
  key ID: UUID;
  winterBudVolume: Decimal @assert.unique @mandatory;
  flowersPerBud: Integer;
  orchardThinRejectPerc: String(50);
  packoutRejectPerc: String(50);
  unproductivePerc: String(50);
  averageSize: String(50);
  fruitVolumeM2: Decimal;
  targetClass1Trays: Integer;
  winterBudCalculators: Association to WinterBudCalculators;
}
