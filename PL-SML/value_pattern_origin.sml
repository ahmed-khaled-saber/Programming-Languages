(* مهما تعاظمت التعبيرات البرمجية ت و صارت لهيبا فإن لا بد لها ان تحول لرماد *)

(* Binding means an Identifier bound to a Value on Static/Dynamic Environments State at given Point *)

(* Program at Any Point is the State of its Static/Dynamic Environments *)

(* Sequence of Bindings make State Transformation on a Program *)

(* هذا كلام أنا المسؤول عنه و لا أضمن انضباطه علميا *)
(* Static/Dynamic Expressions afet a binding are extended from the preceeding one directly
    - either an linear Extension and no Back point except on Function call 
       or    an  inner Instance of it for Local let Expression or inside a function that will always have a back point *)

(* Value is The Simplist Expression, All Expressions must Reduces to a Value (Evaluated)
    Expression yields a value or Exception or go to infinte loop
    Expression is one of :
        - value                           => Standard Ml's Type System Inference for Entire Expression

        - if e1:bool then e2:t else e3:t            => t                 ;;; rasie exc when
        - e1:int  > e2:int                          => bool              ;;; rasie exc when
        - e1:real > e2:real                         => bool              ;;; rasie exc when
        - 
        - e1:int|real + e2:int|real                 => int\real          ;;; rasie exc when
        - f(e1, ..., en)                            => fun return t      ;;; rasie exc when
        - let b1=e1:t2,... ,bn=en:tn, in e:t end    => t                 ;;; rasie exc when
        - case e0 of p1 => e1 |...| p2 => en        => t type of e1...en ;;; rasie exc when e0 has no ps
        -
(* Equality Types
    real has no exact equality comparision
    = 
    <>

 *)
*)

(* Values: Types for Standard Ml

    {true, false}              : bool
    307  Infinite Domain       : int
    3.07 Infinite Domain       : real
    []                         : 'a list
    [1, 2, 3]                  : int list
    (1, 2, true)               : int * int * bool
    {name="Ahmed", age=23, phone="01206423325"} : {name: string, age: int, phone: string}

    SOME 1                     : int Option
    NONE                       : Option
 *)
(* 
   [] 
   ()
   are values or special patterns to capture logical value ?
 *)


 (* REPL has current Temp Value we can make use in time 
    
    it = [2, 3]
    1::it

    Equivilant
    - {2=1+2, 1=3+4} === (7, 3)

 *)

(* places to put a pattern 
   - variable just is a special kind of patterns
   - what else is a kind of patterns ? 
   من تعريفي أي سلسلة من الحروف لها هيكل قيمة من قيم اللغة كـ
   (x, y, z) = (e1, e2, e3)
   {name=n, mobile=m, age=g} = {name=e1, mobile=e2, age=e3}
   ...

   val p = e
   fun f p = e
   case e of p => e'
 
*)


 (* Secret of sml, how list Constructor defined the way it is in between its two arguments
    a little bit the same as andalso expression 
    int :: int list 
    bool andalso bool *)


(* 
Theory of Computation
Alphapet Symbol Reuse 
The "*" in Expressions if for Multiplication
         in Types is for Seprating a Tuple Elements
*)

(* 
Function name without (), is exprssion evaluates to value of type _ -> _ .
Anonymous function is an expression evaluates to value of type _ -> _.

 *)