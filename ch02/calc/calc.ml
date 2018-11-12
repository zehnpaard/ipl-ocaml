type value = [
  | `EInt of int
  | `EAdd of value * value
  | `ESub of value * value
  | `EMul of value * value
  | `EDiv of value * value
]
