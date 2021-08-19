# Code for COBOL Backend of the Services

This directory essentially contains projects that are serving as the backend of the services.
These projects reside within the Micro Focus Enterprise Developer and are deployed using the Micro Focus Enterprise Server.
Most of them follow a common directory structure:

|Directory/File name | Purpose |
|---|---|
|`cbl`| This directory contains all the COBOL code of the project.|
|`copybook`|This directory contains the [copybooks](https://www.ibm.com/docs/en/odm/8.0.1?topic=generation-cobol-copybook).|
|`New_Configuration.bin`| This directory contains the compiled files.|
|`system`| This directory contains files required by the Enterprise Server region associated with the project.|
|`xml` | This directory contains the configuration file for CICS Web Service (CWS) Pipeline.|
|CICSWebServicesTemplate.xml | This file has the template for creating a new ES region with CWS configured.|
|\*.wsbind | This file is auto-generated when a new CWS is created and has the configurations for that CWS.|
|\*.json| These are json files that contain the request and response JSON structure of a CWS. They are also auto-generated from copybooks when a CWS is created.|
