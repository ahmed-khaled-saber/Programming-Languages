(* Programming Languages, Dan Grossman *)
(* Section 3: Generalizing Prior Topics *)

(* I'm Ahmed Khaled, studying those Materials today ") *)

(* Returning a function *)
fun double_or_triple f =
    if f 7                                           (* from first line, f definitely int -> bool *)
    then fn x => 2*x
    else fn x => 3*x

val double = double_or_triple (fn x => x-3 = 4)
val nine = (double_or_triple (fn x => x = 42)) 3

(* Higher-order functions over our own datatype bindings *)

datatype exp = Constant of int 
	     | Negate of exp 
	     | Add of exp * exp
	     | Multiply of exp * exp

fun true_of_all_constants(f,e) =
    case e of
	Constant i => f i
      | Negate e1 => true_of_all_constants(f,e1)
      | Add(e1,e2) => true_of_all_constants(f,e1)
		      andalso true_of_all_constants(f,e2)
      | Multiply(e1,e2) => true_of_all_constants(f,e1)
			   andalso true_of_all_constants(f,e2)

(* CONDITION: same sort of recursive traversal with many different possible coputation *)
fun all_even e = true_of_all_constants((fn x => x mod 2 = 0),e)
fun all_less_than_ten = true_of_all_constants( (fn x => x < 10), e)