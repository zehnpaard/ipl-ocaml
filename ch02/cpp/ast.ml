type exp = [
  | `EId of string
]

type ty = [
  | `TInt
]

type stm = [
  | `SExp of exp
]

type def = [
  | `DFun of ty * exp * (ty * exp) list * stm list
]
