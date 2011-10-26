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
		var params = [];
		this.nodes.forEach(function(node) {
			params.push(node.execute());
		});
		if(_(this.value).isFunction()===false){
			return this.value;
		} else {
			return this.value.apply(this,params);
		}
	}
});



var tree = new Tree(function(a,b) {
	return a+b;
});
tree.addNode(10);
tree.addNode(5);

tree.print();
console.log(tree.execute());

