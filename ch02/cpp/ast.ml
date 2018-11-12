type exp = [
  | `EId of string
  | `EInt of int
  | `EDouble of float
  | `ETrue
  | `EFalse
  | `EString of string
  | `ECall of string * exp list
  | `EPIncr of exp
  | `EPDecr of exp
  | `EIncr of exp
  | `EDecr of exp
  | `ENeg of exp
]

type ty = [
  | `TInt
  | `TDouble
  | `TBool
  | `TString
  | `TVoid
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
