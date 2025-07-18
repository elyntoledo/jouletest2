using { thinningCalculatorSrv } from '../../srv/service.cds';

annotate thinningCalculatorSrv.ThinningCalculations with @UI.DataPoint #variety: {
  Value: variety_code,
  Title: 'Variety',
};
annotate thinningCalculatorSrv.ThinningCalculations with @UI.DataPoint #dateFullBloom: {
  Value: dateFullBloom,
  Title: 'Date Full Bloom',
};
annotate thinningCalculatorSrv.ThinningCalculations with @UI.DataPoint #dateThinning: {
  Value: dateThinning,
  Title: 'Date Thinning',
};
annotate thinningCalculatorSrv.ThinningCalculations with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#variety', ID: 'Variety' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#dateFullBloom', ID: 'DateFullBloom' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#dateThinning', ID: 'DateThinning' }
];
annotate thinningCalculatorSrv.ThinningCalculations with @UI.HeaderInfo: {
  TypeName: 'Thinning Calculation',
  TypeNamePlural: 'Thinning Calculations',
  Title: { Value: country }
};
annotate thinningCalculatorSrv.ThinningCalculations with {
  ID @UI.Hidden
};
annotate thinningCalculatorSrv.ThinningCalculations with @UI.Identification: [{ Value: country }];
annotate thinningCalculatorSrv.ThinningCalculations with {
  country @Common.Label: 'Country';
  variety @Common.Label: 'Variety';
  dateFullBloom @Common.Label: 'Date Full Bloom';
  dateThinning @Common.Label: 'Date Thinning';
  dateHarvest @Common.Label: 'Date Harvest';
  targetSizeRemove @Common.Label: 'Target Size Remove';
  thinningWeight @Common.Label: 'Thinning Weight';
  fruitVarietyMaster @Common.Label: 'Fruit Variety Masters';
  growthCurveMaster @Common.Label: 'Growth Curve Masters';
  fruitSizesValuesMaster @Common.Label: 'Fruit Sizes Values Masters'
};
annotate thinningCalculatorSrv.ThinningCalculations with {
  ID @Common.Text: { $value: country, ![@UI.TextArrangement]: #TextOnly };
  variety @Common.Text : { $value: variety.name, ![@UI.TextArrangement]: #TextOnly };
  targetSizeRemove @Common.Text : { $value: targetSizeRemove.name, ![@UI.TextArrangement]: #TextOnly };
};
annotate thinningCalculatorSrv.ThinningCalculations with {
  variety @Common.ValueListWithFixedValues;
  targetSizeRemove @Common.ValueListWithFixedValues;
};
annotate thinningCalculatorSrv.ThinningCalculations with @UI.SelectionFields : [
 country,
 variety_code,
 targetSizeRemove_code
];
annotate thinningCalculatorSrv.ThinningCalculations with @UI.LineItem : [
    { $Type: 'UI.DataField', Value: country },
    { $Type: 'UI.DataField', Value: variety_code },
    { $Type: 'UI.DataField', Value: dateFullBloom },
    { $Type: 'UI.DataField', Value: dateThinning },
    { $Type: 'UI.DataField', Value: dateHarvest },
    { $Type: 'UI.DataField', Value: targetSizeRemove_code, Criticality: targetSizeRemove.criticality },
    { $Type: 'UI.DataField', Value: thinningWeight }
];
annotate thinningCalculatorSrv.FruitVarietyMasters with @UI.LineItem #fruitVarietyMasterSection: [
    { $Type: 'UI.DataField', Value: fruitVariety }

  ];


annotate thinningCalculatorSrv.GrowthCurveMasters with @UI.LineItem #growthCurveMasterSection: [
    { $Type: 'UI.DataField', Value: growthCurveId }

  ];


annotate thinningCalculatorSrv.FruitSizesValuesMasters with @UI.LineItem #fruitSizesValuesMasterSection: [
    { $Type: 'UI.DataField', Value: fruitSizeValue }

  ];


