(* Programming Languages, Dan Grossman *)
(* Section 3: Currying Wrapup *)

(* I'm Ahmed Khaled, learning those material 15 Aug. 2023 *)


(* generic functions to switch how/whether currying is used *)
(* in each case, the type tells you a lot *)

fun curry f x y = f (x,y)
(* 
- f is a function tat expects a pair, so we have to write it as  (x,y)
- (curry f) return two-argument curried function
- the above line is synttic sugar for: fun curry f = fn x => fn y => f (x, y)
 *)

fun uncurry f (x,y) = f x y
(* 
- f is a 2 args curried function, so to rvaluate we have to call it: f x y
- (uncurry f) rturn a function expects a still missing tuple.
- the above line is synttic sugar for: fun uncurry f (x, y) = fn f => fn x => fn y => f x y
*)

fun other_curry1 f = fn x => fn y => f y x

fun other_curry2 f x y = f y x

(* example *)

(* tupled but we wish it were curried *)
fun range (i,j) = if i > j then [] else i :: range(i+1, j)
(* (curry range)  *)
(* no problem *)
val countup = curry range 1

val xs = countup 7
