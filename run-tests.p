using classes.tester.* from propath.

new ABLTestCollection()
    :addTest("tests.PathTesterTestCase")
    :runTests()
    :writeFile(session:temp-directory + "results.html").    
