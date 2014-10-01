// Generic: yes
// Type checked: yes

#include <iostream>

template <class T>
class Node
{
private:
	Node<T> *l, *r;
public:
	T value;
	Node(T value):l(nullptr), r(nullptr), value(value){
		this->value = value;
	}
	~Node(){
		if(this->l) delete this->l;
		if(this->r) delete this->r;
	}
	bool contains(T value){
		if(value == this->value) return true;
		else if (value < this->value){
			if(this->l) return this->l->contains(value);
			else return false;
		}
		else {
			if(this->r) return this->r->contains(value);
			else return false;
		}
	}
	void add(T value){
		if(value == this->value) return;
		else if (value < this->value){
			if(this->l) this->l->add(value);
			else this->l = new Node<T>(value);
		}
		else if (value > this->value){
			if(this->r) this->r->add(value);
			else this->r = new Node<T>(value);
		}
	}
};

int main(int argc, char** argv){
	Node<int> root(10);
	root.add(20);
	root.add(15);
	root.add(20);
	std::cout << root.contains(10) << root.contains(15) << root.contains(20) << root.contains(1) << "\n";
	return 0;
}