TSV を Markdown の Table に変換する

■ これは何?
ちょっと大きめの Markdown Table を手で書こうとすると、列が抜けたりとか何かと面倒なので、Excel のセルをコピーした TSV を Markdown Table に変換する PowerShell スクリプトです

■ 使い方
Markdown Table に変換したい表形式を Excel で作成し、クリップボードにコピーします
TSV2MarkdownTable を実行すると、クリップボードにセットされた TSV を Markdown Table 形式に変換し、クリップボードにセットします
(tsv2[TAB]で補完されます)

そのまま Markdown ドキュメントにペーストすれば表が作成できます

ヘッダー付きの前提で作成しているので、ヘッダーが不要な時はセパレーターを削除して下さい


■ Online Install 方法
以下コマンドを PowerShell プロンプトにコピペして下さい

$ModuleName = "TSV2MarkdownTable"
$GitHubName = "MuraAtVwnet"
Invoke-WebRequest -Uri https://raw.githubusercontent.com/$GitHubName/$ModuleName/master/OnlineInstall.ps1 -OutFile ~/OnlineInstall.ps1
& ~/OnlineInstall.ps1


■ リポジトリから Pull した場合の Install 方法
install.ps1 を実行してください

■ Uninstall 方法
Online でインストールした場合は ~/UnInstallTSV2MarkdownTable.ps1 を実行して下さい

リポジトリから Pull した場合は uninstall.ps1 を実行して下さい
(問い合わせが来たら Enter)

■ バージョンチェック
最新版がリポジトリにある場合は、-VertionCheck オプションでチェック & 更新します

PS C:\> TSV2MarkdownTable -VertionCheck

■ 動作確認環境
PowerShell 5.1
PowerShell 7.5.0


■ Web サイト
PowerShell で TSV を Markdown の Table に変換する
https://www.vwnet.jp/windows/PowerShell/2024030101/TSV2MarkdownTable.htm


■ リポジトリ
GitHub で公開しているので、最新版が欲しい方はこちらから Clone してください。

https://github.com/MuraAtVwnet/TSV2MarkdownTable
git@github.com:MuraAtVwnet/TSV2MarkdownTable.git



