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
	print: function(depth) {
		depth = depth || 0;
		depth += 1;
		var st = "";
		for(var i=0;i<depth;i++) {
			st += "="
		}
		console.log("%s>%s",st,this.value);
		this.nodes.forEach(function(node) {
			node.print(depth);
		});
	},
	execute: function() {
		var params = [];
		this.nodes.forEach(function(node) {
			params.push(node.execute());
		});
		if (_(this.value).isFunction()===false) {
			return this.value;
		} else {
			return this.value.apply(this,params);
		}
	}
});

exports.Tree = Tree;



