(* Programming Languages, Dan Grossman *)
(* Section 1: simple functions *)
(* I am Ahmed Khaled tries learning those Materials *)


(* this function correct only for y >= 0 *)
fun pow (x:int, y:int) = 
    if y=0
    then 1
    else x * pow(x,y-1)

(* offset Binding is to demonstrate that while Evaluating a function body on its Call not Definition,
    it is evauated on the dynamic env back to its Definition extended by arguments values,
    so offset evaluates diffrently shifts squares by one while cube by 2WW
 *)

val z = 1   

fun square (x:int) = pow(x,2) + z

val z = 2

fun cube (x:int) = pow(x,3) + z

val sixtyfour = cube(4)

val fortytwo = pow(2,2+2) + pow(4,2) + cube(2) + 2
