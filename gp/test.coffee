generator = require("./generator").generator

g = new generator()
g.terminals = [
  0,
  1,
  (x)->
    x
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

test = (x,y,z)-> x+3

temp.print();
# console.log(temp.execute(3));
