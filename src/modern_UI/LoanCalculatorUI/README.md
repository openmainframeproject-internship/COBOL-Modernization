# Flask UI for Loan Calculator Service

This is the User Interface built using [Flask](https://flask.palletsprojects.com/en/2.0.x/), the micro framework for building lightweight web application in Python.

## Pre-requisite

- The following packages must be installed for using this UI:

1. [Python](https://wiki.python.org/moin/BeginnersGuide/Download)
1. [Flask](https://flask.palletsprojects.com/en/2.0.x/installation/)
1. [WTForms](https://wtforms.readthedocs.io/en/3.0.x/)

## Deploying

There are two options to build the native library file out of the COBOL file provided:

### Using Micro Focus COBOL Compiler

1. Follow [these instructions](build_intructions.md) to build the native library file.

1. Simply run the following command to deploy the web application: `python run_mf.py`

### Using GNUCobol Compiler

1. Make sure you have [installed the compiler](https://gnucobol.sourceforge.io/)
1. Run this command to compile the COBOL file into a dynamically loadable module: `cobc CalcLoan.cbl`
1. Run this command to deploy the web application: `python run_gnu.py`
