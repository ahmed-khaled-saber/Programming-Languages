(* Programming Languages, Dan Grossman *)
(* Section 2: Lists and Options are Datatypes *)
(* Ahmed Khaled passed Feb'23 *)


datatype my_int_list = Empty 
                     | Cons of int * my_int_list
					 
val one_two_three = Cons(1,Cons(2,Cons(3,Empty)))

fun append_mylist (xs,ys) = 
    case xs of
        Empty => ys
      | Cons(x,xs') => Cons(x, append_mylist(xs',ys))

fun inc_or_zero intoption =
    case intoption of
        NONE => 0
      | SOME i => i+1

(* Secret of sml, how list Constructor defined the way it is in between its two arguments
    a little bit the same as andalso expression 
    int :: int list 
    bool andalso bool *)

fun sum_list xs =
    case xs of
        [] => 0
      | x::xs' => x + sum_list xs'

fun append (xs,ys) =
    case xs of
        [] => ys
      | x::xs' => x :: append(xs',ys)