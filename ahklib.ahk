;@Ahk2Exe-ConsoleApp
#SingleInstance Force
SetWorkingDir A_ScriptDir
#Include stdlib.ahk

; 定义管理器的版本
ahklib_version := "0.1"

mg := AHKLibManage()

mg.usage("AHK Standard Lib`n基本用法: ahklib <命令> <命令值>`n")

mg.addExe("update", "更新标准库也可以用来更新ahklib管理器自身, ahklib update lib 更新标准库 ahklib update self 更新管理器自身", mg.updateHandle)
mg.addExe("list", "列出标准库版本,也可以列出管理器的版本", mg.listHandle)
mg.addExe("remove", "移除标准库,也可以用来移除管理器自己, ahklib remove lib 移除标准库, ahklib remove self 移除管理器自身", mg.listHandle)
mg.addExe("install", "安装标准库,也可以指定版本号安装标准库, ahklib install lib 安装标准库, ahklib install self 安装管理器自身", mg.installHandle)
mg.addExe("version", "查看标准库的当前版本或管理器的版本, ahklib version lib 查看标准库的版本, ahklib version self 查看管理器自身的版本", mg.versionHandle)
mg.addExe("help", "查看帮助", mg.helpHandle)

mg.output()


class AHKLibManage{
    intro := "" ; 一句话简介
    cmd := "" ; 命令
    cmdValue := "" ; 命令的值
    helpList := [] ; 帮助版本
    cmdHandles := Map() ; cmd对应的handle
    __new(){
        ; 创建一个管理器并解析参数
        ; if A_Args[-1].StartsWith("/") {
        ;     A_Args.Pop()
        ; }
        if A_Args.Length == 1 {
            this.cmd := A_Args[1]
        } else if A_Args.Length == 2 {
            this.cmd := A_Args[1]
            this.cmdValue := A_Args[2]
        }
    }
    usage(intro){
        this.intro := intro
    }
    addExe(arg, desc, handle){
        this.helpList.Push("ahklib " arg " " desc)
        this.cmdHandles[arg] := handle
    }
    helpHandle(){
        println(this.intro)
        println(this.helpList.Join("`n"))
    }
    updateHandle(){
        
    }
    listHandle(){

    }
    removeHandle(){

    }
    installHandle(){

    }
    versionHandle(){

    }
    output(){
        if this.cmdHandles.Has(this.cmd){
            this.cmdHandles[this.cmd].bind(this)()
        }
    }
}
