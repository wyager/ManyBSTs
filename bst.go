// Generic: no
// Type checked: yes

package main

import (
	"fmt"
)

type Node struct {
	value int
	l     *Node
	r     *Node
}

func mkNode(value int) *Node {
	return &Node{value, nil, nil}
}

func (node *Node) contains(value int) bool {
	if node.value == value {
		return true
	} else if value < node.value {
		if node.l == nil {
			return false
		} else {
			return node.l.contains(value)
		}
	} else {
		if node.r == nil {
			return false
		} else {
			return node.r.contains(value)
		}
	}
}

func (node *Node) add(value int) {
	if node.value == value {
		return
	} else if value < node.value {
		if node.l == nil {
			node.l = mkNode(value)
		} else {
			node.l.add(value)
		}
	} else {
		if node.r == nil {
			node.r = mkNode(value)
		} else {
			node.r.add(value)
		}
	}
}

func main() {
	root := mkNode(10)
	root.add(20)
	root.add(15)
	root.add(20)
	for _, v := range []int{10, 15, 20, 1} {
		fmt.Println(root.contains(v))
	}
}
