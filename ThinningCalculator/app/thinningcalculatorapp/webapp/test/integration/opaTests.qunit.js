sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'thinningcalculatorapp/test/integration/FirstJourney',
		'thinningcalculatorapp/test/integration/pages/ThinningCalculationsList',
		'thinningcalculatorapp/test/integration/pages/ThinningCalculationsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ThinningCalculationsList, ThinningCalculationsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('thinningcalculatorapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheThinningCalculationsList: ThinningCalculationsList,
					onTheThinningCalculationsObjectPage: ThinningCalculationsObjectPage
                }
            },
            opaJourney.run
        );
    }
);