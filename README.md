# Path Tester
Simple path tester for ABL.

## Quick Start
- compile the source code and put somewhere visible in your propath.

```progress
using classes.PathTester.* from propath.

define variable pathTesterObject as PathTester.
assign pathTesterObject = new PathTester().

pathTesterObject:setPath("C:\").

if pathTesterObject:isDir() then do:
	// ...
end.
else if pathTesterObject:isFile() then do:
	// ...
end.

if pathTesterObject:canRead() or pathTesterObject:canWrite() then do:
	// ...
end.
```

## Running the Tests
- requires the (abl-tester)[https://github.com/JohnCoderDev/abl-tester] to be in your propath.
- open the file `run-tests.p` in your procedure editor and execute it.
