#################################################################################
### OBJETIVO : MONITORAMENTO DOS SERVIÇOS TOTVS - V 1.01
### AUTOR    : CLAUDEMIR DOS SANTOS (TEC-TRS) - claudems@bol.com.br
### DATA     : JAN/2021
### ALTERACAO:
### 17/02/21 - CORREÇÃO DE UM PROBLEMA QUANDO O SERVIÇO ESTA FORA RETORNA ERRO NO PS
#################################################################################
Param(
  [string]$opcao,
  [string]$2
)



IF ( $opcao -eq 'MEMORIAPROC' ) # Memoria usada no processo (atual)
	{
		
		$service = Get-CimInstance -class win32_service | Where-Object name -eq $2 | select name,processid
		$process = Get-Process | Where-Object ID -EQ $service.processid
		
		IF ($process.ID -NE 0)
		{
		  $memoriaproc= [math]::Round(($process.workingSet /1MB),2)
		}
		ELSE 
		{
		  $memoriaproc = 0
		}
		$memoriaproc
		
	}

IF ( $opcao -eq 'PIDPROC' ) # PID do processo 
	{
		$service = Get-CimInstance -class win32_service | Where-Object name -eq $2 | select name,processid
		$process = Get-Process | Where-Object ID -EQ $service.processid
		
		
		IF ($process.ID -NE 0)
		{
		  $pidproc=$process.id
		}
		ELSE 
		{
		  $pidproc = 0
		}
		$pidproc
		
	}

IF ( $opcao -eq 'TEMPONOAR' ) # tempo em sengudos que o processo esta no ar
	{
		$service = Get-CimInstance -class win32_service | Where-Object name -eq $2 | select name,processid
		$process = Get-Process | Where-Object ID -EQ $service.processid
			
		IF ($process.ID -NE 0)
		{
		  $temponoar=get-wmiobject Win32_PerfFormattedData_PerfProc_Process | where-object idprocess -eq $process.ID | select-object -ExpandProperty ElapsedTime
		}
		ELSE 
		{
		 $temponoar = 0
		}
		$temponoar
		
	}

IF ( $opcao -eq 'PERCENTCPU' ) # pewrcentual de cpu usada pelo processo 
	{
		$cpucores   = (Get-WMIObject Win32_ComputerSystem).NumberOfLogicalProcessors
		$service    = Get-CimInstance -class win32_service | Where-Object name -eq $2 | select name,processid
		$process    = Get-Process | Where-Object ID -EQ $service.processid
		
		
		IF ($process.ID -NE 0)
		{
		  $cpu        = get-wmiobject Win32_PerfFormattedData_PerfProc_Process | where-object idprocess -eq $process.ID | select-object -ExpandProperty PercentProcessorTime
		$percentcpu = [Decimal]::Round(($cpu / $cpucores),2)
		}
		ELSE 
		{
		 $percentcpu = 0
		}
		 $percentcpu
	  
	}






