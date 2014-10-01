// Generic: no
// Type checked: yes

#include <stdio.h>
#include <stdlib.h>

typedef struct node_struct {
	int value;
	struct node_struct* l;
	struct node_struct* r;
} node;

node make_node(int value){
	node n = {};
	n.value = value;
	return n;
}

int contains(const node* n, const int value){
	if(n->value == value) return 1;
	if(value < n->value){
		if(n->l == NULL) return 0;
		return contains(n->l, value);
	}
	if(value > n->value){
		if(n->r == NULL) return 0;
		return contains(n->r, value);
	}
}

void add(node* n, const int value){
	if(n->value == value) return;
	else if(value < n->value){
		if(n->l == NULL){
			n->l = malloc(sizeof(node));
			*n->l = make_node(value);
		}
		else{
			add(n->l, value);
		}
	}
	else if(value > n->value){
		if(n->r == NULL){
			n->r = malloc(sizeof(node));
			*n->r = make_node(value);
		}
		else{
			add(n->r, value);
		}
	}
}

int main(int argc, char** argv){
	node root = make_node(10);
	add(&root, 20);
	add(&root, 15);
	add(&root, 20);
	printf("%i %i %i %i\n", contains(&root, 20), contains(&root, 15), contains(&root, 10), contains(&root, 1));
}