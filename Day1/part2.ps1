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

$rightListString = $rightList -join "-"

$similarityScore = 0

foreach($num in $leftList){
    $m = [regex]::matches($rightListString, $num)

    $instanceSimiliarity = [int32]$num * ($m.count)
    $similarityScore += $instanceSimiliarity
    
    "Left number ($num) was found $($m.count) times in right list"
    "`tInstance similarity score is: $instanceSimiliarity | Running total: $similarityScore"
}

"`n--->Total similarity score is $similarityScore<---"