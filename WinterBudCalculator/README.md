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


This CAP project and the included SAP Fiori application were generated with the Project Accelerator, using the prompt:     I want to develop an SAP Fiori application that fulfills the requirements outlined in the following user story:  
    Description: As a user, I need to calculate Winter Bud volumes and Cane Spacing using Calculator A, and Production yield (Class 1 trays) using Calculator B.  
    Winter Bud Calculators:  
    Fields:  
    Calculator A:  
    Target\_class1\_trays (Numeric, Key, Mandatory, Range: 1–30,000),  
    Average\_size (Numeric, Mandatory, Range: 16–49),  
    Orchard\_thin\_reject\_perc (Numeric, Mandatory, Range: 1–100%),  
    Packout\_reject\_perc (Numeric, Mandatory, Range: 1–100%),  
    Unproductive\_perc (Numeric, Mandatory, Range: 1–100%),  
    Flowers\_per\_bud (Numeric, Mandatory, &amp;gt; 0),  
    Internode\_spacing (Numeric, Mandatory, &amp;gt; 0).  
    Output Fields:  
    Fruit\_volume\_m2 (Numeric),  
    Winter\_bud\_volume (Numeric),  
    Cane\_spacing (Numeric).  

    Calculator B:  
    Winter\_bud\_volume (Numeric, Key, Mandatory, &amp;gt; 0),  
    Flowers\_per\_bud (Numeric, Mandatory, &amp;gt; 0),  
    Orchard\_thin\_reject\_perc (Numeric, Mandatory, Range: 1–100%),  
    Packout\_reject\_perc (Numeric, Mandatory, Range: 1–100%),  
    Unproductive\_perc (Numeric, Mandatory, Range: 1–100%),  
    Average\_size (Numeric, Mandatory, Range: 16–49).  
    Output Fields:  
    Fruit\_volume\_m2 (Numeric),  
    Target\_class1\_trays (Numeric).  

    Selection Fields: Target\_class1\_trays, Average\_size, Orchard\_thin\_reject\_perc, Packout\_reject\_perc, Unproductive\_perc, Flowers\_per\_bud, Internode\_spacing, Winter\_bud\_volume. 

Processing Logic:  
    Calculator A:  
    1. Calculate \`Fruit\_volume\_m2\`:  
        \`\`\`  
        Fruit\_volume\_m2 = Target\_class1\_trays &#x2F; ((1 - Unproductive\_perc) \* (1 - (Orchard\_thin\_reject\_perc + Packout\_reject\_perc))) \* Average\_size &#x2F; 10,000  
        \`\`\`  
    2. Calculate \`Winter\_bud\_volume\`:  
        \`\`\`  
        Winter\_bud\_volume = Fruit\_volume\_m2 &#x2F; Flowers\_per\_bud  
        \`\`\`  
    3. Calculate \`Cane\_spacing\`:  
        \`\`\`  
        Cane\_spacing = (1 &#x2F; Winter\_bud\_volume) \* Internode\_spacing \* 1,000,000  
        \`\`\`  

    Calculator B:  
    1. Calculate \`Fruit\_volume\_m2\`:  
        \`\`\`  
        Fruit\_volume\_m2 = Winter\_bud\_volume \* Flowers\_per\_bud  
        \`\`\`  
    2. Calculate \`Target\_class1\_trays\`:  
        \`\`\`  
        Target\_class1\_trays = Fruit\_volume\_m2 \* ((1 - Unproductive\_perc) \* (1 - (Orchard\_thin\_reject\_perc + Packout\_reject\_perc))) &#x2F; Average\_size \* 10,000  
        \`\`\`  

    Additionally, I need the ability to create, update, and delete functionality.  
    Error Handling:  
    - Use \`req.error()\` or \`req.reject()\` for invalid inputs.  
    - Example error messages:  
        - &quot;Please enter Target Class 1 trays.&quot;  
        - &quot;Target Class 1 trays should be between 1 and 30,000.&quot;  
        - &quot;Average size must be between 16 and 49.&quot;  
        - &quot;Winter bud volume must be greater than 0.&quot;  
    - Implement try-catch blocks for API calls and database operations.  
    - Sample error handling:  
        \`\`\`  
        try {  
            const result = await executeCalculator();  
        } catch (error) {  
            req.error(500, &quot;Calculation failed. Please check your inputs.&quot;);  
        }  
        \`\`\`.
