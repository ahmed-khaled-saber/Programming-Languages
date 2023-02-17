(* Error: operator and operand don't agree

5 + true 
[true, 5]
5 > true 

*)

(* uncaught exception Empty
hd [];

 *)


(*  uncaught exception Option
    valOf None

 *)

 (* operator and operand don't agree [equality type required]
    2.0 = 2.0

    actually is good Design, Flaoting poist seen if they have some eplison differnce 
  *)


(* Error: unresolved flex record (need to know the names of ALL the fields
   تعريف دالة بدون التصريع بنوع بياناتها او حتي السماح لإستنتاج ذلك للنظام النوعي
   fun is_older(date1 , date2) = #1 date1 < #1 date2 andalso #2 date1 < #2 date2 andalso #3 date1 < #3 date2;
 *)


