(* not is a function and nirther andalso / orelse? *)

(* Function semantic it evaluates all its subexpressions before proceeds it, so it fits not
    while e1 andalso e2 semantic is to evaluate e2 if and only if e1 be true like orelse

    no Error on defining andalso like function takes e1, e2
    but "atomic" non ncessary evaluation can harm Efficincy of the Programmung Language 
    so a coplete constructs of Langauges are introduced
 *)

(* 
    All you need is if then else
    andalso and orelse and not are just convienient
 *)



if e then true else false
(* e itself  evaluates to those :)*)


(* convert this to combimed logic *)
fun is_older(d1: (int*int*int), d2: (int*int*int)) = 
    if #1 d1 < #1 d2
    then true
    else 
        if #2 d1 < #2 d2
        then true
        else 
            if  #3 d1 < #3 d2
            then true
            else false
(* answer *)
