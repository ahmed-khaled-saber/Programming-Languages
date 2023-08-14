(* Programming Languages, Dan Grossman *)
(* Section 3: Lexical Scope and Higher-Order Functions *)

(* I'm Ahmed Khaled, learning those material 14 Aug. 2023 *)


(* first example *)
val x = 1 
fun f y = 
    let 
        val x = y+1
    in
        fn z => x + y  + z
        (* z is a function created on every call for f, it "always" wherever its called remembers f's argument y then x it's created within *)
    end
    (* f is a function that "always" return a function takes an argument z and adds 2y+1 to it *)
val x = 3
val g = f 4 
    (* fn z => z + (2*4 + 1) *)
val y = 5
val z = g 6
    (* 6 + (2*4 + 1) = 15 *)

(* second example *)
fun f g = 
    let 
        val x = 3
    in
        g 2
    end
    (* f is a function that "always" call its argument with 2 *)
    (* fun f g = g 2 *)
val x = 4
fun h y = x + y 
    (* h is a function that "always" adds 4 to its arument *)
    (* fun h y = 4 + y *)

val z = f h
    (* f calls h on 2, h adds 4 to 2 *)
