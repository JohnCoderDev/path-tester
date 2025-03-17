block-level on error undo, throw.
using classes.PathTester.* from propath.

class classes.PathTester.PathTester:
    define public property currentPath as character get. private set.
    define public property currentFullPath as character get. private set.
    define public property pathPermissions as character get. private set.
    define public property lastWriteDate as date get. private set.
    define public property lastWriteTime as int64 get. private set.
    
    method public PathTester setPath(pPath as character):
        define variable previousPath as character no-undo.
        assign 
            currentPath = pPath
            previousPath = file-info:file-name
            file-info:file-name = currentPath
            currentFullPath = file-info:full-pathname
            pathPermissions = file-info:file-type
            lastWriteDate = file-info:file-mod-date
            lastWriteTime = file-info:file-mod-time
            file-info:file-name = previousPath.
    end method.
    
    method public logical pathExists():
        return currentFullPath <> ?.
    end method.
    
    method public logical isDir():
        return pathPermissions matches "d*".
    end method.
    
    method public logical isFile():
        return pathPermissions matches "f*".
    end method.
    
    method public logical canRead():
        return pathPermissions matches "*r*".
    end method.
    
    method public logical canWrite():
        return pathPermissions matches "*w*".
    end method.
    
    method public datetime getLastWriteDateTime():
        return datetime(string(lastWriteDate) + " " + string(lastWriteTime, "HH:MM:SS")).
    end method.
    
    method public character getFullPath():
        return currentFullPath.
    end method.
end class.
