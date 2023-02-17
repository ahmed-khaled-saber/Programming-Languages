(* one Major aspect of functional programming is once data is build in memory it can't subsequently changed by code *)

(* if some data already exists space efficintly to reuse it if we're going to build a subtle variant of it not rebuild by copeing *)

val x = [1, 2, 3, 4, 5, 5, 6, 7, 8, 9, 10] (* imagine 10^9 or even bigger *)
val y = x                                  (* copieng element wise is not make any wise! *)
val z = tl x                               (* rebuild it on the existence of x is not wise ever *)


(* [] operatort will build the list on memory
   y uses a memory reference to the location of 1nd element of the list
   z uses a memory reference to the location of 2nd element of the list
   but not x, y, or z can change content of that memory locations 
   code only can build Data on another memory location 
 *)


(* Standard ml and almost all Languages reject the princeple of Copy.
    but some of them allows alias and Mutation like :Java
    but some of them allow  alias and no mutation   :SML
 *)

(* Mutaion is dangerous and make Programmer obssessed by the identity of Objects of Data on the Program *)
(* The only way of keeping an actual content untouched with Mutation is to copy it entirly on another memory location *)
(* no Mutation makes it easy to the language to introduce Aliases and make use of existent Data without worries *)
(* Alias and Mutation combined are Anti-Safe *)


(* 1- suppose we write *)
fun sort_pair(pr: int * int) =
    if #1 pr < #2 pr 
    then (#1 pr < #2 pr)
    else (#2 pr < #1 pr)

(* 2- a promtion to make use of a space is to return alis *)
fun sort_pair(pr: int * int) =
    if #1 pr < #2 pr 
    then pr
    else (#2 pr < #1 pr)

(* for the Clients of sort_pair it is indistiguishable! *)
(* سؤال المحير للمبرمج هل لو أرجعت له مكان الداتا الفعلي في الذاكرة قد يفسده و يؤثر علي كل البرنامج من بعده ؟؟؟ *)


fun append(xs: int list, ys: int list) =
if null xs 
then ys
else hd xs::append(tl xs, ys)

xs = [1, 2, 3]
ys = [4, 5]
zs = append(xs, ys)


(* In Java programmers are obssessed ! and they have to *)
(* class ProtectedResource {
    private Resource theResource = ...;
    private String[] allowedUsers = ...;
    
    public String[] getAllowedUsers() {
        return allowedUsers;
    }
    
    public String currentUser() { ... }
    
    public void useTheResource() {
        for(int i=0; i < allowedUsers.length; i++) {
            if(currentUser().equals(allowedUsers[i])) {
                // access allowed: use it
                return;
            }
        }
        throw new IllegalAccessException();
    }
} *)

(* internal allowedUsers data is exposured to any clients to mutate it as its referencr has gotten *)
