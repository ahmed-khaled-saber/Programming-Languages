(* Programming Languages, Dan Grossman *)
(* Section 2: Case Expressions *)

(* Ahmed Khaled passed Feb'23 *)


datatype mytype = TwoInts of int * int 
                | Str of string 
                | Pizza

                
(* Type inference is smart with case expression to figure out the datatype binding from patterns *)
fun f x = (* x:mytype *) 
    case x of 
	  Pizza => 3 
    | Str s => 8
    | TwoInts(i1,i2) => i1 + i2

(*    | Pizza => 4; (* redundant case: error *) *)
(*fun g x = case x of Pizza => 3 (* missing cases: warning *) *)

