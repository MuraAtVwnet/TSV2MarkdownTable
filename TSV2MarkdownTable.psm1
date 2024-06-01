Function TSV2MarkdownTable(){
	[array]$TSVs = Get-Clipboard

	[Array]$ArrayCountData = $TSVs[0] -split "\t"
	$SeparatorCount = $ArrayCountData.Count

	[String]$Separator = ""

	for($i = 0; $i -lt $SeparatorCount; $i++){
		$Separator += "|--"
	}
	$Separator += "|"

	$FirsLoop = $true
	$MarkdownTable = @()

	foreach($TSV in $TSVs){
		if($TSV -ne [String]$null){
			$Temp = $TSV -replace "^", "|"
			$Temp = $Temp -replace "\t", "|"
			$Temp = $Temp -replace "$", "|"
			$Temp = $Temp -replace "\|\|", "| |"
			$Temp = $Temp -replace "\|\|", "| |"
			$Temp = $Temp -replace "\|\|", "| |"
			$Temp = $Temp -replace "\|\|", "| |"
   			$MarkdownTable += $Temp

			if($FirsLoop -eq $true){
				$MarkdownTable += $Separator
			}
			$FirsLoop = $false
		}
	}
	Set-Clipboard -Value $MarkdownTable
}
