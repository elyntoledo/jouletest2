using { winterBudCalculatorAppSrv } from '../../srv/service.cds';

annotate winterBudCalculatorAppSrv.WinterBudCalculators with @UI.HeaderInfo: {
  TypeName: 'Winter Bud Calculator',
  TypeNamePlural: 'Winter Bud Calculators',
  Title: { Value: name }
};
annotate winterBudCalculatorAppSrv.WinterBudCalculators with {
  ID @UI.Hidden
};
annotate winterBudCalculatorAppSrv.WinterBudCalculators with @UI.Identification: [{ Value: name }];
annotate winterBudCalculatorAppSrv.WinterBudCalculators with {
  name @Common.Label: 'Name';
  calculatorA @Common.Label: 'Calculators A';
  calculatorB @Common.Label: 'Calculators B'
};
annotate winterBudCalculatorAppSrv.WinterBudCalculators with {
  ID @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly };
};
annotate winterBudCalculatorAppSrv.WinterBudCalculators with @UI.SelectionFields : [
 calculatorA.targetClass1Trays,
 calculatorA.averageSize,
 calculatorA.orchardThinRejectPerc,
 calculatorA.packoutRejectPerc,
 calculatorA.unproductivePerc,
 calculatorA.flowersPerBud,
 calculatorA.internodeSpacing,
 calculatorA.winterBudVolume
];
annotate winterBudCalculatorAppSrv.WinterBudCalculators with @UI.LineItem : [
    { $Type: 'UI.DataField', Value: name }
];
annotate winterBudCalculatorAppSrv.WinterBudCalculators with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: name }
]};
annotate winterBudCalculatorAppSrv.CalculatorA with @UI.LineItem #WinterBudCalculators_calculatorA: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: targetClass1Trays },
    { $Type: 'UI.DataField', Value: averageSize },
    { $Type: 'UI.DataField', Value: orchardThinRejectPerc },
    { $Type: 'UI.DataField', Value: packoutRejectPerc },
    { $Type: 'UI.DataField', Value: unproductivePerc },
    { $Type: 'UI.DataField', Value: flowersPerBud },
    { $Type: 'UI.DataField', Value: internodeSpacing },
    { $Type: 'UI.DataField', Value: fruitVolumeM2 },
    { $Type: 'UI.DataField', Value: winterBudVolume },
    { $Type: 'UI.DataField', Value: caneSpacing }
];
annotate winterBudCalculatorAppSrv.CalculatorB with @UI.LineItem #WinterBudCalculators_calculatorB: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: winterBudVolume },
    { $Type: 'UI.DataField', Value: flowersPerBud },
    { $Type: 'UI.DataField', Value: orchardThinRejectPerc },
    { $Type: 'UI.DataField', Value: packoutRejectPerc },
    { $Type: 'UI.DataField', Value: unproductivePerc },
    { $Type: 'UI.DataField', Value: averageSize },
    { $Type: 'UI.DataField', Value: fruitVolumeM2 },
    { $Type: 'UI.DataField', Value: targetClass1Trays }
];
annotate winterBudCalculatorAppSrv.WinterBudCalculators with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type: 'UI.ReferenceFacet', ID: 'calculatorA', Label: 'Calculators A', Target: 'calculatorA/@UI.LineItem#WinterBudCalculators_calculatorA' },
  { $Type: 'UI.ReferenceFacet', ID: 'calculatorB', Label: 'Calculators B', Target: 'calculatorB/@UI.LineItem#WinterBudCalculators_calculatorB' }
];
annotate winterBudCalculatorAppSrv.CalculatorA with {
  winterBudCalculators @Common.ValueList: {
    CollectionPath: 'WinterBudCalculators',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: winterBudCalculators_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
    ],
  }
};
annotate winterBudCalculatorAppSrv.CalculatorA with @UI.DataPoint #averageSize: {
  Value: averageSize,
  Title: 'Average Size',
};
annotate winterBudCalculatorAppSrv.CalculatorA with @UI.DataPoint #orchardThinRejectPerc: {
  Value: orchardThinRejectPerc,
  Title: 'Orchard Thin Reject Perc',
};
annotate winterBudCalculatorAppSrv.CalculatorA with @UI.DataPoint #packoutRejectPerc: {
  Value: packoutRejectPerc,
  Title: 'Packout Reject Perc',
};
annotate winterBudCalculatorAppSrv.CalculatorA with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#averageSize', ID: 'AverageSize' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#orchardThinRejectPerc', ID: 'OrchardThinRejectPerc' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#packoutRejectPerc', ID: 'PackoutRejectPerc' }
];
annotate winterBudCalculatorAppSrv.CalculatorA with @UI.HeaderInfo: {
  TypeName: 'Calculator A',
  TypeNamePlural: 'Calculators A',
  Title: { Value: targetClass1Trays }
};
annotate winterBudCalculatorAppSrv.CalculatorA with {
  ID @UI.Hidden
};
annotate winterBudCalculatorAppSrv.CalculatorA with @UI.Identification: [{ Value: targetClass1Trays }];
annotate winterBudCalculatorAppSrv.CalculatorA with {
  targetClass1Trays @Common.Label: 'Target Class1 Trays';
  averageSize @Common.Label: 'Average Size';
  orchardThinRejectPerc @Common.Label: 'Orchard Thin Reject Perc';
  packoutRejectPerc @Common.Label: 'Packout Reject Perc';
  unproductivePerc @Common.Label: 'Unproductive Perc';
  flowersPerBud @Common.Label: 'Flowers Per Bud';
  internodeSpacing @Common.Label: 'Internode Spacing';
  fruitVolumeM2 @Common.Label: 'Fruit Volume M2';
  winterBudVolume @Common.Label: 'Winter Bud Volume';
  caneSpacing @Common.Label: 'Cane Spacing';
  winterBudCalculators @Common.Label: 'Winter Bud Calculator'
};
annotate winterBudCalculatorAppSrv.CalculatorA with {
  ID @Common.Text: { $value: targetClass1Trays, ![@UI.TextArrangement]: #TextOnly };
  winterBudCalculators @Common.Text: { $value: winterBudCalculators.name, ![@UI.TextArrangement]: #TextOnly };
};
annotate winterBudCalculatorAppSrv.CalculatorA with @UI.SelectionFields: [
  winterBudCalculators_ID
];
annotate winterBudCalculatorAppSrv.CalculatorA with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: targetClass1Trays },
    { $Type: 'UI.DataField', Value: averageSize },
    { $Type: 'UI.DataField', Value: orchardThinRejectPerc },
    { $Type: 'UI.DataField', Value: packoutRejectPerc },
    { $Type: 'UI.DataField', Value: unproductivePerc },
    { $Type: 'UI.DataField', Value: flowersPerBud },
    { $Type: 'UI.DataField', Value: internodeSpacing },
    { $Type: 'UI.DataField', Value: fruitVolumeM2 },
    { $Type: 'UI.DataField', Value: winterBudVolume },
    { $Type: 'UI.DataField', Value: caneSpacing },
    { $Type: 'UI.DataField', Label: 'Winter Bud Calculator', Value: winterBudCalculators_ID }
];
annotate winterBudCalculatorAppSrv.CalculatorA with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: targetClass1Trays },
    { $Type: 'UI.DataField', Value: averageSize },
    { $Type: 'UI.DataField', Value: orchardThinRejectPerc },
    { $Type: 'UI.DataField', Value: packoutRejectPerc },
    { $Type: 'UI.DataField', Value: unproductivePerc },
    { $Type: 'UI.DataField', Value: flowersPerBud },
    { $Type: 'UI.DataField', Value: internodeSpacing },
    { $Type: 'UI.DataField', Value: fruitVolumeM2 },
    { $Type: 'UI.DataField', Value: winterBudVolume },
    { $Type: 'UI.DataField', Value: caneSpacing },
    { $Type: 'UI.DataField', Label: 'Winter Bud Calculator', Value: winterBudCalculators_ID }
]};
annotate winterBudCalculatorAppSrv.CalculatorA with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];
annotate winterBudCalculatorAppSrv.CalculatorB with {
  winterBudCalculators @Common.ValueList: {
    CollectionPath: 'WinterBudCalculators',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: winterBudCalculators_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
    ],
  }
};
annotate winterBudCalculatorAppSrv.CalculatorB with @UI.DataPoint #flowersPerBud: {
  Value: flowersPerBud,
  Title: 'Flowers Per Bud',
};
annotate winterBudCalculatorAppSrv.CalculatorB with @UI.DataPoint #orchardThinRejectPerc: {
  Value: orchardThinRejectPerc,
  Title: 'Orchard Thin Reject Perc',
};
annotate winterBudCalculatorAppSrv.CalculatorB with @UI.DataPoint #packoutRejectPerc: {
  Value: packoutRejectPerc,
  Title: 'Packout Reject Perc',
};
annotate winterBudCalculatorAppSrv.CalculatorB with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#flowersPerBud', ID: 'FlowersPerBud' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#orchardThinRejectPerc', ID: 'OrchardThinRejectPerc' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#packoutRejectPerc', ID: 'PackoutRejectPerc' }
];
annotate winterBudCalculatorAppSrv.CalculatorB with @UI.HeaderInfo: {
  TypeName: 'Calculator B',
  TypeNamePlural: 'Calculators B',
  Title: { Value: winterBudVolume }
};
annotate winterBudCalculatorAppSrv.CalculatorB with {
  ID @UI.Hidden
};
annotate winterBudCalculatorAppSrv.CalculatorB with @UI.Identification: [{ Value: winterBudVolume }];
annotate winterBudCalculatorAppSrv.CalculatorB with {
  winterBudVolume @Common.Label: 'Winter Bud Volume';
  flowersPerBud @Common.Label: 'Flowers Per Bud';
  orchardThinRejectPerc @Common.Label: 'Orchard Thin Reject Perc';
  packoutRejectPerc @Common.Label: 'Packout Reject Perc';
  unproductivePerc @Common.Label: 'Unproductive Perc';
  averageSize @Common.Label: 'Average Size';
  fruitVolumeM2 @Common.Label: 'Fruit Volume M2';
  targetClass1Trays @Common.Label: 'Target Class1 Trays';
  winterBudCalculators @Common.Label: 'Winter Bud Calculator'
};
annotate winterBudCalculatorAppSrv.CalculatorB with {
  winterBudCalculators @Common.Text: { $value: winterBudCalculators.name, ![@UI.TextArrangement]: #TextOnly };
};
annotate winterBudCalculatorAppSrv.CalculatorB with @UI.SelectionFields: [
  winterBudCalculators_ID
];
annotate winterBudCalculatorAppSrv.CalculatorB with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: winterBudVolume },
    { $Type: 'UI.DataField', Value: flowersPerBud },
    { $Type: 'UI.DataField', Value: orchardThinRejectPerc },
    { $Type: 'UI.DataField', Value: packoutRejectPerc },
    { $Type: 'UI.DataField', Value: unproductivePerc },
    { $Type: 'UI.DataField', Value: averageSize },
    { $Type: 'UI.DataField', Value: fruitVolumeM2 },
    { $Type: 'UI.DataField', Value: targetClass1Trays },
    { $Type: 'UI.DataField', Label: 'Winter Bud Calculator', Value: winterBudCalculators_ID }
];
annotate winterBudCalculatorAppSrv.CalculatorB with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: winterBudVolume },
    { $Type: 'UI.DataField', Value: flowersPerBud },
    { $Type: 'UI.DataField', Value: orchardThinRejectPerc },
    { $Type: 'UI.DataField', Value: packoutRejectPerc },
    { $Type: 'UI.DataField', Value: unproductivePerc },
    { $Type: 'UI.DataField', Value: averageSize },
    { $Type: 'UI.DataField', Value: fruitVolumeM2 },
    { $Type: 'UI.DataField', Value: targetClass1Trays },
    { $Type: 'UI.DataField', Label: 'Winter Bud Calculator', Value: winterBudCalculators_ID }
]};
annotate winterBudCalculatorAppSrv.CalculatorB with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];