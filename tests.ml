#use ".ocamlinit";;

(* Exercise 1 *)
assert ([10; 10; 4; 3; 2; 1] = (merge [10; 4; 2] [10; 3; 1]));
assert ([10; 3; 2; -2; -3; -10] = (merge [3; -2; -10] [10; 2; -3]));

(* Exercise 2 *)
assert (385 = (sigma 1 10 (fun x -> x*x)));
assert (0 = (sigma 3 1 (fun x -> x*x)));
assert (27 = (sigma 3 3 (fun x -> x*x*x)));
assert (385 = (sigma (-10) (-1) (fun x -> x*x)));

(* Exercise 3 *)
assert (20 = (iter 10 (fun x->x+2)) 0);

(* Exercise 4 *)
assert (true = eval TRUE);
assert (false = eval FALSE);
assert (false = eval (NOT TRUE));
assert (true = eval (NOT FALSE));
assert (true = eval (ANDALSO (TRUE, TRUE)));
assert (false = eval (ANDALSO (TRUE, FALSE)));
assert (false = eval (ANDALSO (FALSE, TRUE)));
assert (false = eval (ANDALSO (FALSE, FALSE)));
assert (true = eval (ORELSE (TRUE, TRUE)));
assert (true = eval (ORELSE (TRUE, FALSE)));
assert (true = eval (ORELSE (FALSE, TRUE)));
assert (false = eval (ORELSE (FALSE, FALSE)));
assert (false = eval (IMPLY (TRUE, FALSE)));
assert (true = eval (IMPLY (TRUE, TRUE)));
assert (true = eval (IMPLY (FALSE, TRUE)));
assert (true = eval (IMPLY (FALSE, FALSE)));
assert (true = eval (LESS (NUM 3, NUM 5)));
assert (false = eval (LESS (NUM 3, NUM 3)));
assert (false = eval (LESS (NUM 3, NUM 1)));
assert (false = eval (LESS (PLUS (NUM 3, NUM 4), MINUS (NUM 5, NUM 1))));
assert (true = eval (LESS (PLUS (NUM 10, NUM 12), MINUS (NUM 10, NUM (-13)))));

(* Exercise 5 *)
;;
let one = SUCC ZERO
let three = SUCC (SUCC (SUCC ZERO))
let four = SUCC three
let rec nat_to_int (input: nat): int =
  match input with
  | ZERO -> 0
  | SUCC(i1) -> 1 + (nat_to_int i1)
;;

assert (7 = nat_to_int (natadd three four));
assert (0 = nat_to_int (natadd ZERO ZERO));
assert (3 = nat_to_int (natadd ZERO three));
assert (4 = nat_to_int (natadd four ZERO));
assert (12 = nat_to_int (natmul three four));
assert (0 = nat_to_int (natmul ZERO three));
assert (0 = nat_to_int (natmul four ZERO));
assert (0 = nat_to_int (natmul ZERO ZERO));
assert (3 = nat_to_int (natmul one three));
assert (4 = nat_to_int (natmul four one));
