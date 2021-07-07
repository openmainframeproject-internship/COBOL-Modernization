# Original Batch Job Architecture of the Application

## [Definition](https://www.ibm.com/docs/en/zos-basic-skills?topic=processing-mainframes-working-after-hours-batch)

Batch applications are processed on the mainframe without user interaction. A batch job is submitted on the computer; the job reads and processes data in bulk— perhaps terabytes of data— and produces output, such as customer billing statements. An equivalent concept can be found in a UNIX script file or a Windows command file, but a z/OS batch job might process millions of records.

## Components

An application can have many batch jobs which are usually independent of each other. In this application, there is only a single batch job called `MFIDEMO`.

A batch job consists of the following components:

### [JCL File](https://www.ibm.com/docs/en/zos-basic-skills?topic=sdsf-what-is-jcl)

For every job that you submit, you need to tell z/OS where to find the appropriate input, how to process that input, and what to do with the resulting output. You use job control language (JCL) to convey this information to z/OS through a set of statements known as job control statements.

In this application there is only [1 JCL file called `ZBNKSTMT`](link to folder). This file defines the `MFIDEMO` job and what it's supposed to do.

### COBOL Programs

These are the programs that the JCL file calls to perform the steps of the job. These define how the job is to be done.
To some extent these are the core aspect of the job and what takes the most effort in creating a job.

In this application there are two COBOL programs that `MFIDEMO` uses: `ZBNKPRT1` and `ZBNKEXT1`.

### System Programs

System or Utility programs are pre-written programs, widely used in mainframes by system programmers and application developers to achieve day-to-day requirements, organising and maintaining data.

The `MFIDEMO` job uses the `SORT` program in it's execution.

### Data Sets

A data set contains information that can be stored and retrieved. Data sets can contain many kinds of information – programs, numerical data, inventory records, memos, reports, and so on.

In the [Job Executive Report](link) all of this can be easily seen and understood.
