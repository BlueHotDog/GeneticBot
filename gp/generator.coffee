_ 		= require("underscore")
util 	= require('util')
tree 	= require('./tree')
eyes 	= require('eyes').inspector({ hideFunctions: false });


class Generator
	constructor: (@maxDepth=4,@terminalPrecent=3)->
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
			node.type = "function"
			for i in [1..newNode.value.value.length]
				node.addNode(@generate(null,depth))
		else 
			node = new tree.Tree(newNode.value)
			node.type = "terminal"
		node

	_pickRandom: (arr)-> 
		arr[Math.floor(Math.random()*arr.length)]

exports.generator = Generator








