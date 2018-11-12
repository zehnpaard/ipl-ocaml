type exp = [
  | `EId of string
  | `EInt of int
]

type ty = [
  | `TInt
]

type stm = [
  | `SExp of exp
]

type def = [
  | `DFun of ty * string * (ty * string) list * stm list
]
