type value = [
  | `EInt of int
  | `EAdd of value * value
]

let rec eval = function
  | `EInt n -> n
  | `EAdd (v1, v2) -> eval v1 + eval v2
