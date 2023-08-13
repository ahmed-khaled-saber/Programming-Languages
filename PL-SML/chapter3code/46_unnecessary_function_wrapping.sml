(* Programming Languages, Dan Grossman *)
(* Section 3: Unnecessary Function Wrapping *)

(* I'm Ahmed Khaled, studying those Materials today ") *)


fun n_times (f,n,x) = 
    if n=0
    then x
    else f (n_times(f,n-1,x))

(* bad style: the if e then true else false of functions  *)
fun nth_tail (n,xs) = n_times((fn y => tl y), n, xs)

(* good style: *)
fun nth_tail (n,x) = n_times(tl, n, x)

(* bad style *)
fun rev xs = List.rev xs

(* 
synonymous function only calls a function on its argument fn x => f x is like if e then true else false.
 *)

val rev = fn xs => List.rev xs

(* good style *)
val rev = List.rev
(* قصد هنا تسمية الوظيفة الحاضرة باسم جديد خفيف سهل التذكر *)
