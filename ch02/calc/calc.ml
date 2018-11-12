type value = [
  | `EInt of int
]

let eval = function
  | `EInt n -> n
