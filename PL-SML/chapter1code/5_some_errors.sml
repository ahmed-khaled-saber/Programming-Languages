(* Programming Languages, Dan Grossman *)
(* Section 1: Some Errors *)
(* I am Ahmed Khaled tries learning those Materials *)


(* This program has several errors in it so we can try to debug them. *)

val x = 34

y = x + 1                       (* needs val to be seprate binding *)

val z = if y then 34 else x < 4 (* y is not of Type bool, and branches e does not have same Type *)

val q = if y > 0 then 0         (* Construct is not complete !*)

val a = -5                      (* no unary minus Op, ~ instead is unary*)

val w = 0                  

val fun = 34

val v = x / w                  (* real division Evaluation prevents 2nd operand to be 0 and throws Exp !*)

val fourteen = 7 - 7           (* Logical Error, since 0 is not forteen, No Automation Tool can inspect Intention !*)

