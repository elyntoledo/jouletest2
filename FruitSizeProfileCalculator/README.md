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
Description: As a user, I need to calculate the Fruit Size Profile based on fresh fruit weight samples and generate a summary of fruit counts, average weights, and a crop fruit size profile graph.  
Fields:  
Country (Dropdown: New Zealand, France, Italy, South Korea, Japan, Mandatory),  
Cultivar (Dropdown: Gold3, Hayward, Red19, Mandatory),  
FreshFruitWeightSamples (Comma-separated or list of fruit weights in grams, Mandatory),  
FruitSizeWeightBand (Calculated, Numeric),  
TotalFruitPieces (Calculated, Numeric),  
AverageFreshFruitWeight (Calculated, Numeric),  
AverageFruitSize (Calculated, Numeric),  
CropFruitSizeProfileGraph (Calculated, Graph).  
Selection Fields: Country, Cultivar. .
