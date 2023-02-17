(* Programming Languages, Dan Grossman *)
(* Section 1: Nested Functions *)

(* I am Ahmed Khaled tries learning those Materials *)

fun countup_from1 (x : int) =
    let fun count (from:int, to:int) =
	    if from=to
	    then to::[] (* note: can also write [to] *)
	    else from :: count(from+1,to)
    in
	count(1,x)
    end

(* Two aspects:
	- hide count implementation ; to change it later without worry about users who use it in certain way!
	- make use of variable introducing on the Environment at that scope and free the stackframe from a fixed param specially if it was compuond 
 *)
fun countup_from1_better (x : int) =
    let fun count (from:int) =
	    if from=x
	    then x::[]
	    else from :: count(from+1)
    in
	count 1
    end

(* Trade of on code Design, restrict scope of a function narrow enough so restrict how it used, make scope wide enough so it can be reused as much as it useful  *)
