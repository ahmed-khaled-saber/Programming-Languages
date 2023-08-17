(* Programming Languages, Dan Grossman *)
(* Section 3: Callbacks *)

(* I'm Ahmed Khaled, learning those material 16 Aug. 2023 *)


(* these two bindings would be internal (private) to the library *)
val cbs : (int -> unit) list ref = ref []
fun onEvent i =
   let 
    fun loop fs =
        case fs of 
          [] => ()
        | f::fs' => (f i; loop fs')
    in loop (!cbs) end

(* clients call only this function (public interface to the library) *)
fun onKeyEvent f = cbs := f::(!cbs)

(* some clients where closures are essential
   notice different environments use bindings of different types
 *)
val timesPressed = ref 0

val _ = onKeyEvent (fn _ => timesPressed := (!timesPressed) + 1) 
(* just initialize the counter to be zero *)
(* _ any key will run this register code *)

fun printIfPressed i =
    onKeyEvent (fn j => if i=j
                        then print ("you pressed " ^ Int.toString i ^ "\n")
                        else ())

val _ = printIfPressed 4
val _ = printIfPressed 11
val _ = printIfPressed 23
val _ = printIfPressed 4


onEvent 11
(* it's going to pass 11 to all the closures on [cbs]"callbacks" *)