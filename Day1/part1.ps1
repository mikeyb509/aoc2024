#$targetFile = "$psscriptroot\input.sample.txt"
$targetFile = "$psscriptroot\input.puzzle.txt"

$puzzleInput = get-content $targetFile

$leftList = @()
$rightList = @()

foreach($line in $puzzleInput){
    $parts = $line -split "\s+"
    
    $leftList += $parts[0]
    $rightList += $parts[1]
}

$leftList = $leftList | Sort-Object
$rightList = $rightList | Sort-Object

$totalDifference = 0

for($i = 0; $i -lt $leftList.count; $i++){
    $difference = [Math]::Abs($leftList[$i] - $rightList[$i])
    $leftEntry = $leftList[$i]
    $rightEntry = $rightList[$i]

    "Left entry ($leftEntry) is $difference away from Right entry ($rightEntry)"
    $totalDifference += $difference

    "`tRunning difference is: $totalDifference"
}

"`n--->Total difference is $totalDifference<---"