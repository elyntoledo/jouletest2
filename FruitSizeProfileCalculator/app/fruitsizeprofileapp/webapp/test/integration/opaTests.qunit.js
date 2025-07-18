sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'fruitsizeprofileapp/test/integration/FirstJourney',
		'fruitsizeprofileapp/test/integration/pages/FruitSizeProfilesList',
		'fruitsizeprofileapp/test/integration/pages/FruitSizeProfilesObjectPage'
    ],
    function(JourneyRunner, opaJourney, FruitSizeProfilesList, FruitSizeProfilesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('fruitsizeprofileapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheFruitSizeProfilesList: FruitSizeProfilesList,
					onTheFruitSizeProfilesObjectPage: FruitSizeProfilesObjectPage
                }
            },
            opaJourney.run
        );
    }
);