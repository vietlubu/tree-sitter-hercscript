; Comments
(comment) @comment

; Keywords
[
  "script"
  "function"
  "return"
  "if"
  "else"
  "switch"
  "case"
  "default"
  "while"
  "for"
  "do"
  "break"
  "continue"
  "goto"
  "end"
  "close"
  "next"
  "menu"
  "select"
] @keyword

; Control flow
[
  "if"
  "else"
  "switch"
  "case"
  "default"
  "while"
  "for"
  "do"
] @keyword.control

; Return statements
"return" @keyword.return

; Labels
(label) @label

; Functions
(function_def
  name: (identifier) @function)

(function_call
  function: (identifier) @function.call)

; Built-in commands (common Hercules Script commands)
(command_call
  command: (identifier) @function.builtin
  (#match? @function.builtin "^(mes|next|close|end|input|menu|select|set|setarray|getitem|delitem|countitem|skilleffect|sc_start|sc_end|percentheal|heal|itemheal|monster|announce|mapannounce|areaannounce|getd|setd|attachrid|detachrid|isloggedin|warp|areawarp|getarg|callsub|callfunc|sleep|sleep2|awake|getvariableofnpc|strnpcinfo|strcharinfo|getarraysize|deletearray|cleararray|copyarray)$"))

; Variables
(identifier) @variable

; Constants
(number) @number
(string) @string

; NPC definitions
(npc_name) @string.special
(npc_sprite) @type

; Operators
[
  "+"
  "-"
  "*"
  "/"
  "%"
  "="
  "=="
  "!="
  "<"
  ">"
  "<="
  ">="
  "&&"
  "||"
  "!"
  "&"
  "|"
  "^"
  "<<"
  ">>"
  "+="
  "-="
  "*="
  "/="
  "%="
  "&="
  "|="
  "^="
  "<<="
  ">>="
  "++"
  "--"
  "?"
  ":"
] @operator

; Punctuation
[
  ";"
  ","
  "."
  ":"
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

; Special
(position) @constant
