;@Ahk2Exe-ConsoleApp
#SingleInstance Force
SetWorkingDir A_ScriptDir
#Include stdlib.ahk

; 定义管理器的版本
ahklib_version := "0.1"


full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try
    {
        args_str := ""
        for index, item in A_Args {
            if index == 1 {
                args_str := item
            }
            args_str := args_str . " " . item
        }
        if A_IsCompiled
            Run '*RunAs "' A_ScriptFullPath '" ' args_str ' /restart'
        else
            Run '*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '" ' args_str
    }
    ExitApp
}
; 如果当前运行的目录不是system32目录那么就复制一份过去
if !A_ScriptDir.Includes("C:\Windows\System32") {
    FileCopy A_ScriptFullPath, "C:\Windows\System32\",1
    FileCopy A_ScriptDir "\7z.exe", "C:\Windows\System32\",1
    FileCopy A_ScriptDir "\Everything64.dll", "C:\Windows\System32\",1
}

; 先
; 下载压缩包
dirArr := Everything.GetAllDir("AutoHotkey64_UIA.exe")
dirPath := ""
if(dirArr.Length != 1){
    _r := msgbox("我们不能确认你的软件安装位置,请手动选择软件安装目录", "选择目录", "1")
    if _r == "Cancel"{ ; 如果取消了就算了
        return
    }
    dirPath := DirSelect(,2)
    if !dirPath{
        return
    }
}else{
    dirPath := dirArr[1]
}
if FileExist(dirPath "\ahklib.zip") {
    FileDelete dirPath "\ahklib.zip"
}

FileAppend "下载中...", "*"
try{
    Download("https://raw.githubusercontent.com/Autumn-one/ahk-standard-lib/main/ahk-standard-lib.zip", dirPath "\ahklib.zip")
}catch {
    msgbox "包更新失败,请检查网络!或重试."
    return
}

; 通过7zip解压到Lib目录即可
ret := StdoutToVar("7z x ".Concat(
    '"',
    dirPath,
    '\ahklib.zip" -o',
    '"',
    dirPath,
    '\Lib" -aoa'

))

if FileExist(dirPath "\ahklib.zip") {
    FileDelete dirPath "\ahklib.zip"
}
if ret.ExitCode == 0{
    msgbox "ahklib更新成功"
}else{
    msgbox "ahklib更新失败:" ret.Output
}







class Everything {
    static EvDll := ""
    static __New(){
            this.EvDll := DllCall("LoadLibrary", "Str", "Everything64.dll", "Ptr")
    }
    static GetCount(keyword){
        try {
            DllCall("Everything64.dll\Everything_SetSearch", "Str", keyword)
        } catch Error as e {
            ExitApp
        }
        DllCall("Everything64.dll\Everything_Query", "int64", 1)
        return DllCall("Everything64.dll\Everything_GetNumResults")
    }
    static GetAllDir(keyword){
        arr := []
        Loop this.GetCount(keyword)
        {
            dirPath := DllCall("Everything64.dll\Everything_GetResultPath", "Int", A_index - 1, "Str")
            arr.Push(dirPath)
        }
        return arr
    }
}



