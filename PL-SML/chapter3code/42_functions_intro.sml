(* Programming Languages, Dan Grossman *)
(* Section 3: Introduction to First-Class Functions *)
(* الوظيفة من الدرجة الأولية هي تلك التي بإمكانها حل محل للقيمة *)

(*I'm Ahmed Khaled studying those material today!*)

fun double x = 2*x
fun incr x = x+1
val a_tuple = (double, incr, double(incr 7))
val eighteen = (#1 a_tuple) 9
