;@include en\time.d.ahk
;@include zh\time.d.ahk
class time {
    static Now(){
        return (A_Now A_MSec) * 1
    }
}