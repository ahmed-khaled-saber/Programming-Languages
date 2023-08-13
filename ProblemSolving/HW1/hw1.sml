(* 
You will write 11 SML functions (and tests for them) related to calendar dates. In all problems, a “date”
is an SML value of type int*int*int, where the first part is the year, the second part is the month, and
the third part is the day. A “reasonable” date has a positive year, a month between 1 and 12, and a day no
greater than 31 (or less depending on the month). Your solutions need to work correctly only for reasonable
dates, but do not check for reasonable dates (that is a challenge problem) and many of your functions will
naturally work correctly for some/all non-reasonable dates. A “day of year” is a number from 1 to 365
where, for example, 33 represents February 2. (We ignore leap years except in one challenge problem.)
*)

(* Type Definition:  Date is int * int * int  tuple *)
(* Interpretation :  year * month * day *)

(* 1. Write a function is_older that takes two dates and evaluates to true or false. It evaluates to true if
the first argument is a date that comes before the second argument. (If the two dates are the same,
the result is false.) *)
fun is_older(d1: (int*int*int), d2: (int*int*int)) = 
    let 
        (* (int*int*int) -> int *)
        (* ex: (2011,3,31) = 20110331 *)
        fun convert_date_to_int(d: (int*int*int)) = (#1 d)*10000 + (#2 d)*100 + (#3 d)*1
    in 
        convert_date_to_int(d1) < convert_date_to_int(d2)
    end


(* I really need to combined logic with andalso/orelse that catch this!, or even series of nested if then else since i triy all sorts of pain
(* I know it is wrong, but i do not know exactly why ? *)
fun is_older(date1: int*int*int, date2: int*int*int) = (#1 date1) < (#1 date2) andalso (#2 date1) < (#2 date2) andalso (#3 date1) <= (#3 date2) *)



(* 2. Write a function number_in_month that takes a list of dates and a month (i.e., an int) and returns
how many dates in the list are in the given month. *)
fun number_in_month(lod: (int*int*int) list, m: int) =
    let 
        fun count_for_m(lod: (int*int*int) list) = 
            if null lod
            then 0
            else
                if #2 (hd lod) = m then count_for_m(tl lod) + 1  else count_for_m(tl lod)
    in 
        count_for_m(lod)
    end
(* Code is clean because i avoided {make use of vars already in the environment "m"} pattern, is'nt it? *)

(* 3. Write a function number_in_months that takes a list of dates and a list of months (i.e., an int list)
and returns the number of dates in the list of dates that are in any of the months in the list of months.
Assume the list of months has no number repeated. Hint: Use your answer to the previous problem. *)

(* (int*int*int) list * int list -> int  *)
fun number_in_months(lod: (int*int*int) list, lom: int list) =
  if null lom 
  then 0
  else number_in_month(lod, hd lom) + number_in_months(lod, tl lom)
(* code is elegant because of using a preceding function binding as part of the solution *)


(* 4. Write a function dates_in_month that takes a list of dates and a month (i.e., an int) and returns a
list holding the dates from the argument list of dates that are in the month. The returned list should
contain dates in the order they were originally given *)

(* ((int*int*int) list * int -> (int*int*int) list) *)
fun dates_in_month(lod: (int*int*int) list, m: int) = 
    let
        fun dates_uses_m(lod: (int*int*int) list) = 
            if null lod
            then [] (* Accumlator و طريقه للخلف مُعَبّد*)
            else 
                if #2 (hd lod) = m
                then  hd lod::dates_uses_m(tl lod)
                else  dates_uses_m(tl lod)
    in
        dates_uses_m(lod)
    end    
(* I think i violates Code readability but i try to stick with Cousrse Idioms; make use of variables on the Environment*)


(* 5. Write a function dates_in_months that takes a list of dates and a list of months (i.e., an int list)
and returns a list holding the dates from the argument list of dates that are in any of the months in
the list of months. Assume the list of months has no number repeated. Hint: Use your answer to the
previous problem and SML’s list-append operator (@). *)

(* (int*int*int) list * int list -> (int*int*int) list *)
fun dates_in_months(lod: (int*int*int) list, lom: int list) = 
    if null lom
    then []
    else dates_in_month(lod, hd lom) @ dates_in_months(lod, tl lom)
(* code is clean due to the more complex problem is composed by less complex solution = Function composition *)

(* 6. Write a function get_nth that takes a list of strings and an int n and returns the nth element of the
list where the head of the list is 1st. Do not worry about the case where the list has too few elements:
your function may apply hd or tl to the empty list in this case, which is okay. *)
fun get_nth(los: string list, n: int) = 
    if n = 1
    then hd los
    else get_nth(tl los, n-1)
(* code is clean because the way n goes from higher to lower value instead of carring an increasing accumlator *)

(* 7. Write a function date_to_string that takes a date and returns a string of the form January 20, 2013
(for example). Use the operator ^ for concatenating strings and the library function Int.toString
for converting an int to a string. For producing the month part, do not use a bunch of conditionals.
Instead, use a list holding 12 strings and your answer to the previous problem. For consistency, put a
comma following the day and use capitalized English month names: January, February, March, April,
May, June, July, August, September, October, November, December *)

fun date_to_string(d: (int*int*int)) =
    let 
        val MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in
        get_nth(MONTHS, #2 d)^" "^Int.toString(#3 d) ^","^" "^Int.toString((#1 d))  (* June 1, 2013 *)
    end
(* code is clean as MONTHS introduved as local binding hidden from clients *)

(* 8. Write a function number_before_reaching_sum that takes an int called sum, which you can assume
is positive, and an int list, which you can assume contains all positive numbers, and returns an int.
You should return an int n such that the first n elements of the list add to less than sum, but the first
n + 1 elements of the list add to sum or more. Assume the entire list sums to more than the passed in
value; it is okay for an exception to occur if this is not the case. *)

(*  int*int list -> int *)
fun number_before_reaching_sum(sum: int, ns: int list) = 
    let 
        val z1 = sum - (hd ns)                     (**)
        val z2 = sum - ( (hd ns) + (hd (tl ns)) )  (* hd ,and tl is cheap, although z2 = z1 - hd tl ns is nicer *)
    in
        if z1 > 0 andalso z2 <= 0
        then hd ns
        else number_before_reaching_sum(sum-(hd ns), tl ns)
    end 
(* code is clean due to the local bindings  *)


(* 9. Write a function what_month that takes a day of year (i.e., an int between 1 and 365) and returns
what month that day is in (1 for January, 2 for February, etc.). Use a list holding 12 integers and your
answer to the previous problem. *)


(* val month's_days_commulative = [31,59,90,120,151,181,212,243,273,304,334,365] *)

(* int -> int  *)
fun what_month(day: int) = 
    let
        val month's_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        fun wh_month(day: int, mns: int list) = 
            if day <= 0
            then 0 
            else 1 + wh_month(day - hd mns, tl mns)
    in 
        wh_month(day, month's_days)
    end
(* I need some one guide me if there was a better flow of thinking *)

(* 10. Write a function month_range that takes two days of the year day1 and day2 and returns an int list
[m1,m2,...,mn] where m1 is the month of day1, m2 is the month of day1+1, ..., and mn is the month
of day day2. Note the result will have length day2 - day1 + 1 or length 0 if day1>day2. *)

(* int * int -> int list *)
fun month_range(s: int, e: int) = 
    if s > e
    then []
    else what_month(s)::month_range(s+1, e)
(*  *)

(* 11. Write a function oldest that takes a list of dates and evaluates to an (int*int*int) option. It
evaluates to NONE if the list has no dates and SOME d if the date d is the oldest date in the list. *)

(*  (int * int * int) list -> (int*int*int) option *)
fun oldest(lod: (int * int * int) list) = 
    if null lod
    then NONE
    else 
        let
            (* Guarantee a non-empty (int*int*int)list *)
            fun oldest_hlp(lod: (int * int * int) list) =
                if null (tl lod)
                then hd lod
                else 
                    let 
                        val tl_ans = oldest_hlp(tl lod)
                    in
                        if is_older(hd lod, tl_ans)
                        then hd lod
                        else tl_ans
                    end
        in
            SOME (oldest_hlp(lod))
        end