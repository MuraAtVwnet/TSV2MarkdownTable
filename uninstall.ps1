# Module Name
$ModuleName = "TSV2MarkdownTable"

# Module Path
$ModulePath = Join-Path (Split-Path $PROFILE -Parent) "Modules"
$RemovePath = Join-Path $ModulePath $ModuleName

# Remove Direcory
if( Test-Path $RemovePath ){
	Remove-Item $RemovePath -Force -Recurse
}
