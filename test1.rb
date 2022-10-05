file_data = File.read("1ine/1ine.txt").split

p file_data

$variables = {'A'=>0,'B'=>0,'C'=>0,'D'=>0,'E'=>0,'F'=>0}
$values = {'a'=>0,'b'=>1,'c'=>2,'d'=>3,'e'=>4,'f'=>5}

p Hash[Array($variables)[0..-1]].include?'D'
