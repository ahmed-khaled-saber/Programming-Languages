(* Programming Languages, Dan Grossman *)
(* Section 1: Examples to Demonstrate Shadowing *)
(* I am Ahmed Khaled tries learning those Materials *)

(* After Every Binding, a new Environment is created
 to be the Current Dynamic/Static Environment Evaluates and Type-Checking the next Expressions.
 so, 
 if Variable is Shadowed means a Subsequent Environment has the name of that variable maps to a whatever Value 
 It is not an Assignment so the location of memory of that variable are Mutation, no Mutation Absolotely on SML
*)


val a = 10

val b = a * 2  (* Evaluated once then b is bound to result and forgot how it is evaluated (iirelevant even a is shadowed on a subsequent Env.)*)

val a = 5

val c = b

val d = a

val a = a + 1

(* next line does not type-check, f not in environment *)
(* val g = f - 3  *)

val f = a * 2

