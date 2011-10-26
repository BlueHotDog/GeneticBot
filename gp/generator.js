var _ 		= require("underscore"),
	util 	= require('util'),
	tree 	= require('./tree');

function pickRandom(arr) {
	return arr[Math.floor(Math.random()*arr.length)];
}

function Generator() {
	this.terminals = [];
	this.funcs = [];
	this.maxDepth = 10;
	this.terminalPrecent = 3;
}

_.extend(Generator.prototype,{
	addTerminal: function(val) {
		this.terminals.push(val);
	},
	addFunction: function(val, numberOfParams) {
		this.funcs.push({
							func:val,
							expectedParams:numberOfParams
						});
	},
	generate: function(node,depth) {
		depth = depth || 0;
		depth += 1;
		if(this.funcs.length<=0 || this.terminals.length<=0) {return 0;}
		var temp =[];
		for(var i=0;i<this.terminalPrecent;i++) {
			temp.push({type:"terminal",value:pickRandom(this.terminals)});
		}
		if(depth<this.maxDepth) {
			for(var i=0;i<10-this.terminalPrecent;i++) {
				temp.push({type:"function",value:pickRandom(this.funcs)});
			}
		}
		var node 	= node || new tree.Tree(),
			newNode = pickRandom(temp);
		if (newNode.type==="function") {
			node.value = newNode.value.func;
			for(var i=0;i<newNode.value.expectedParams;i++) {
				this.generate(node, depth);
			}
		} else {
			node = node.addNode(newNode.value);
		}
		return node;
	}
});

g = new Generator();
g.terminals = [
	1,
	2,
	3,
	4,
	5,
	6
]
function plus(a,b) {
	return a+b;
}
g.addFunction(plus,2);

var temp = g.generate(); 
console.dir(temp);
temp.print();
console.log(temp.execute());





