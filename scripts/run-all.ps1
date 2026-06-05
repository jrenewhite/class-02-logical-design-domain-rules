Param()

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Resolve-Path (Join-Path $ScriptDir '..')

$activities = @(
  'class-activity-01',
  'class-activity-02',
  'home-activity'
)

foreach ($activity in $activities) {
  Write-Host ''
  Write-Host '=================================================='
  Write-Host "Validando: $activity"
  Write-Host '=================================================='
  & "$RepoRoot/scripts/run-activity.ps1" $activity
  if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
  }
}

Write-Host ''
Write-Host 'OK: todas las actividades pasaron la validacion publica.'
