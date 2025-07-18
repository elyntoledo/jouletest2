using { fruitSizeProfileSrv } from '../../srv/service.cds';

annotate fruitSizeProfileSrv.FruitSizeProfiles with @UI.DataPoint #country: {
  Value: country_code,
  Title: 'Country',
};
annotate fruitSizeProfileSrv.FruitSizeProfiles with @UI.DataPoint #cultivar: {
  Value: cultivar_code,
  Title: 'Cultivar',
};
annotate fruitSizeProfileSrv.FruitSizeProfiles with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#country', ID: 'Country' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#cultivar', ID: 'Cultivar' }
];
annotate fruitSizeProfileSrv.FruitSizeProfiles with @UI.HeaderInfo: {
  TypeName: 'Fruit Size Profile',
  TypeNamePlural: 'Fruit Size Profiles'
};
annotate fruitSizeProfileSrv.FruitSizeProfiles with {
  country @Common.Label: 'Country';
  cultivar @Common.Label: 'Cultivar';
  fruitSizeWeightBand @Common.Label: 'Fruit Size Weight Band';
  totalFruitPieces @Common.Label: 'Total Fruit Pieces';
  averageFruitSize @Common.Label: 'Average Fruit Size';
  cropFruitSizeProfileGraph @Common.Label: 'Crop Fruit Size Profile Graph';
  freshFruitWeightSamples @Common.Label: 'Fresh Fruit Weight Samples'
};
annotate fruitSizeProfileSrv.FruitSizeProfiles with {
  country @Common.Text : { $value: country.name, ![@UI.TextArrangement]: #TextOnly };
  cultivar @Common.Text : { $value: cultivar.name, ![@UI.TextArrangement]: #TextOnly };
};
annotate fruitSizeProfileSrv.FruitSizeProfiles with {
  country @Common.ValueListWithFixedValues;
  cultivar @Common.ValueListWithFixedValues;
};
annotate fruitSizeProfileSrv.FruitSizeProfiles with @UI.SelectionFields : [
 country_code,
 cultivar_code
];
annotate fruitSizeProfileSrv.FruitSizeProfiles with @UI.LineItem : [
    { $Type: 'UI.DataField', Value: country_code },
    { $Type: 'UI.DataField', Value: cultivar_code },
    { $Type: 'UI.DataField', Value: fruitSizeWeightBand },
    { $Type: 'UI.DataField', Value: totalFruitPieces },
    { $Type: 'UI.DataField', Value: averageFruitSize },
    { $Type: 'UI.DataField', Value: cropFruitSizeProfileGraph }
];
annotate fruitSizeProfileSrv.FruitSizeProfiles with @UI.FieldGroup #fruitSizeProfileDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: country_code },
    { $Type: 'UI.DataField', Value: cultivar_code },
    { $Type: 'UI.DataField', Value: fruitSizeWeightBand },
    { $Type: 'UI.DataField', Value: totalFruitPieces },
    { $Type: 'UI.DataField', Value: averageFruitSize },
    { $Type: 'UI.DataField', Value: cropFruitSizeProfileGraph }

  ]
};


annotate fruitSizeProfileSrv.FreshFruitWeightSamples with @UI.LineItem #freshFruitWeightSamplesSection: [
    { $Type: 'UI.DataField', Value: freshFruitWeightSamples },
    { $Type: 'UI.DataField', Value: averageFreshFruitWeight }

  ];


annotate fruitSizeProfileSrv.FruitSizeProfiles with @UI.Facets: [
  {
    $Type: 'UI.CollectionFacet',
    ID: 'overviewTab',
    Label: 'Overview',
    Facets: [
      { $Type: 'UI.ReferenceFacet', ID: 'fruitSizeProfileDetails', Label: 'Fruit Size Profile Details', Target: '@UI.FieldGroup#fruitSizeProfileDetails' } ]
  },
  {
    $Type: 'UI.CollectionFacet',
    ID: 'weightSamplesTab',
    Label: 'Weight Samples',
    Facets: [
      { $Type: 'UI.ReferenceFacet', ID: 'freshFruitWeightSamplesSection', Label: 'Fresh Fruit Weight Samples', Target: 'freshFruitWeightSamples/@UI.LineItem#freshFruitWeightSamplesSection' } ]
  }
];
annotate fruitSizeProfileSrv.FreshFruitWeightSamples with {
  fruitSizeProfiles @Common.ValueList: {
    CollectionPath: 'FruitSizeProfiles',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: fruitSizeProfiles_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'country_code'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'cultivar_code'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'fruitSizeWeightBand'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalFruitPieces'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'averageFruitSize'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'cropFruitSizeProfileGraph'
      },
    ],
  }
};
annotate fruitSizeProfileSrv.FreshFruitWeightSamples with @UI.DataPoint #freshFruitWeightSamples: {
  Value: freshFruitWeightSamples,
  Title: 'Fresh Fruit Weight Samples',
};
annotate fruitSizeProfileSrv.FreshFruitWeightSamples with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#freshFruitWeightSamples', ID: 'FreshFruitWeightSamples' }
];
annotate fruitSizeProfileSrv.FreshFruitWeightSamples with @UI.HeaderInfo: {
  TypeName: 'Fresh Fruit Weight Sample',
  TypeNamePlural: 'Fresh Fruit Weight Samples'
};
annotate fruitSizeProfileSrv.FreshFruitWeightSamples with {
  freshFruitWeightSamples @Common.Label: 'Fresh Fruit Weight Samples';
  averageFreshFruitWeight @Common.Label: 'Average Fresh Fruit Weight';
  fruitSizeProfiles @Common.Label: 'Fruit Size Profile'
};
annotate fruitSizeProfileSrv.FreshFruitWeightSamples with @UI.SelectionFields: [
  fruitSizeProfiles_ID
];
annotate fruitSizeProfileSrv.FreshFruitWeightSamples with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: freshFruitWeightSamples },
    { $Type: 'UI.DataField', Value: averageFreshFruitWeight },
    { $Type: 'UI.DataField', Label: 'Fruit Size Profile', Value: fruitSizeProfiles_ID }
];
annotate fruitSizeProfileSrv.FreshFruitWeightSamples with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: freshFruitWeightSamples },
    { $Type: 'UI.DataField', Value: averageFreshFruitWeight },
    { $Type: 'UI.DataField', Label: 'Fruit Size Profile', Value: fruitSizeProfiles_ID }
]};
annotate fruitSizeProfileSrv.FreshFruitWeightSamples with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];