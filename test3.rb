$ops = {'0'=>'+=','1'=>'-=','2'=>'*=','3'=>'/=','5'=>'p ','7'=>'print ','4'=>'(','8'=>')','6'=>'[','9'=>']',}
$vars = {'A'=>0,'B'=>0,'C'=>0,'D'=>0,'E'=>0,'F'=>0,'G'=>0,'H'=>0,'I'=>0,'J'=>0,'K'=>0,'L'=>0,'M'=>0,'N'=>0,'O'=>0,'P'=>0,'Q'=>0,'R'=>0,'S'=>0,'T'=>0,'U'=>0,'V'=>0,'W'=>0,'X'=>0,'Y'=>0,'Z'=>0}
$vals = {'a'=>0,'b'=>1,'c'=>2,'d'=>3,'e'=>4,'f'=>5,'g'=>6,'h'=>7,'i'=>8,'j'=>9,'k'=>10,'l'=>11,'m'=>12,'n'=>13,'o'=>14,'p'=>15,'q'=>16,'r'=>17,'s'=>18,'t'=>19,'u'=>20,'v'=>21,'w'=>22,'x'=>23,'y'=>24,'z'=>25}
sourceCode = File.read("1ine/1ine.txt").split

def lineValue(char)
    return "$vars['#{char}']" if $vars.include?char
    return $vals[char] if $vals.include?char
end
#Pass för att konvertera variabler till Variables['¤'] Kolla på en operator, kolla sedan på tecknena bredvid den, konvertera till rubykod, kernel.eval
def line(sourceCode)
    $big = 0
    executed = false
    while $big < sourceCode.length
        $smol = 0
        sourceCode[$big].each_char do |char|
            Kernel.eval("#{lineValue(sourceCode[$big][$smol-1])}#{$ops[char]}#{lineValue(sourceCode[$big][$smol+1])}") if Hash[Array($ops)[0..3]].include?char
            Kernel.eval("#{$ops[char]}#{lineValue(sourceCode[$big][$smol+1])}") if Hash[Array($ops)[4..5]].include?char
            # if Hash[Array($ops)[0..3]].include?char
            #     Kernel.eval("#{lineValue(sourceCode[$big][$smol-1])}#{$ops[char]}#{lineValue(sourceCode[$big][$smol+1])}") 
            # end
            $smol += 1
        end
        $big += 1
    end
end

line(sourceCode)
#p $vars
#p Kernel.eval("$vars['A']+=$vars['B']")
#p Kernel.eval("$vars['A']*=2")

#Mål: Få fibonacci-sequence att funka!
#I0b7F7I B1BB02FI37B F1FF0I I1II0B _1d| #Fib-sequence
#L0zI0b7F7I B1BB02FI37B F1FF0I I1II0B L6L1b_1d9| #Fib-sequence första 25 tal
#F: x x 0 1 1 2 3 ...
#I: x x 1 1 2 3 5 ...
#B: x x 1 2 3 5 8 ...
#7: 0 1 1 2 3 5 8 ...


