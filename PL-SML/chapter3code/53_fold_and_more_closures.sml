(* Programming Languages, Dan Grossman *)
(* Section 3: Fold and More Closures *)

(* Another hall-of-fame higher-order function *)

(* I'm Ahmed Khaled, learning those material 15 Aug. 2023 *)


(* note this is "fold left" if order matters 
   can also do "fold right" *)
fun fold (f,acc,xs) =
    case xs of 
	[] => acc
      | x::xs' => fold (f,f(acc,x),xs')
(* fold do not need to know what data, even their type, even what sort of computation applied *)
(* ('a * 'b -> 'a) * 'a * 'b list -> 'a *)
(* افهم أن دالة ف تنفذ كودها ببيئتها، اي تستفاد متغيراتها غير عواملها من بيئة مقترنة بها، أما عواملها تستمها من فولد بالطبع *)

(* examples not using private data *)
(* المقصود من بيانات سرية هو بيانات السياق التي ستنشأ فيه الدالة النكرة المرسولة من غير عواملها لدالة فولد *)

(* sum list *)
fun f1 xs = fold ((fn (x,y) => x+y), 0, xs)
(* are all non-negatives *)
fun f2 xs = fold ((fn (x,y) => x andalso y >= 0), true, xs)

(* examples using private data *)

(* count elements which between a given boundaries *)
fun f3 (xs,lo,hi) = 
    fold ((fn (x,y) => 
	      x + (if y >= lo andalso y <= hi then 1 else 0)),
          0, xs)
(*  are all elements shorter than a given string s*)
fun f4 (xs,s) =
    let 
	val i = String.size s
    in
	fold((fn (x,y) => x andalso String.size y < i), true, xs)
    end

(* more abstraction, g decides, we do not need a client to have to say acc so far andalso new test, 
   such that is a technical detail *)
fun f5 (g,xs) = fold((fn(x,y) => x andalso g y), true, xs)

fun f4again (xs,s) =
    let
	val i = String.size s
    in
	f5(fn y => String.size y < i, xs)
    end

