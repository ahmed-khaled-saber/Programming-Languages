(* Binding Types  *)

(* 1- Variable Binding *)
val pattern = 10;

(* 2- Function Binding *)
fun n(x): if x>0 then true else false;


(* a list of value is itself a value [e1, e2, .., en] has type t (the type for all e1 untill en) int list *)
(* list is not a Type; int list is a type *)
val l = [1, 2, 3, 4];


(* 3- Data Type Binding *)
datatype myoption = Some int | None 
datatype ID = College int | National string 