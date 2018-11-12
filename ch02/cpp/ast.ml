type exp = [
  | `EId of string
  | `EInt of int
]

type ty = [
  | `TInt
]

type stm = [
  | `SExp of exp
  | `SDecl of ty * string
  | `SDecls of ty * string list
  | `SInit of ty * string * exp
]

type def = [
  | `DFun of ty * string * (ty * string) list * stm list
]
