Function TSV2MarkdownTable([switch]$VertionCheck){

	# バージョンチェックとオンライン更新
	if( $VertionCheck ){
		$ModuleName = "TSV2MarkdownTable"
		$GitHubName = "MuraAtVwnet"

		$Module = $ModuleName + ".psm1"
		$Vertion = "Vertion" + $ModuleName + ".txt"
		$VertionTemp = "VertionTemp" + $ModuleName + ".tmp"

		$Update = $False

		if( -not (Test-Path ~/$Vertion)){
			$Update = $True
		}
		else{
			# 現在のバージョン
			$LocalVertion = Get-Content -Path ~/$Vertion

			# ローカルにリポジトリに置いてあるバージョン管理ファイルをダウンロードし読み込む
			Invoke-WebRequest -Uri https://raw.githubusercontent.com/$GitHubName/$ModuleName/master/Vertion.txt -OutFile ~/$VertionTemp
			$NowVertion = Get-Content -Path ~/$VertionTemp
			Remove-Item ~/$VertionTemp

			# バージョン チェック
			if( $LocalVertion -ne $NowVertion ){
				$Update = $True
			}
		}

		if( $Update ){
			Write-Output "最新版に更新します"
			Write-Output "更新完了後、PowerShell プロンプトを開きなおしてください"
			Invoke-WebRequest -Uri https://raw.githubusercontent.com/$GitHubName/$ModuleName/master/OnlineInstall.ps1 -OutFile ~/OnlineInstall.ps1
			& ~/OnlineInstall.ps1
			Write-Output "更新完了"
			Write-Output "PowerShell プロンプトを開きなおしてください"
		}
		else{
			Write-Output "更新の必要はありません"
		}
		return
	}

	############ 本来の処理


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
			while($Temp -match "\|\|"){
				$Temp = $Temp -replace "\|\|", "| |"
			}
			$MarkdownTable += $Temp

			if($FirsLoop -eq $true){
				$MarkdownTable += $Separator
			}
			$FirsLoop = $false
		}
	}
	Set-Clipboard -Value $MarkdownTable
}
