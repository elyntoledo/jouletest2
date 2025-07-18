# Getting Started

Welcome to your new project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this getting started guide


## Next Steps

- Open a new terminal and run `cds watch`
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).


## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.


This CAP project and the included SAP Fiori application were generated with the Project Accelerator, using the prompt: I want to develop an SAP Fiori application that fulfills the requirements outlined in the following user story:  
    Description: As a grower or agricultural personnel, I need to calculate thinning weight for fruits based on various parameters and validate input fields for accuracy.  
    Thinning Calculator App:  
    Fields:  
    Country (Dropdown: France, Italy, Japan, New Zealand, South Korea, Key, Mandatory),  
    Variety (Dropdown: SunGold, Green, RubyRed, Key, Mandatory),  
    Date\_FullBloom (Date, Mandatory),  
    Date\_Thinning (Date, Mandatory),  
    Date\_Harvest (Date, Mandatory),  
    Target\_SizeRemove (Dropdown: Gold3: 36, 39 (NSS), 42 (NSS), Undersized; Hayward: 39, 42, 46 (NSS), Undersized; Red19: 42, 46 (NSS), 49 (NSS), Undersized, Mandatory),  
    Thinning\_Weight (Numeric).  
    Selection Fields: Country, Variety, Target\_SizeRemove

Processing Logic:  
    1. Validate input fields:  
        - Ensure Fruit Variety exists in the Fruit Variety Master for the selected Country.  
        - Validate Date of Full Bloom against the Bloom start and end dates.  
        - Validate Date of Thinning against the Growth Curve Master.  
        - Validate Date of Harvest against the Growth Curve Master.  
        - Ensure Target Size to Remove exists in the Fruit Sizes Values Master for the selected Country and Variety.  
    2. Calculate Thinning Weight:  
        - Determine DFB\_HARVEST\_days: Days between Date of Full Bloom and Date of Harvest.  
        - Lookup FW\_Constant for DFB\_HARVEST\_days from Growth Curve Master.  
        - Determine DFB\_THINNING\_days: Days between Date of Full Bloom and Date of Thinning.  
        - Lookup FW\_Constant for DFB\_THINNING\_days from Growth Curve Master.  
        - Lookup Maximum Weight Band for Target Size to Remove from Fruit Sizes Values Master.  
        - Formula: Thinning Weight = MaximumWeightBand &#x2F; (DFB\_HARVEST\_FW &#x2F; DFB\_THINNING\_FW).  
    3. Error Handling:  
        - Invalid Fruit Variety: &quot;Invalid Fruit Variety. Please choose a valid Fruit Variety.&quot;  
        - Invalid Date of Full Bloom: &quot;The Date of Full Bloom must be between the following Bloom dates D1 and D2.&quot;  
        - Invalid Date of Thinning: &quot;The Date of Thinning must be between (N1) &amp; (N2) for Variety V.&quot;  
        - Invalid Date of Harvest: &quot;The Date of Harvest must be between X &amp; (N2) for Variety V.&quot;  
        - Missing Target Fruit Size: &quot;Missing Target Fruit Size - Thin Target Size values.&quot;  
    Additionally, I need the ability to create, update, and delete functionality..
