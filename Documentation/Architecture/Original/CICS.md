# Original CICS Architecture of the Application

## [Definition](https://www.ibm.com/docs/en/zos-basic-skills?topic=zos-introduction-cics)

CICS stands for "Customer Information Control System." It is a general-purpose transaction processing subsystem for the z/OS operating system. CICS provides services for running an application online, by request, at the same time as many other users are submitting requests to run the same applications, using the same files and programs.

CICS manages the sharing of resources, the integrity of data and prioritization of execution, with fast response. CICS authorizes users, allocates resources (real storage and cycles), and passes on database requests by the application to the appropriate database manager (such as DB2). We could say that CICS acts like, and performs many of the same functions as the z/OS operating system.

## Components

In this application, the whole CICS part can be divided into 4 components:

### Screen

This is the front-end. This is what the end-user sees and interacts with. It is like the HTML + CSS of the legacy application. A screen is created using [BMS](https://www.ibm.com/docs/en/cics-ts/4.2?topic=partn-basic-mapping-support)

BMS (Basic mapping support) is an application programming interface between CICS programs and terminal devices.
For many applications, BMS has several advantages. First, BMS removes device dependencies from the application program. It interprets device-independent output commands and generates device-dependent data streams for specific terminals. It also transforms incoming device-dependent data into device-independent format. These features eliminate the need to learn complex device data streams. Allowing you to use the same program for various devices, because BMS determines the device information from the terminal definition, not from the application program.
Second, BMS separates the design and preparation of formats from application logic, reducing the impact of one on the other. Both of these features make it easier to write new programs and to maintain existing code.

This application has [12 mapsets](link to folder). Each Mapset has 2 maps in it:
1. The Main Screen: This is the actual screen which the user interacts with.
1. The Help Screen: This provides information about the associated main screen.

The only exception is the `MBANK99` screen which has only the main screen as it is the exit screen.

The information about Screens can be visualised using the [Screen Flow Diagram](https://openmainframeproject-internship.github.io/COBOL-Modernization/Screen%20Flow.html) which summarises the screens present and the programs that handle them.

### Screen Handling Programs

Associated with each mapset is a screen handling program written in COBOL. As the name suggests, it's function is to handle the setup and input and output of the screen. The name of these programs start with 'S' and correspond to the mapset they handle.
So, `MBANK10` is handled by `SBANK10P` and `MBANK35` is handled by `SBANK35P`.

This is very evident after looking at the [CICS Flow Diagram](https://openmainframeproject-internship.github.io/COBOL-Modernization/CICSFlow.html). 
But not all programs starting with 'S' are directly associated with a mapset and it will be discussed later.

### Business Layer Programs

Associated with every Screen Handling Program is a business layer COBOL program. It's function is to execute the task which the screen says it does.
Similar to screen handling programs, they also follow a naming convention. Their names start with 'B' and correspond to the associated screen handling program.
So, `BBANK10P` executes the business logic of `MBANK10` which is handled by `SBANK10P`.
The flow is like this, the user gives the input to `SBANK10P` through `MBANK10` which sends it to `BBANK10P` for performing the computations. The result follows the reverse path from `BBANK10P` to `SBANK10P` and is shown to the user on `MBANK10`.

These flow are very much visible in the [CICS Flow Diagram](https://openmainframeproject-internship.github.io/COBOL-Modernization/CICSFlow.html). But if we look at the [Detailed CICS Flow Diagram](https://openmainframeproject-internship.github.io/COBOL-Modernization/CICS%20Flow%20Detailed.html), we can also see the entry point to each program and which COBOL statement calls the other program.

### Data Layer Programs

These COBOL programs interact with the data files. They can read and update the files. The business layer programs for their data requirements call these programs and they perform the required data operation.
Unlike others, these don't strictly follow the naming conventions. The programs' names do start with 'D' and have 'BANK' in them but the number association isn't there.
This is possibly because they serve not only the CICS program but the batch jobs too. These are individual modules, written based more on the file they access, rather than the business logic they serve.
This approach has the advantage of modularity, code reusability and data security.

The connection between data layer programs and business layer programs can be seen in the [CICS Flow Diagram](https://openmainframeproject-internship.github.io/COBOL-Modernization/CICSFlow.html) and the association between data layer programs and data files can be seen in the [Data Flow Diagram](https://openmainframeproject-internship.github.io/COBOL-Modernization/Data%20Flow.html)

### Utility Programs

These are the programs which provide some utility function to the application rather than executing some business logic. They don't follow any particular naming conventions but they are still important to the application.

Example:

- `SCHAR00P`: Determines the character set (EBCDIC or ASCII)
- `BCASH00P`: Provides entry point and sign-on validation
- `SPSWD01P`: Performs security operations
- `DHELP01P`: Obtains screen help information (VSAM version)


## Conclusion

So this is how the various components of the CICS application in this legacy banking application communicate with each other to provide a complete experience.
As a side note, this high-level understanding of the CICS application can be obtained just by looking at the various flow diagrams and observing the pattern in naming conventions. Looking at the code itself is not required.
This is the benefit of a well written application which has been running for so many years. Just the right tools are required to get this type of understanding of the application and it's flow.
The tool used for generating these flow diagrams is the Micro Focus Enterprise Analyser.
