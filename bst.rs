// Generic: yes
// Type checked: yes

struct Node<T>{
	value: T,
	l: Option<Box<Node<T>>>,
	r: Option<Box<Node<T>>>
}

impl<T:Ord> Node<T> {
	fn new(value:T) -> Node<T> {
		Node{value: value, l: None, r: None}
	}
	fn contains(&self, value:&T) -> bool {
		match value.cmp(&self.value) {
			Less => match self.l {
				Some(ref node) => node.contains(value),
				None => false
			},
			Equal => true,
			Greater => match self.r {
				Some(ref node) => node.contains(value),
				None => false
			}
		}
	}
	fn add(&mut self, value:T) {
		match value.cmp(&self.value) {
			Less => match self.l {
				Some(ref mut node) => node.add(value),
				None => self.l = Some(box Node::new(value))
			},
			Equal => {},
			Greater => match self.r {
				Some(ref mut node) => node.add(value),
				None => self.r = Some(box Node::new(value))
			}
		}
	}
}

fn main(){
	let mut root = Node::new(10i);
	root.add(20i);
	root.add(15i);
	root.add(20i);
	let contained : Vec<bool> = [10i, 15i, 20i, 1i].iter()
		.map(|x| root.contains(x)).collect();
	println!("{}", contained);
}