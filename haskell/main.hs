module Scratch where

data Foo = FooConstructor String String

bar :: [Foo]
bar =
  (FooConstructor <$> ["hello, neovim!"] <* ["⊕" :: String])
    <*> ["goodbye, neovim!"]

baz :: String
baz = "this should stay as is"
