$ops = {'0'=>'+=','1'=>'-=','2'=>'*=','3'=>'/=','5'=>'p ','7'=>'print ','4'=>'(','8'=>')','6'=>'[','9'=>']',}
$vars = {'A'=>0,'B'=>0,'C'=>0,'D'=>0,'E'=>0,'F'=>0,'G'=>0,'H'=>0,'I'=>0,'J'=>0,'K'=>0,'L'=>0,'M'=>0,'N'=>0,'O'=>0,'P'=>0,'Q'=>0,'R'=>0,'S'=>0,'T'=>0,'U'=>0,'V'=>0,'W'=>0,'X'=>0,'Y'=>0,'Z'=>0}
$vals = {'a'=>0,'b'=>1,'c'=>2,'d'=>3,'e'=>4,'f'=>5,'g'=>6,'h'=>7,'i'=>8,'j'=>9,'k'=>10,'l'=>11,'m'=>12,'n'=>13,'o'=>14,'p'=>15,'q'=>16,'r'=>17,'s'=>18,'t'=>19,'u'=>20,'v'=>21,'w'=>22,'x'=>23,'y'=>24,'z'=>25}
$group = {}
$groups = 0
$smol = 0
$big = 0
$fuent = File.read("1ine.one").split

def lineValue(char)
    return "$vars['#{char}']" if $vars.include?char
    return $vals[char] if $vals.include?char
    return grouping($fuent[$big]) if char == "4"
end

def grouping(function) #function i detta fallet är en string från sourcekoden (fuent)
    $groups += 1
    #Kollar efter en 4 och en 8, adderar ihop allt inuti => replace med en temp variabel i hashen "group"
    tempPointer = $smol+1
    tempVar = 0
    while function[tempPointer] != "8"
        if function[tempPointer] != "4" && function[tempPointer] != "8"
            tempVar += Kernel.eval("#{lineValue(function[tempPointer])}")
        end
        tempPointer += 1
    end
    $group["grouping"+"#{$groups}"] = tempVar
    return "#{$group["grouping"+"#{$groups}"]}"
end

def loop(function) #function i detta fallet är en string från sourcekoden (fuent)
    loopPointer = $smol
end

#Pass för att konvertera variabler till Variables['¤'] Kolla på en operator, kolla sedan på tecknena bredvid den, konvertera till rubykod, kernel.eval
def line(fuent)
    $big = 0
    executed = false
    while $big < fuent.length
        $smol = 0
        fuent[$big].each_char do |char|
            Kernel.eval("#{lineValue(fuent[$big][$smol-1])}#{$ops[char]}#{lineValue(fuent[$big][$smol+1])}") if Hash[Array($ops)[0..3]].include?char #Basic Operations + Groupings
            Kernel.eval("#{$ops[char]}#{lineValue(fuent[$big][$smol+1])}") if Hash[Array($ops)[4..5]].include?char #P & Print

            
            $smol += 1
        end
        $big += 1
    end
end

line($fuent)

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


