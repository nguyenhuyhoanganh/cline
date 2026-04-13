param()

$inputJson = [Console]::In.ReadToEnd()
if ([string]::IsNullOrWhiteSpace($inputJson)) {
  [Console]::Out.WriteLine('{"cancel":false}')
  exit 0
}

try {
  $event = $inputJson | ConvertFrom-Json
} catch {
  [Console]::Out.WriteLine('{"cancel":false}')
  exit 0
}

$projectRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..")
$skillPath = Join-Path $projectRoot ".cline\skills\using-superpowers\SKILL.md"

if (-not (Test-Path $skillPath)) {
  [Console]::Out.WriteLine('{"cancel":false}')
  exit 0
}

$skillContent = Get-Content -Raw $skillPath
$context = @"
<EXTREMELY_IMPORTANT>
You have superpowers.

Below is the full content of your 'using-superpowers' skill - your introduction to using skills.

$skillContent
</EXTREMELY_IMPORTANT>
"@

$result = @{
  cancel = $false
  contextModification = $context
} | ConvertTo-Json -Depth 8 -Compress

[Console]::Out.WriteLine($result)
