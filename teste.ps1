$AUTORES = 1..72
$LIVROS = 1..372

# Write-Output $($AUTORES | Get-Random -Shuffle) > .\teste.sql
Write-Output $LIVROS | Get-Random  -Count 72 > .\teste.sql
