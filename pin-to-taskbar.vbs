dim fso: set fso = CreateObject("Scripting.FileSystemObject") 
Set objShell = CreateObject("Shell.Application") 
Set objFolder = objShell.Namespace(fso.GetAbsolutePathName(".")) 
Set objFolderItem = objFolder.ParseName(Wscript.Arguments.Named("shortcut")) 
Set colVerbs = objFolderItem.Verbs 
For Each objVerb in colVerbs 
    If Replace(objVerb.name, "&", "") = "Pin to Taskbar" Then objVerb.DoIt 
Next
