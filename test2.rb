operators = ["+","-"]
$pointers = {big: 0, smol: 0}
#Kernel.eval är magisk
#A = 3
# Ab1 = 2

# string = "Ab1"
# puts Kernel.eval(string)

# string[1] = operators[1]

# puts Kernel.eval(string)

# pring = "12*(2+4)"

# puts Kernel.eval(pring)
Vars = {'A'=>0,'B'=>1}

p Vars.include?'B'

Kernel.eval("Vars['A'] += 2")
puts Vars['B']
Kernel.eval("Vars['A'] += 2")
puts Vars['A']
Kernel.eval("Vars['A'] /= 2")
puts Vars['A']
#$pointers[:big] += 25
#p $pointers[:big]