; ----------------------------------------------------------------------------------------------------------------------
; Function .....: StdoutToVar
; Description ..: Runs a command line program and returns its output.
; Parameters ...: sCmd - Commandline to be executed.
; ..............: sDir - Working directory.
; ..............: sEnc - Encoding used by the target process. Look at StrGet() for possible values.
; Return .......: Command output as a string on success, empty string on error.
; AHK Version ..: AHK v2 x32/64 Unicode
; Author .......: Sean (http://goo.gl/o3VCO8), modified by nfl and by Cyruz
; License ......: WTFPL - http://www.wtfpl.net/txt/copying/
; Changelog ....: Feb. 20, 2007 - Sean version.
; ..............: Sep. 21, 2011 - nfl version.
; ..............: Nov. 27, 2013 - Cyruz version (code refactored and exit code).
; ..............: Mar. 09, 2014 - Removed input, doesn't seem reliable. Some code improvements.
; ..............: Mar. 16, 2014 - Added encoding parameter as pointed out by lexikos.
; ..............: Jun. 02, 2014 - Corrected exit code error.
; ..............: Nov. 02, 2016 - Fixed blocking behavior due to ReadFile thanks to PeekNamedPipe.
; ..............: Apr. 13, 2021 - Code restyling. Fixed deprecated DllCall types.
; ..............: Oct. 06, 2022 - AHK v2 version. Throw exceptions on failure.
; ..............: Oct. 08, 2022 - Exceptions management and handles closure fix. Thanks to lexikos and iseahound.
; ----------------------------------------------------------------------------------------------------------------------
StdoutToVar(sCmd, sDir:=A_ScriptDir, sEnc:="CP0") {
    ; Create 2 buffer-like objects to wrap the handles to take advantage of the __Delete meta-function.
    oHndStdoutRd := { Ptr: 0, __Delete: delete(this) => DllCall("CloseHandle", "Ptr", this) }
    oHndStdoutWr := { Base: oHndStdoutRd }
    
    If !DllCall( "CreatePipe"
               , "PtrP" , oHndStdoutRd
               , "PtrP" , oHndStdoutWr
               , "Ptr"  , 0
               , "UInt" , 0 )
        Throw OSError(,, "Error creating pipe.")
    If !DllCall( "SetHandleInformation"
               , "Ptr"  , oHndStdoutWr
               , "UInt" , 1
               , "UInt" , 1 )
        Throw OSError(,, "Error setting handle information.")

    PI := Buffer(A_PtrSize == 4 ? 16 : 24,  0)
    SI := Buffer(A_PtrSize == 4 ? 68 : 104, 0)
    NumPut( "UInt", SI.Size,          SI,  0 )
    NumPut( "UInt", 0x100,            SI, A_PtrSize == 4 ? 44 : 60 )
    NumPut( "Ptr",  oHndStdoutWr.Ptr, SI, A_PtrSize == 4 ? 60 : 88 )
    NumPut( "Ptr",  oHndStdoutWr.Ptr, SI, A_PtrSize == 4 ? 64 : 96 )

    If !DllCall( "CreateProcess"
               , "Ptr"  , 0
               , "Str"  , sCmd
               , "Ptr"  , 0
               , "Ptr"  , 0
               , "Int"  , True
               , "UInt" , 0x08000000
               , "Ptr"  , 0
               , "Ptr"  , sDir ? StrPtr(sDir) : 0
               , "Ptr"  , SI
               , "Ptr"  , PI )
        Throw OSError(,, "Error creating process.")

    ; The write pipe must be closed before reading the stdout so we release the object.
    ; The reading pipe will be released automatically on function return.
    oHndStdOutWr := ""

    ; Before reading, we check if the pipe has been written to, so we avoid freezings.
    nAvail := 0, nLen := 0
    While DllCall( "PeekNamedPipe"
                 , "Ptr"   , oHndStdoutRd
                 , "Ptr"   , 0
                 , "UInt"  , 0
                 , "Ptr"   , 0
                 , "UIntP" , &nAvail
                 , "Ptr"   , 0 ) != 0
    {
        ; If the pipe buffer is empty, sleep and continue checking.
        If !nAvail && Sleep(100)
            Continue
        cBuf := Buffer(nAvail+1)
        DllCall( "ReadFile"
               , "Ptr"  , oHndStdoutRd
               , "Ptr"  , cBuf
               , "UInt" , nAvail
               , "PtrP" , &nLen
               , "Ptr"  , 0 )
        sOutput .= StrGet(cBuf, nLen, sEnc)
    }
    
    ; Get the exit code, close all process handles and return the output object.
    DllCall( "GetExitCodeProcess"
           , "Ptr"   , NumGet(PI, 0, "Ptr")
           , "UIntP" , &nExitCode:=0 )
    DllCall( "CloseHandle", "Ptr", NumGet(PI, 0, "Ptr") )
    DllCall( "CloseHandle", "Ptr", NumGet(PI, A_PtrSize, "Ptr") )
    Return { Output: sOutput, ExitCode: nExitCode } 
}