(* Programming Languages, Dan Grossman *)
(* Section 3: Mutable References *)

(* I'm Ahmed Khaled, learning those material 16 Aug. 2023 *)


val x = ref 42
(* new mutable location has value 42, x points to that location *)

val y = ref 42 
(* new mutable location has value 42, y points to that location *)


val z = x
(* evaluate x has reference value, so x, and z are aliases. *)

val _ = x := 43
(* assignment needs binding ") *)

val w = (!y) + (!z) (* 85 *)
(* x is a mutable location, !x is integer(or type t)  *)
(* x is not immutable, its the contet x points to *)
(* reference values con't be added.  S*)

(* x + 1 does not type-check *)
