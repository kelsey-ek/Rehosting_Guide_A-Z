# Writing a Technical Document

_When writing a technical document to describe a problem to a coworker or customer, there are three main categories that you should hit_

1. Background
	
	- Describe what the problem is
	- Describe how you found this problem
	- Describe what the problem impacts
	- Describe what the job/transaction/tool is about
	- Provide related binaries & versions

2. Symptoms & Replicating the error

	- Show the problem, but do not provide an opinion
	- Show how you can replicate the error
		- Be clear and concise
		- Avoid creating additional issues
	- Provide analysis
		- Give your opinion
	- Provide proof
		- show a before and after

3. Solution

	- Suggest a change
		- Is the customer doing something that OpenFrame is not equipped to handle
	- Request a patch
		- Is this something that should work, but is not working?
		- Is this a new feature that OpenFrame does not yet have?
	- Ask about a workaround
		- Can this be easily solved by changing one or two things?

# Example:

### Subject: Request for STRING operation related function, runtime performance improvement

1. Background

Runtime performance of the XYZ123 program is slower than mainframe. This is impacting the amount of time it takes for the TESTJOB to run. 

<pre>
	ofcob --version
	OpenFrame COBOL Compiler 4
	Revision: 617
	CommitID: 4e454dd
</pre>

2. Symptoms & Replicating the Error

We found that the runtime performance of STRING processing related functions such as UNSTRING and INSPECT is slow. In particular, the longer the length of the source string, the slower the performance of the run-time. In my opinion, performance degradation occurs when allocating and copying unnecessary buffers.

3. Solution

This is a function of OpenFrame COBOL Compiler that should be working correctly, but is not. Please provide a patch.
You can refer the XYZ123.20190912.cbl and callgrind_out.18640 for more details.
