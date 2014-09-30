# Generic: yes
# Type checked: no

class Node():
	def __init__(self, value):
		self.value = value
		self.l = None
		self.r = None
	def contains(self, value):
		if self.value == value:
			return True
		if value < self.value:
			if self.l == None:
				return False
			return self.l.contains(value)
		if value > self.value:
			if self.r == None:
				return False
			return self.r.contains(value)
	def add(self, value):
		if self.value == value:
			return
		if value < self.value:
			if self.l == None:
				self.l = Node(value)
			else:
				self.l.add(value)
		if value > self.value:
			if self.r == None:
				self.r = Node(value)
			else:
				self.r.add(value)


root = Node(10)
root.add(9)
root.add(8)
root.add(20)
root.add(15)

for n in [10,9,8,20,15,13,14,16,0,1,1000]:
	print str(n) + ":" + str(root.contains(n))