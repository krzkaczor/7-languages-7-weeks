"hello world" println

(1+1) println

// 1 + "one"

("0 is " ..   if(0,   "true", "false")) println
("1 is " ..   if(1,   "true", "false")) println
("nil is " .. if(nil, "true", "false")) println
("'' is " ..  if("",  "true", "false")) println


Vehicle := Object clone
Vehicle version := "1.0.0"
Vehicle getVersion := method(self version)

Vehicle slotNames println
executeByName := method(o, slotName, o perform (slotName)) // using getSlot(slotName) call won't work b/c of self

Vehicle println
executeByName(Vehicle, "getVersion") println

