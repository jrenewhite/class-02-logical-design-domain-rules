Param(
  [Parameter(Position = 0)]
  [string]$ActivityName
)

function Show-Usage {
  Write-Host "Uso: .\scripts\run-activity.ps1 <activity-name>" -ForegroundColor Red
  exit 1
}

if (-not $ActivityName) {
  Show-Usage
}

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Resolve-Path (Join-Path $ScriptDir '..')
$ActivityDir = Join-Path $RepoRoot "activities/$ActivityName"
$SubmissionMd = Join-Path $ActivityDir 'submission.md'
$ReportMd = Join-Path $ActivityDir 'REPORT.md'
$ActualDir = Join-Path $ActivityDir 'actual'
$ValidationReport = Join-Path $ActualDir 'validation.txt'

function Require-File {
  param([string]$Path)
  if (-not (Test-Path $Path -PathType Leaf)) {
    Write-Host "ERROR: falta '$Path'." -ForegroundColor Red
    exit 1
  }
}

function Require-NonEmpty {
  param([string]$Path)
  if (-not ((Get-Item $Path).Length -gt 0)) {
    Write-Host "ERROR: '$Path' esta vacio." -ForegroundColor Red
    exit 1
  }
}

function Require-Section {
  param(
    [string]$Heading,
    [string]$Path
  )

  $pattern = '^##\s+' + [regex]::Escape($Heading) + '\s*$'
  if (-not (Select-String -Path $Path -Pattern $pattern -Quiet)) {
    Write-Host "ERROR: falta la seccion '## $Heading' en '$Path'." -ForegroundColor Red
    exit 1
  }
}

function Get-SectionText {
  param(
    [string]$Heading,
    [string]$Path
  )

  $lines = Get-Content $Path
  $target = "## $Heading"
  $collect = $false
  $buffer = New-Object System.Collections.Generic.List[string]

  foreach ($line in $lines) {
    if ($line -eq $target) {
      $collect = $true
      continue
    }
    if ($collect -and $line -match '^##\s+') {
      break
    }
    if ($collect) {
      $buffer.Add($line)
    }
  }

  return $buffer
}

function Count-MarkdownRows {
  param([string[]]$Lines)

  $rows = @(
    $Lines |
      Where-Object { $_ -match '^\|' } |
      Where-Object { $_ -notmatch '^\|[\s-]+\|' }
  )

  if ($rows.Count -ge 2) {
    return ($rows.Count - 1)
  }

  return 0
}

function Count-NonEmptyLines {
  param([string[]]$Lines)

  $rows = @($Lines | Where-Object { $_.Trim().Length -gt 0 })
  return $rows.Count
}

if (-not (Test-Path $ActivityDir -PathType Container)) {
  Write-Host "ERROR: no existe la actividad '$ActivityName'." -ForegroundColor Red
  exit 1
}

Require-File $SubmissionMd
Require-File $ReportMd
Require-NonEmpty $SubmissionMd
Require-NonEmpty $ReportMd
New-Item -ItemType Directory -Force -Path $ActualDir | Out-Null

switch ($ActivityName) {
  'class-activity-01' {
    Require-Section 'Entidades' $SubmissionMd
    Require-Section 'Relaciones' $SubmissionMd

    $entities = Count-MarkdownRows (Get-SectionText 'Entidades' $SubmissionMd)
    $relations = Count-MarkdownRows (Get-SectionText 'Relaciones' $SubmissionMd)

    if ($entities -lt 4) {
      Write-Host "ERROR: se esperaban al menos 4 entidades; se encontraron $entities." -ForegroundColor Red
      exit 1
    }
    if ($relations -lt 3) {
      Write-Host "ERROR: se esperaban al menos 3 relaciones; se encontraron $relations." -ForegroundColor Red
      exit 1
    }

    @(
      "Actividad: $ActivityName"
      "Entidades detectadas: $entities"
      "Relaciones detectadas: $relations"
      "Estado: validacion publica aprobada"
    ) | Set-Content -Encoding UTF8 $ValidationReport
  }
  'class-activity-02' {
    Require-Section 'Reglas' $SubmissionMd
    Require-Section 'Regla más importante' $SubmissionMd

    $rules = Count-MarkdownRows (Get-SectionText 'Reglas' $SubmissionMd)
    $important = Count-NonEmptyLines (Get-SectionText 'Regla más importante' $SubmissionMd)

    if ($rules -lt 5) {
      Write-Host "ERROR: se esperaban al menos 5 reglas; se encontraron $rules." -ForegroundColor Red
      exit 1
    }
    if ($important -lt 1) {
      Write-Host "ERROR: la seccion 'Regla mas importante' no debe estar vacia." -ForegroundColor Red
      exit 1
    }

    @(
      "Actividad: $ActivityName"
      "Reglas detectadas: $rules"
      "Regla más importante: presente"
      "Estado: validacion publica aprobada"
    ) | Set-Content -Encoding UTF8 $ValidationReport
  }
  'home-activity' {
    Require-Section 'Reglas extendidas' $SubmissionMd
    Require-Section 'Reflexión final' $SubmissionMd

    $rules = Count-MarkdownRows (Get-SectionText 'Reglas extendidas' $SubmissionMd)
    $reflection = Count-NonEmptyLines (Get-SectionText 'Reflexión final' $SubmissionMd)

    if ($rules -lt 8) {
      Write-Host "ERROR: se esperaban al menos 8 reglas; se encontraron $rules." -ForegroundColor Red
      exit 1
    }
    if ($reflection -lt 1) {
      Write-Host "ERROR: la seccion 'Reflexión final' no debe estar vacia." -ForegroundColor Red
      exit 1
    }

    @(
      "Actividad: $ActivityName"
      "Reglas extendidas detectadas: $rules"
      "Reflexión final: presente"
      "Estado: validacion publica aprobada"
    ) | Set-Content -Encoding UTF8 $ValidationReport
  }
  default {
    Write-Host "ERROR: actividad no soportada '$ActivityName'." -ForegroundColor Red
    exit 1
  }
}

Write-Host "OK: $ActivityName -> $ValidationReport"
