sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'winterbudcalculator/test/integration/FirstJourney',
		'winterbudcalculator/test/integration/pages/WinterBudCalculatorsList',
		'winterbudcalculator/test/integration/pages/WinterBudCalculatorsObjectPage'
    ],
    function(JourneyRunner, opaJourney, WinterBudCalculatorsList, WinterBudCalculatorsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('winterbudcalculator') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheWinterBudCalculatorsList: WinterBudCalculatorsList,
					onTheWinterBudCalculatorsObjectPage: WinterBudCalculatorsObjectPage
                }
            },
            opaJourney.run
        );
    }
);