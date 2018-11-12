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
  | `EMul of exp * exp
  | `EDiv of exp * exp
  | `EAdd of exp * exp
  | `ESub of exp * exp
  | `ELt of exp * exp
  | `EGt of exp * exp
  | `ELEq of exp * exp
  | `EGEq of exp * exp
  | `EEq of exp * exp
  | `ENEq of exp * exp
  | `EAnd of exp * exp
  | `EOr of exp * exp
  | `EAss of exp * exp
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
