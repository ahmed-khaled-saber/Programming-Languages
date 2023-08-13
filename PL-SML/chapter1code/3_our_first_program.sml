(* Programming Languages, Dan Grossman *)
(* Section 1: Our first ML program *)
(* I am Ahmed Khaled tries learning those Materials *)

(* 
Definitions
  Expression: recursive structure has a Type T and Evaluates to a Value or Exception.
  Value: base case (Atomic) for Expressions that can not reduced 
 *)
(* val n = e;  *)
(* val is a keyword
   x is a variable name
   = is used as a keyword here (has different meaning in expressions) ( Apply Pattern Matching; bind Values to Identifiers ) (not an Assignment Statement)
   34 is a very simple expression(value)
   ; is used as a keyword here (has different meaning in expressions)
 *)
(* Standard ML knows Value well What its Type by its Type Inference System; and knows How to Communicate Hardware to Perform Computation to produce a Value from Expression *)
(* Simplest Expression is a Value, All Composite Expressions are vanishes to that Ground to be a Value *)
 
val x = 34;
(* After Type Checking Static  Environment has been extended ->  static  environment: x --> int *)
(* After Evaluation    Dynamic Environment has been extended ->  dynamic environment: x -->  34 *)

val y = 17; 
(* static environment: y-->int, x-->int *)
(* dynamic environment: y-->17, x-->34 *)
(* e1 + e2 : to evaluate an addition, evaluate the subexpressions and add *)
(* to evaluate a variable, lookup its value in the dynamic environment  *)

val z = (x + y) + (y + 2);
(* static environment: z-->int, y-->int, x-->int *)
(* dynamic environment: z-->70, y-->17, x-->34 *)

val q = z+1;
(* static environment: q-->int, z-->int, y-->int, x-->int *)
(* dynamic environment: q-->71, z-->70, y-->17, x-->34 *)
 
val abs_of_z = if z < 0 then 0 - z else  z;
(* static environment: abs_of_z-->int, q-->int, z-->int, y-->int, x-->int *)
(* dynamic environment: abs_of_z-->70, q-->71, z-->70, y-->17, x-->34 *)
 
val abs_of_z_simpler = abs z; (* a Function Call with One argument*)
