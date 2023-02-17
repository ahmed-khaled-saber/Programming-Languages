(* Programming Languages, Dan Grossman *)
(* Section 1: Let Expressions *)
(* I am Ahmed Khaled passed here *)

(* State0 
Environments      
    static:
    dynamic:
*)
fun silly1 (z : int) =
    let val x = if z > 0 then z else 34
	val y = x+z+9
    in
	if x > y then x*2 else y*y
    end

(* State1 
Environments
    static: silly1: int -> int
    dynamic:
*)

fun silly2 () =
    let val x = 1 
    in 
	(let val x = 2 in x+1 end) + (let val y = x+2 in y+1 end)
    end
(* State2 
Environments
    static: silly1: int  -> int
            silly2: unit -> int
    dynamic:
*)

val s11 = silly1 5;
(* State3 
Environments
    static: silly1: int  -> int
            silly2: unit -> int
    dynamic:
*)

val sl2 = silly2;
(* State?
Environments
    static: silly1: int  -> int
            silly2: unit -> int
    dynamic:
*)

(* Track States of Environment on Function body Expression to reason about every e evaluation... *)