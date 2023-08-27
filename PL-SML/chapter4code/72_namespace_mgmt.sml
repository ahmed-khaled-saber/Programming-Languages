(* Programming Languages, Dan Grossman *)
(* Section 4: Modules for Namespace Management *)

(* I'm Ahmed Khaled tries learning those materials on 26 aug. 2023 *)

structure MyMathLib =
struct

fun fact x = if x=0 then 1 else x * fact (x - 1)

val half_pi = Math.pi / 2.0

fun doubler y = y + y

end

val pi = MyMathLib.half_pi + MyMathLib.half_pi

val twenty_eight = MyMathLib.doubler 14
