(* Programming Languages, Dan Grossman *)
(* Section 3: Closures and Recomputation *)

(* I'm Ahmed Khaled, learning those material 14 Aug. 2023 *)


fun filter (f,xs) =
    case xs of
	[] => []
      | x::xs' => if f x then x::(filter(f,xs')) else filter(f,xs')

fun allShorterThan1 (xs,s) = 
    filter (fn x => String.size x < (print "!"; String.size s), xs)
    (* الدالة مجهولة الهوية تعريف وليس استدعاء، فهى تستفيد غير عواملها من البيئة الحاضنة لها
     والتي هي البيئة التي هيأتها الدالة العالية *)

fun allShorterThan2 (xs,s) =
    let 
	val i = (print "!"; String.size s)
    in
	filter(fn x => String.size x < i, xs)
    end
(* case1: Assume a call allShorterThan1(["x", "xxx", "xx"], "xxxx")
       Anonymous function with its closure can be represented as fn x => String.size x <  fn x => String.size "xxxx" *)
(* case2: Assume a call allShorterThan1(["x", "xxx", "xx"], "xxxx")
       Anonymous function with its closure can be represented as fn x => String.size x <  fn x => 4 *)
       (* ثبات العدد لا يحتاج لإعادة استدعاء دالة تعرف طوله كل مرة، يؤدي لفرق إذا عظم الإدخال,
        والمقصود هو التمكن من كيفية عمل الـ closure  *)

val _ = print "\nwithAllShorterThan1: "

val x1 = allShorterThan1(["1","333","22","4444"],"xxx")

val _ = print "\nwithAllShorterThan2: "

val x2 = allShorterThan2(["1","333","22","4444"],"xxx")

val _ = print "\n"
