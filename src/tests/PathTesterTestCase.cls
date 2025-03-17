using classes.tester.* from propath.
using classes.PathTester.* from propath.

class tests.PathTesterTestCase inherits ABLTestCase:
    define public property testObject as PathTester get. set. 
    define public property fileTestPath as character get. set. 
    
    method public override void setup():
        assign 
            testObject = new PathTester()
            fileTestPath = session:temp-directory + "abl-test-case-path-tester.txt".
        testObject:setPath(session:temp-directory).
        output to value(fileTestPath).
        output close.
    end method.
    
    method public override void teardown():
        os-delete value(fileTestPath).
        delete object testObject.
    end method.
    
    method public void testTempDirectoryIsDir():
        testObject:setPath(session:temp-directory).
        assertTrue(testObject:isDir()).
    end method.
    
    method public void testTempDirectoryIsNotFile():
        testObject:setPath(session:temp-directory).
        assertFalse(testObject:isFile()).
    end method.
    
    method public void testTempDirectoryExists():
        testObject:setPath(session:temp-directory).
        assertTrue(testObject:pathExists()).
    end method.
    
    method public void testTestFileExists():
        testObject:setPath(fileTestPath).
        assertTrue(testObject:pathExists()).
    end method.
    
    method public void testTestFileIsNotDir():
        testObject:setPath(fileTestPath).
        assertFalse(testObject:isDir()).
    end method.
    
    method public void testFileIsFile():
        testObject:setPath(fileTestPath).
        assertTrue(testObject:isFile()).
    end method.
    
    method public void testTempDirCanRead():
        testObject:setPath(session:temp-directory).
        assertTrue(testObject:canRead()).
    end method.
    
    method public void testTempDirCanWrite():
        testObject:setPath(session:temp-directory).
        assertTrue(testObject:canWrite()).
    end method.
    
    method public void testFileDoesNotExists():
        testObject:setPath(fileTestPath + "2").
        assertFalse(testObject:pathExists()).
    end method.
end class.
