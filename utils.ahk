/**
 * 传入若干个参数,打印这些参数并换行,参数之间空格分隔
 * @param params* 
 */
println(params*){
    if !DllCall("GetStdHandle", "uint", -11, "ptr"){
        ; OpenConsole()
        return
    }
    output := ""
    lastChar := params.Pop()
    for item in params {
        output := output.Concat(
            String(item),
             " "
        )
    }
    output := output.Concat(String(lastChar), "`n")
    ; FileAppend output, "*"
    FileAppend output, "*", "utf-8"
}

/**
 * 传入若干个参数,打印这些参数, 参数之间空格分隔,这个函数不会换行
 * @param params 
 */
print(params*){
    if !DllCall("GetStdHandle", "uint", -11, "ptr"){
        return
    }
    lastChar := params.Pop()
    for item in params {
        FileAppend String(item) " ", "*", "utf-8" 
    }
    FileAppend String(lastChar), "*", "utf-8"
}

OpenConsole(){
    if !DllCall("GetStdHandle", "uint", -11, "ptr")
        DllCall("AllocConsole")
}

HasConsole(){
    return DllCall("GetStdHandle", "uint", -11, "ptr")
}


; HashFile by Deo
; https://autohotkey.com/board/topic/66139-ahk-l-calculating-md5sha-checksum-from-file/
; Modified for AutoHotkey v2 by lexikos.


/*
HASH types:
1 - MD2
2 - MD5
3 - SHA
4 - SHA256
5 - SHA384
6 - SHA512
*/
HashFile(filePath, hashType:=2)
{
	static PROV_RSA_AES := 24
	static CRYPT_VERIFYCONTEXT := 0xF0000000
	static BUFF_SIZE := 1024 * 1024 ; 1 MB
	static HP_HASHVAL := 0x0002
	static HP_HASHSIZE := 0x0004
	
    switch hashType {
        case 1: hash_alg := (CALG_MD2 := 32769)
        case 2: hash_alg := (CALG_MD5 := 32771)
        case 3: hash_alg := (CALG_SHA := 32772)
        case 4: hash_alg := (CALG_SHA_256 := 32780)
        case 5: hash_alg := (CALG_SHA_384 := 32781)
        case 6: hash_alg := (CALG_SHA_512 := 32782)
        default: throw ValueError('Invalid hashType', -1, hashType)
    }
	
	f := FileOpen(filePath, "r")
    f.Pos := 0 ; Rewind in case of BOM.
    
    HCRYPTPROV() => {
        ptr: 0,
        __delete: this => this.ptr && DllCall("Advapi32\CryptReleaseContext", "Ptr", this, "UInt", 0)
    }
    
	if !DllCall("Advapi32\CryptAcquireContextW"
				, "Ptr*", hProv := HCRYPTPROV()
				, "Uint", 0
				, "Uint", 0
				, "Uint", PROV_RSA_AES
				, "UInt", CRYPT_VERIFYCONTEXT)
		throw OSError()
	
    HCRYPTHASH() => {
        ptr: 0,
        __delete: this => this.ptr && DllCall("Advapi32\CryptDestroyHash", "Ptr", this)
    }
    
	if !DllCall("Advapi32\CryptCreateHash"
				, "Ptr", hProv
				, "Uint", hash_alg
				, "Uint", 0
				, "Uint", 0
				, "Ptr*", hHash := HCRYPTHASH())
        throw OSError()
	
	read_buf := Buffer(BUFF_SIZE, 0)
	
	While (cbCount := f.RawRead(read_buf, BUFF_SIZE))
	{
		if !DllCall("Advapi32\CryptHashData"
					, "Ptr", hHash
					, "Ptr", read_buf
					, "Uint", cbCount
					, "Uint", 0)
			throw OSError()
	}
	
	if !DllCall("Advapi32\CryptGetHashParam"
				, "Ptr", hHash
				, "Uint", HP_HASHSIZE
				, "Uint*", &HashLen := 0
				, "Uint*", &HashLenSize := 4
				, "UInt", 0) 
        throw OSError()
		
    bHash := Buffer(HashLen, 0)
	if !DllCall("Advapi32\CryptGetHashParam"
				, "Ptr", hHash
				, "Uint", HP_HASHVAL
				, "Ptr", bHash
				, "Uint*", &HashLen
				, "UInt", 0 )
        throw OSError()
	
	loop HashLen
		HashVal .= Format('{:02x}', (NumGet(bHash, A_Index-1, "UChar")) & 0xff)
	
	return HashVal
}


/**
 * 获取本地操作系统的语言 中文是 zh-CN
 */
GetLocaleLanguage(){
    LOCALE_NAME_MAX_LENGTH:=85
    lpLocaleName:=Buffer(bufferSize:=LOCALE_NAME_MAX_LENGTH*A_PtrSize, 0)
    length:=DllCall("Kernel32\GetUserDefaultLocaleName", "Ptr",lpLocaleName.Ptr, "Int",cchLocaleName:=LOCALE_NAME_MAX_LENGTH, "Int")
    return StrGet(lpLocaleName.Ptr, length, "UTF-16")
}