annotate thinningCalculatorSrv.ThinningCalculations with @UI.Facets: [
  {
    $Type: 'UI.CollectionFacet',
    ID: 'detailsTab',
    Label: 'Details',
    Facets: [
      { $Type: 'UI.ReferenceFacet', ID: 'fruitVarietyMasterSection', Label: 'Fruit Variety Master', Target: 'fruitVarietyMaster/@UI.LineItem#fruitVarietyMasterSection' },
      { $Type: 'UI.ReferenceFacet', ID: 'growthCurveMasterSection', Label: 'Growth Curve Master', Target: 'growthCurveMaster/@UI.LineItem#growthCurveMasterSection' },
      { $Type: 'UI.ReferenceFacet', ID: 'fruitSizesValuesMasterSection', Label: 'Fruit Sizes Values Master', Target: 'fruitSizesValuesMaster/@UI.LineItem#fruitSizesValuesMasterSection' } ]
  }
];
annotate thinningCalculatorSrv.FruitVarietyMasters with {
  thinningCalculations @Common.ValueList: {
    CollectionPath: 'ThinningCalculations',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: thinningCalculations_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'country'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'variety_code'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'dateFullBloom'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'dateThinning'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'dateHarvest'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'targetSizeRemove_code'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'thinningWeight'
      },
    ],
  }
};
annotate thinningCalculatorSrv.FruitVarietyMasters with @UI.HeaderInfo: {
  TypeName: 'Fruit Variety Master',
  TypeNamePlural: 'Fruit Variety Masters',
  Title: { Value: fruitVariety }
};
annotate thinningCalculatorSrv.FruitVarietyMasters with {
  ID @UI.Hidden
};
annotate thinningCalculatorSrv.FruitVarietyMasters with @UI.Identification: [{ Value: fruitVariety }];
annotate thinningCalculatorSrv.FruitVarietyMasters with {
  fruitVariety @Common.Label: 'Fruit Variety';
  thinningCalculations @Common.Label: 'Thinning Calculation'
};
annotate thinningCalculatorSrv.FruitVarietyMasters with {
  ID @Common.Text: { $value: fruitVariety, ![@UI.TextArrangement]: #TextOnly };
  thinningCalculations @Common.Text: { $value: thinningCalculations.country, ![@UI.TextArrangement]: #TextOnly };
};
annotate thinningCalculatorSrv.FruitVarietyMasters with @UI.SelectionFields: [
  thinningCalculations_ID
];
annotate thinningCalculatorSrv.FruitVarietyMasters with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: fruitVariety },
    { $Type: 'UI.DataField', Label: 'Thinning Calculation', Value: thinningCalculations_ID }
];
annotate thinningCalculatorSrv.FruitVarietyMasters with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: fruitVariety },
    { $Type: 'UI.DataField', Label: 'Thinning Calculation', Value: thinningCalculations_ID }
]};
annotate thinningCalculatorSrv.FruitVarietyMasters with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];
annotate thinningCalculatorSrv.GrowthCurveMasters with {
  thinningCalculations @Common.ValueList: {
    CollectionPath: 'ThinningCalculations',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: thinningCalculations_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'country'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'variety_code'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'dateFullBloom'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'dateThinning'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'dateHarvest'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'targetSizeRemove_code'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'thinningWeight'
      },
    ],
  }
};
annotate thinningCalculatorSrv.GrowthCurveMasters with @UI.HeaderInfo: {
  TypeName: 'Growth Curve Master',
  TypeNamePlural: 'Growth Curve Masters',
  Title: { Value: growthCurveId }
};
annotate thinningCalculatorSrv.GrowthCurveMasters with {
  ID @UI.Hidden
};
annotate thinningCalculatorSrv.GrowthCurveMasters with @UI.Identification: [{ Value: growthCurveId }];
annotate thinningCalculatorSrv.GrowthCurveMasters with {
  growthCurveId @Common.Label: 'Growth Curve Id';
  thinningCalculations @Common.Label: 'Thinning Calculation'
};
annotate thinningCalculatorSrv.GrowthCurveMasters with {
  ID @Common.Text: { $value: growthCurveId, ![@UI.TextArrangement]: #TextOnly };
  thinningCalculations @Common.Text: { $value: thinningCalculations.country, ![@UI.TextArrangement]: #TextOnly };
};
annotate thinningCalculatorSrv.GrowthCurveMasters with @UI.SelectionFields: [
  thinningCalculations_ID
];
annotate thinningCalculatorSrv.GrowthCurveMasters with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: growthCurveId },
    { $Type: 'UI.DataField', Label: 'Thinning Calculation', Value: thinningCalculations_ID }
];
annotate thinningCalculatorSrv.GrowthCurveMasters with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: growthCurveId },
    { $Type: 'UI.DataField', Label: 'Thinning Calculation', Value: thinningCalculations_ID }
]};
annotate thinningCalculatorSrv.GrowthCurveMasters with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];
annotate thinningCalculatorSrv.FruitSizesValuesMasters with {
  thinningCalculations @Common.ValueList: {
    CollectionPath: 'ThinningCalculations',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: thinningCalculations_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'country'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'variety_code'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'dateFullBloom'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'dateThinning'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'dateHarvest'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'targetSizeRemove_code'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'thinningWeight'
      },
    ],
  }
};
annotate thinningCalculatorSrv.FruitSizesValuesMasters with @UI.HeaderInfo: {
  TypeName: 'Fruit Sizes Values Master',
  TypeNamePlural: 'Fruit Sizes Values Masters',
  Title: { Value: fruitSizeValue }
};
annotate thinningCalculatorSrv.FruitSizesValuesMasters with {
  ID @UI.Hidden
};
annotate thinningCalculatorSrv.FruitSizesValuesMasters with @UI.Identification: [{ Value: fruitSizeValue }];
annotate thinningCalculatorSrv.FruitSizesValuesMasters with {
  fruitSizeValue @Common.Label: 'Fruit Size Value';
  thinningCalculations @Common.Label: 'Thinning Calculation'
};
annotate thinningCalculatorSrv.FruitSizesValuesMasters with {
  ID @Common.Text: { $value: fruitSizeValue, ![@UI.TextArrangement]: #TextOnly };
  thinningCalculations @Common.Text: { $value: thinningCalculations.country, ![@UI.TextArrangement]: #TextOnly };
};
annotate thinningCalculatorSrv.FruitSizesValuesMasters with @UI.SelectionFields: [
  thinningCalculations_ID
];
annotate thinningCalculatorSrv.FruitSizesValuesMasters with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: fruitSizeValue },
    { $Type: 'UI.DataField', Label: 'Thinning Calculation', Value: thinningCalculations_ID }
];
annotate thinningCalculatorSrv.FruitSizesValuesMasters with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: fruitSizeValue },
    { $Type: 'UI.DataField', Label: 'Thinning Calculation', Value: thinningCalculations_ID }
]};
annotate thinningCalculatorSrv.FruitSizesValuesMasters with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];