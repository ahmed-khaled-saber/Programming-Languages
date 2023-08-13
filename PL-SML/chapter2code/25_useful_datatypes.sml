(* Programming Languages, Dan Grossman *)
(* Section 2: Useful Datatypes *)
(* Ahmed Khaled passed Feb'23 *)


datatype suit = Club | Diamond | Heart | Spade

datatype rank = Jack | Queen | King | Ace | Num of int

datatype id = StudentNum of int 
            | Name of string * (string option) * string

datatype exp = Constant of int 
             | Negate of exp 
             | Add of exp * exp
             | Multiply of exp * exp

fun eval e =
    case e of
        Constant i => i
      | Negate e2  => ~ (eval e2)
      | Add(e1,e2) => (eval e1) + (eval e2)
      | Multiply(e1,e2) => (eval e1) * (eval e2)

fun number_of_adds e =
    case e of
        Constant i      => 0
      | Negate e2       => number_of_adds e2
      | Add(e1,e2)      => 1 + number_of_adds e1 + number_of_adds e2
      | Multiply(e1,e2) => number_of_adds e1 + number_of_adds e2

val example_exp = Add (Constant 19, Negate (Constant 4))

val example_ans = eval example_exp

val example_addcount = number_of_adds (Multiply(example_exp,example_exp))


(*  The Difference between Solutions seems to work and correct vs. The elegant one that uses the Constructs in best possible way *)

(* PROPLEM: Repeated Recursive Computation  *)
(* fun max_constant e = 
  case e of
        Constant i      => i
      | Negate e2       => max_constant e2
      | Add(e1,e2)      => if max_constant e1 > max_constant e2 then max_constant e1 else max_constant e2
      | Multiply(e1,e2) => if max_constant e1 > max_constant e2 then max_constant e1 else max_constant e2 *)

(* PROPLEM: Repeated Code!  *)
(* fun max_constant e = 
  case e of
       Constant i     => i
    |  Negate e2      => max_constant e2
    |  Add(e1,e2)     => let
                            val m1 = max_constant e1
                            val m2 = max_constant e2
                          in
                            if m1 > m2 then m1 else m2
                          end
    | Multiply(e1,e2) => let
                            val m1 = max_constant e1
                            val m2 = max_constant e2
                          in
                            if m1 > m2 then m1 else m2
                          end  *)
(* Proud *)
(* fun max_constant e = 
  let
    fun max_of_two_exp(e1, e2) = 
      let
        val m1 = max_constant e1
        val m2 = max_constant e2
      in
        if m1 > m2 then m1 else m2
      end
  in
    case e of
       Constant i     => i
    |  Negate e2      => max_constant e2
    |  Add(e1,e2)     => max_of_two_exp(e1, e2)
    | Multiply(e1,e2) => max_of_two_exp(e1, e2)
  end *)
  
(* when we call a funtion the argument expression are evaluated only once! *)
(* Last Version: Super Elegant *)
fun max_constant e = 
    case e of
         Constant i      => i
      |  Negate e2       => max_constant e2
      |  Add(e1,e2)      => Int.max(max_constant e1, max_constant e2)
      |  Multiply(e1,e2) => Int.max(max_constant e1, max_constant e2)

(* Test *)
val exp1 = Add(Constant 19, Negate(Constant 4))
val test_max_constant = max_constant exp1 = 19