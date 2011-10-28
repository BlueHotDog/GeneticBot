_ 		= require("underscore")
util 	= require('util')
tree 	= require('./tree')
eyes 	= require('eyes').inspector({ hideFunctions: false });


class Generator
	constructor: (@maxDepth=17,@terminalPrecent=3)->
		@terminals = []
		@funcs = []
	addTerminal: (val) ->
		@terminals.push(val)
	addFunction: (val,name) ->
		@funcs.push({value:val,name:name})
	getRandomNode: ()->
		temp =[]
		for num in [1..@terminalPrecent]
			temp.push({
				type:"terminal",
				value:@_pickRandom(@terminals)
				})
		for num in [1..10-@terminalPrecent]
			temp.push({
				type:"function",
				value:@_pickRandom(@funcs)
				})
		@_pickRandom(temp)
	generate: (node = (new tree.Tree()), depth=0) ->
		depth += 1
		newNode = if depth>@maxDepth then {value:@_pickRandom(@terminals)} else @getRandomNode()
		if newNode.type is "function"
			node.value = newNode.value.value
			node.name = newNode.value.name
			for i in [1..newNode.value.value.length]
				node.addNode(@generate(null,depth))
		else 
			node = new tree.Tree(newNode.value)
		node
	_pickRandom: (arr)-> 
		arr[Math.floor(Math.random()*arr.length)]





g = new Generator()
g.terminals = [
	1,
	2,
	3,
	4,
	5,
	6
]
plus= (a,b) ->
	a+b
minus= (a,b) ->
	a-b
mult= (a,b) ->
	a*b
devide= (a,b) ->
	if b==0 then 0 else a/b

g.addFunction(plus,"plus")
g.addFunction(minus,"minus")
g.addFunction(mult,"mult")
g.addFunction(devide,"devide")

temp = g.generate()

# console.log("%j",temp);
temp.print();
console.log(temp.execute());





