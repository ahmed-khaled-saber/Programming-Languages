(* Programming Languages, Dan Grossman *)
(* Section 2: Pattern-Matching for Each-Of Types: 
              The Truth About Function Arguments *)
(* Ahmed Khaled passed Feb'23 *)

(* one arm case expression, bad reasoning about the construct EXHUSTIVE Branches is the main point*)
fun sum_triple1 (triple : int * int * int) =
    case triple of
      (x,y,z) => z + y + x  

fun full_name1 (r : {first:string,middle:string,last:string}) =
    case r of 
        {first=x,middle=y,last=z} => x ^ " " ^ y ^ " " ^z

(* bind local vars *)
fun full_name2 (r : {first:string,middle:string,last:string}) =
    let val {first=x,middle=y,last=z} = r
    in
	x ^ " " ^ y ^ " " ^z
    end

fun sum_triple2 triple =
    let val (x,y,z) = triple 
    in 
        x + y + z 
    end

(*  direct pattern matching, no need to write types*)
fun full_name3 {first=x,middle=y,last=z} =
    x ^ " " ^ y ^ " " ^z

fun sum_triple3 (x,y,z) =
    x + y + z

fun rotate_left (x,y,z) = (y,z,x)

(* the fact that any function consumes only one argument make it easy to pipe a function to any another *)
fun rotate_right triple = rotate_left(rotate_left triple)
