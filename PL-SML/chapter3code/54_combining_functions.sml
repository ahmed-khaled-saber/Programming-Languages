(* Programming Languages, Dan Grossman *)
(* Section 3: Another Closure Idiom: Combining Functions *)

(* I'm Ahmed Khaled, learning those material 15 Aug. 2023 *)


fun compose (f,g) = fn x => f (g x)

fun sqrt_of_abs i = Math.sqrt(Real.fromInt (abs i))

fun sqrt_of_abs i = (Math.sqrt o Real.fromInt o abs) i

val sqrt_of_abs = Math.sqrt o Real.fromInt o abs
(* syntactic sugur for:  fn x => Math.sqrt(Real.fromInt(abs x)) *)

(* tells the parser !> is a function that appears between its two arguments *)
infix !> 

(* operator more commonly written |>, but that confuses the current version
   of SML Mode for Emacs, leading to bad editing and formatting *)

(* definition of the pipeline operator *)
fun x !> f = f x

fun sqrt_of_abs i = i !> abs !> Real.fromInt !> Math.sqrt

(* 
why not  abs !> Real.fromInt !> Math.sqrt like we wrote Math.sqrt o Real.fromInt o abs ?
simply, it is the way we define |>
*)
(* 
why x !> abs !> Real.fromInt !> Math.sqrt
to be close th math, read the "pipe line" from left to right
*)

fun backup1 (f,g) = fn x => case f x of NONE => g x | SOME y => y

fun backup2 (f,g) = fn x => f x handle _ => g x
(* How f fails is a responsability of the programmer! *)