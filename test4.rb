$vars = {'A'=>0,'B'=>0,'C'=>0,'D'=>0,'E'=>0,'F'=>0,'G'=>0,'H'=>0,'I'=>0,'J'=>0,'K'=>0,'L'=>0,'M'=>0,'N'=>0,'O'=>0,'P'=>0,'Q'=>0,'R'=>0,'S'=>0,'T'=>0,'U'=>0,'V'=>0,'W'=>0,'X'=>0,'Y'=>0,'Z'=>0}
$vals = {'a'=>0,'b'=>1,'c'=>2,'d'=>3,'e'=>4,'f'=>5,'g'=>6,'h'=>7,'i'=>8,'j'=>9,'k'=>10,'l'=>11,'m'=>12,'n'=>13,'o'=>14,'p'=>15,'q'=>16,'r'=>17,'s'=>18,'t'=>19,'u'=>20,'v'=>21,'w'=>22,'x'=>23,'y'=>24,'z'=>25}

# def lineValue(character)
#     if $vars.include?character
#         return "$vars['#{character}']"
#     elsif $vals.include?character
#         return $vals[character]
#     end
# end

def lineValue(char)
    p "$vars['#{char}']" if $vars.include?char
    p $vals[char] if $vals.include?char
    p "1+1" if char==0
    Kernel.eval("1+1") if char==1
end

lineValue('A')
lineValue(0)
p lineValue(1)