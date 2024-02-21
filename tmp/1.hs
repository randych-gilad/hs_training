main = undefined

toList :: Maybe a -> [a]
toList Nothing = []
toList (Just x) = [x]

concat' [] = []
concat' (x:xs) = x ++ concat' xs

foldr'' _ start [] = start
foldr'' f start (Nothing:xs) = foldr'' f start xs
foldr'' f start [Just x] = f start x
foldr'' f start (Just x:xs) = f x $ foldr'' f start xs

data LinkedList a = Cons a (LinkedList a) | End deriving Show

instance Semigroup (LinkedList a) where
  (<>) :: LinkedList a -> LinkedList a -> LinkedList a
  (<>) End End = End
  (<>) (Cons x _) (Cons y _) = Cons x $ Cons y End
  (<>) End (Cons y _) = Cons y End
  (<>) (Cons x _) End = Cons x End
instance Monoid (LinkedList a) where
  mempty :: LinkedList a
  mempty = End
instance Semigroup Int where
  (<>) :: Int -> Int -> Int
  (<>) x y = read $ (++) (show x) (show y)
instance Monoid Int where
  mempty :: Int
  mempty = 0