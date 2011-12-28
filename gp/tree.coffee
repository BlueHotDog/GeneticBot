_ 		= require("underscore")
util 	= require('util')
eyes 	= require('eyes')



class Tree
	constructor: (value) ->
		@value = value
		@nodes = []
	
	addNode: (value) ->
		if value.value
			node = new Tree(value.value)
			node.name = value.name or "terminal"
			node.nodes = value.nodes or []
		else
			node = new Tree(value)
		
		console.log node
		@nodes.push(node)
		node
	
	print: (depth = 0) ->
		eyes.inspect(@)

	execute: (args...) ->
		params = []
		params.push(node.execute(args...)) for node in @nodes
		if _(@value).isFunction()
			@value.apply(@,params)
		else
			@value

exports.Tree = Tree



