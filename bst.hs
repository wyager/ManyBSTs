-- Generic: yes
-- Type checked: yes

data Node a = Node {value :: a, l :: Node a, r :: Node a} | Nil

contains :: (Ord a) => Node a -> a -> Bool
Nil `contains` x                    = False
node `contains` x | x == value node = True
                  | x <  value node = l node `contains` x
                  | x >  value node = r node `contains` x

add :: (Ord a) => a -> Node a -> Node a
add x Nil                    = Node x Nil Nil
add x node | x == value node = node
           | x <  value node = node {l = add x (l node)}
           | x >  value node = node {r = add x (r node)}

tree = foldr add Nil [20, 15, 20, 10]
main = print $ map (tree `contains`) $ [10, 15, 20, 1]