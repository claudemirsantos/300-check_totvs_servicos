#### CONFIGURAR AS INFORMAÇÕES DOS SERVIÇOS TOTVS A SEREM MONITORADOS
#### TOMAR CUIDADO COM O CAMINHO NAO PODE TER \ E DEVE SER / (DARA ERRO DE JSON SE COLOCAR \)
#### A ULTIMA LINHA DO write-host NO FIM NAO DEVE TER ,
#### CASO PRECISE COLOCAR MAIS LINHAS COPIE A PRIMEIRA LINHA E INCLUA NO MEIO

#################################################################################
### OBJETIVO : MONITORAMENTO DOS SERVIÇOS TOTVS - V 1.01
### AUTOR    : CLAUDEMIR DOS SANTOS (TEC-TRS) - claudems@bol.com.br
### DATA     : JAN/2021
### ALTERACAO:
### 17/02/21 - CORREÇÃO DE UM PROBLEMA DE FORMATACAO DO JSON
#################################################################################


write-host "{"

write-host " `"data`":[`n"
write-host '{ "{#PORTA}":"7800" , "{#DESCITEM}":"01-DBACESS64"   ,"{#NOMESERVICO}":"01-DBACESS64"  , "{#ARQCONF}":"C:/totvs/produtos/DbAccess64/dbaccess.ini"}        ,'
write-host '{ "{#PORTA}":"8080" , "{#DESCITEM}":"05-TSS"         ,"{#NOMESERVICO}":"05-TSS"        , "{#ARQCONF}":"C:/totvs/produtos/TSS/bin/appserver/appserver.ini"} '
write-host "]}"