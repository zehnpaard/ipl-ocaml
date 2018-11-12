type value = [
  | `EInt of int
  | `EAdd of value * value
  | `ESub of value * value
  | `EMul of value * value
  | `EDiv of value * value
]

let rec eval = function
  | `EInt n -> n
  | `EAdd (v1, v2) -> eval v1 + eval v2
  | `ESub (v1, v2) -> eval v1 - eval v2
  | `EMul (v1, v2) -> eval v1 * eval v2
  | `EDiv (v1, v2) -> eval v1 / eval v2
