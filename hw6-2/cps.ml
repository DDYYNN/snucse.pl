(*
 * SNU 4190.310 Programming Languages
 * Continuation Passing Style Conversion Skeleton
 * Jaeseung Choi (jschoi@ropas.snu.ac.kr)
 *)

open M0

let count = ref 0

let new_name () =
  let _ = count := !count + 1 in
  "x_" ^ (string_of_int !count)

let rec alpha_conv exp subs =
  match exp with
  | Num n -> Num n
  | Var x -> (try Var (List.assoc x subs) with Not_found -> Var x)
  | Fn (x, e) -> begin
    let x' = new_name () in
    let subs' = (x, x') :: subs in
    Fn (x', alpha_conv e subs')
  end
  | App (e1, e2) -> App (alpha_conv e1 subs, alpha_conv e2 subs)
  | Rec (f, x, e) -> begin
    let x' = new_name () in
    let f' = new_name () in
    let subs' = (f, f') :: (x, x') :: subs in
    Rec (f', x', alpha_conv e subs')
  end
  | Ifz (e1, e2, e3) -> begin
    Ifz (alpha_conv e1 subs, alpha_conv e2 subs, alpha_conv e3 subs)
  end
  | Add (e1, e2) -> Add (alpha_conv e1 subs, alpha_conv e2 subs)
  | Pair (e1, e2) -> Pair (alpha_conv e1 subs, alpha_conv e2 subs)
  | Fst e -> Fst (alpha_conv e subs)
  | Snd e -> Snd (alpha_conv e subs)

(* TODO : Complete this function *)
let rec conv (exp: mexp): mexp =
  let k = new_name () in
  match exp with
  (* Constant expressions *)
  | Num n -> Fn (k, (* TODO *) Num 1 )
  | Var x -> Fn (k, (* TODO *) Num 1 )
  | Fn (x, e) -> Fn (k, (* TODO *) Num 1 )
  | Rec (f, x, e) -> Fn (k, (* TODO *) Num 1 )
  (* Non constant expressions *)
  | App (e1, e2) -> Fn (k, (* TODO *) Num 1 )
  | Ifz (e1, e2, e3) -> Fn (k, (* TODO *) Num 1 )
  | Add (e1, e2) -> begin
    let v1 = new_name () in
    let v2 = new_name () in
    Fn (k,
      App (conv e1,
        Fn (v1,
          App (conv e2,
            Fn (v2,
              App (Var k, Add (Var v1, Var v2))
              )
            )
          )
        )
      )
  end
  | Pair (e1, e2) -> Fn (k, (* TODO *) Num 1 )
  | Fst e ->  Fn (k, (* TODO *) Num 1 )
  | Snd e ->  Fn (k, (* TODO *) Num 1 )

let cps exp = conv (alpha_conv exp [])

