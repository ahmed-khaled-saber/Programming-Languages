(* Programming Languages, Dan Grossman *)
(* Section 3: Lexical Scope *)

(* I'm Ahmed Khaled, learning those material 14 Aug. 2023 *)


(* Lexical Scope 
الاقتران المعجل هو قرن الوظيفة بسياق نشأتها بحيث يفيد متغيراتها الداخلية غير عواملها عند استدعائها  *)

(* dynamic scope 
الاقتران المرجئ هو قرن الوظيفة بسياق محل استدعائها بحيث يفيد متغيراتهاالداخلية كما عواملهاعند استدعائها
*)

(* 1 *) val x = 1

(* 2 *) fun f y = x + y
                (*   
                   fun f y = 2 + y 
                *)
                (* هنا لمجرد التصوير، فالاستفادة للقيم من السياق المقترن بالتعريف يحصل عند الاستدعاء *)
                (* f is a function that "always" adds 2 to its argument, wherever it called later ")
                   ; 
                   methodology, replace each non-argument variables with current dynamic environment *)
(* 3 *) val x = 2

(* 4 *) val y = 3

(* 5 *) val z = f (x + y)

