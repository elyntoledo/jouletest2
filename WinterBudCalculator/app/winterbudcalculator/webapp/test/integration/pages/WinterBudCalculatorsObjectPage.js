sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'winterbudcalculator',
            componentId: 'WinterBudCalculatorsObjectPage',
            contextPath: '/WinterBudCalculators'
        },
        CustomPageDefinitions
    );
});