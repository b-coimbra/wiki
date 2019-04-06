data Cond a = :? a

infixl 0 ?
infixl 1 :

(?) :: Bool -> Cond a -> a
True  ? (x :? _) = x
False ? (_ :? y) = y

test = 1 < 2 ? "yes" :? "no"