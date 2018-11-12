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
  | `SReturn of exp
  | `SWhile of exp * stm
  | `SBlock of stm list
  | `SIfElse of exp * stm * stm
]

type def = [
  | `DFun of ty * string * (ty * string) list * stm list
]
