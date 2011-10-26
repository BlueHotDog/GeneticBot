var _ 		= require("underscore"),
	util 	= require('util');


function Tree(value) {
	this.value = value;
	this.nodes = [];
}

_.extend(Tree.prototype, {
	addNode: function(value) {
		var node = new Tree(value);
		this.nodes.push(node);
	},
	print: function() {
		console.log("%j",this);
	},
	execute: function() {
		
	}
});



var tree = new Tree(function(a,b) {
	return a+b;
});
tree.addNode(10);
tree.addNode(5);

tree.print();

