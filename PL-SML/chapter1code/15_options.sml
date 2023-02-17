(* Programming Languages, Dan Grossman *)
(* Section 1: Options *)

(* I am Ahmed Khaled tries learning those Materials *)


(* badly named: evaluates to 0 on empty list *)
(* الصفر نفسه عدد صحيح ماذا لو كان الإجابة الصحيحة صفر أصلا! وكذلك الأرقام السالبة *)
fun old_max (xs : int list) =
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else
	let val tl_ans = old_max(tl xs)
	in
	    if hd xs > tl_ans
	    then hd xs
	    else tl_ans
	end

(* better: returns an int option *)
(* isSome tl_ans is a GUARD to avoid Exception of valOf NONE which comes from the root so indeed it is suspecious and necessary to have such guard
   but it the answer for One Case!, any better/cleaner way ?*)
fun max1 (xs : int list) =
    if null xs
    then NONE
    else 
	let val tl_ans = max1(tl xs)
	in if isSome tl_ans andalso valOf tl_ans > hd xs
	   then tl_ans
	   else SOME (hd xs)
	end


(* looks the same as max1 to clients; 
   implementation avoids valOf *)
   
(* Wrapper Function to take care the Input case if have SOME anser or NONE at all
	and a recursive Function to compute the anssewer under the ASUUMPTION it is indeed exist *)
fun max2 (xs : int list) =
    if null xs
    then NONE
    else 
	let (* fine to assume argument nonempty because it is local *)
		fun max_nonempty (xs : int list) =
			if null (tl xs) (* xs better not be [] *)
			then hd xs
			else 
				let 
					val tl_ans = max_nonempty(tl xs)
				in
					if hd xs > tl_ans
					then hd xs
					else tl_ans
				end
	in
	    SOME (max_nonempty xs)
	end

(* Solution Evolution

	max int list -> int 
	even on [] input case it returns 0  => WRONG LOGiC 0 is an int possibly is the right answer

	max int list -> int list 
	on [] input case it returns [0]     => not so bad but Strange Interface to Clients

	max int list -> int
	on [] input case it RAISE Exception => not so bad but there is better

	كون إجراء عنده إجابة لجسبة ما او ليس لديه اي حسبة مطلقا شئ شائع جدا
	special Type for that is there

	max int list -> int option   // Consistent Solution :)

 *)