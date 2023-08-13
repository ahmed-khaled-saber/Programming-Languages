(* Programming Languages, Dan Grossman *)
(* Section 1: Let Expressions to Avoid Repeated Computation *)

(* I am Ahmed Khaled tries learning those Materials *)


(* badly named: evaluates to 0 on empty list *)
fun bad_max (xs : int list) =
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else if hd xs > bad_max(tl xs)
    then hd xs
    else bad_max(tl xs)

(* badly named: evaluates to 0 on empty list *)
fun good_max (xs : int list) =
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else
	(* for style, could also use a let-binding for (hd xs) *)
	let 
        val tl_ans = good_max(tl xs)
	in
	    if hd xs > tl_ans
	    then hd xs
	    else tl_ans
	end
(* from is the lower bound here *)
fun countup(from : int, to : int) =
    if from=to
    then to::[]
    else from :: countup(from+1,to)
(* from is the greater number, to is the smaller bound *)
fun countdown(from : int, to : int) =
    if from=to
    then to::[]
    else from :: countdown(from-1,to)


(* Avoid Reapeatd Computation in general by bind a binding ! specially avoid using a recursive computation twice! *)
(* الحسابات المتكررة ليست دائما سهلة الإلتقاط أنك حسبتها مسبقا  *)
(* not recursive but repeated computation
input  : [1, 1, 1, ...]
output : [1, 2, 3, ...]
commulative sum
[1, 1+1, 1+1+1, ...] bad 
*)