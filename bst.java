public class bst {
	public static void main(String [] args){
		Node<Integer> root = new Node<Integer>(10);
		root.add(20);
		root.add(15);
		root.add(20);
		System.out.printf("%b %b %b %b\n", root.contains(10), root.contains(15),root.contains(20), root.contains(1));
	}
}

class Node<T extends Comparable<T>> {
	private T value;
	private Node<T> l, r;

	public Node(T value){
		this.value = value;
		this.l = null;
		this.r = null;
	}

	public boolean contains(T value){
		if (this.value == value) {
			return true;
		}
		else if (value.compareTo(this.value) < 0){
			if(this.l == null) return false;
			return this.l.contains(value);
		}
		else{
			if(this.r == null) return false;
			return this.r.contains(value);
		}
	}

	public void add(T value){
		if (this.value == value){}
		else if (value.compareTo(this.value) < 0){
			if(this.l == null) this.l = new Node<T>(value);
			else this.l.add(value);
		}
		else {
			if(this.r == null) this.r = new Node<T>(value);
			else this.r.add(value);
		}
	}
}