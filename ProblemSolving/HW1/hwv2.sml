fun is_older(d1 : int*int*int, d2: int*int*int) =  #1 d1*10000 + #2 d1*100 + #3 d1 < #1 d2*10000 + #2 d2*100 + #3 d2

fun number_in_month(lod: (int*int*int) list, m: int) = 
    if null lod 
    then 0
    else
        if #2 (hd lod) = m 
        then 1+number_in_month(tl lod, m) 
        else number_in_month(tl lod, m)

fun number_in_months(lod: (int*int*int) list, lom: int list) = 
    if null lom
    then 0
    else  number_in_month(lod, hd lom) + number_in_months(lod, tl lom)

fun dates_in_month(lod: (int*int*int) list, m: int) = 
    if null lod 
    then []
    else 
        if #2 (hd lod) = m
        then hd lod::dates_in_month(tl lod, m)
        else dates_in_month(tl lod, m)

fun dates_in_months(lod:  (int*int*int) list, lom: int list) = 
    if null lom
    then []
    else  dates_in_month(lod, hd lom)@dates_in_months(lod, tl lom)

fun get_nth(los: string list, n: int) = 
    if n = 1
    then hd los
    else get_nth(tl los, n-1)

fun date_to_string(d: int*int*int) = 
    let
        val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in 
        get_nth(months, #2 d)^" "^Int.toString(#3 d) ^","^" "^Int.toString((#1 d))
    end

fun number_before_reaching_sum(s: int, lon: int list) =
    if s -(hd lon) <= 0
    then 0
    else 1 + number_before_reaching_sum(s-(hd lon), tl lon)


fun what_month(d: int) = 
    let 
        val days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
        number_before_reaching_sum(d, days) + 1
    end

fun month_range(d1: int, d2: int) =
    if d1 > d2 
    then []
    else what_month(d1)::month_range(d1+1, d2)
        

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