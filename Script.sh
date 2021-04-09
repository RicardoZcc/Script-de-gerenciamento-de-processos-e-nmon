#!/bin/bash 
#
menunmon(){ # Inicia a fun��o
clear # limpa a tela
echo "1) CPU" # exibe uma cadeia de caracteres na tela
echo "2) Memória" # exibe uma cadeia de caracteres na tela
echo "3) Discos" # exibe uma cadeia de caracteres na tela
echo "4) Kernel" # exibe uma cadeia de caracteres na tela
echo "5) Filesystem" # exibe uma cadeia de caracteres na tela
echo "6) Retornar ao menu principal" # exibe uma cadeia de caracteres na tela
echo "7) Sair do Script" # exibe uma cadeia de caracteres na tela
echo "Digite o número da opção :" # solicita uma entrada ao usuario
read opt2  # l� a op��o escolhida pelo usuario

case $opt2 in # inicia o comando case com a variavel opt2 como parametro
	1) export NMON=c ;nmon ;menunmon ;; # Exporta a op��o CPU do NMON, limpa a tela e e chama a fun��o menunmon
	2) export NMON=m ;nmon ;menunmon ;; # Exporta a op��o Memoria do NMON, limpa a tela e e chama a fun��o menunmon
	3) export NMON=d ;nmon ;menunmon ;; # Exporta a op��o Discos do NMON, limpa a tela e e chama a fun��o menunmon
	4) export NMON=k ;nmon ;menunmon ;; # Exporta a op��o Kernel do NMON, limpa a tela e e chama a fun��o menunmon
	5) export NMON=j ;nmon ;menunmon ;; # Exporta a op��o Filesystem do NMON, limpa a tela e e chama a fun��o menunmon
	6) menu1 ;; #Chama a fun��o menu1
	7) clear;exit ;; #limpa a tela e sai do script
	*) echo -e "\n opção invalida" ; sleep 2 ; menunmon ; #informa ao usuario que a op��o selecionada estava incorreta, deixa essa mensagem durante dois segundo e volta � fun��o menunmon
esac  # fecha o comando case
} 
#
listagem () { # inicia a fun��o listagem
clear # limpa a tela
if [ $user -eq 0 ]; then # estabelece uma condi��o que verifica se a variavel user � igual a zero (se o usuario � ou n�o � o root), se for verdadeiro ent�o ...
	ps aux | less # demonstra uma listagem longa dos processos, dentro e fora do terminal, de todos os usuarios
else # caso a seja falso...
	me=$(whoami) #i dentifica quem � o usuario do script e armazena na variavel me
	ps -u $me | less # demonstra todos os processos do usuario que esta executando o script
fi # finaliza o comando if
} # finaliza a fun��o
#
mpid () { # inicia a fun��o mpid
echo "Informe o PID do processo à ser eliminado" # solicita uma entrada ao usuario
read pidk # l� a informa��o forenecida pelo usuario
 kill $pidk # envia um comando para matar o processo com o pid informado pelo usuario
sleep 3
} # finaliza a fun��o
#
mnome () { # inicia a fun��o mnome
echo "informe o nome do processo" # solicita uma entrada ao usuario
read nomek # l� a informa��o forenecida pelo usuario
killall $nomek # envia um comando para matar o processo com o nome informado pelo usuario
sleep 3
} # finaliza a fun��o
#
matar () { # inicia a fun��o
clear # limpa a tela
	echo "Matar um processo" # exibe uma cadeia de caracteres
	echo "1.Matar pelo PID" # exibe uma cadeia de caracteres
	echo "2.Matar pelo nome" # exibe uma cadeia de caracteres
	echo "3.Listar os processos novamente" # exibe uma cadeia de caracteres
	echo "4.Voltar ao menu anterior" # exibe uma cadeia de caracteres
	echo "Digite o número da opção :" # solicita uma entrada ao usuario
read opt4 # l� a op��o escolhida pelo usuario

case $opt4 in # inicia o comando case com a variavel opt4 como parametro
	1) listagem ; mpid ; matar ;; # chama a fun��o listagem, seguida da fun��o mpid e logo apos volta a fun��o matar
	2) listagem ; mnome ; matar ;; # chama a fun��o listagem, seguida da fun��o mnome e logo apos volta a fun��o matar
	3) listagem ; matar ;; # chama a fun��o listagem e volta � fun��o matar
	4) menuproc ;; # retorna � fun��o anterior, menuproc
	*) echo -e "\n opção invalida" ; sleep 2 ; matar ;; #informa ao usuario que a op��o selecionada estava incorreta, deixa essa mensagem durante dois segundo e volta � fun��o matar
esac # finaliza o comando case
} # finaliza a fun��o
#
listagem1 () { # inicia a fun��o listagem1
clear # limpa a tela
if [ $user -eq 0 ]; then # estabelece uma condi��o que verifica se a variavel user � igual a zero (se o usuario � ou n�o � o root), se for verdadeiro ent�o ...
	ps -elf | less # demonstra uma listagem longa dos processos, dentro e fora do terminal, de todos os usuarios, assim como suas respectivas prioridades
else # caso a seja falso...
	 ps -lx | less # demonstra todos os processos do usuario que esta executando o script
fi # finaliza o comando if
} # finaliza a fun��o
#
modif () { # inicia a fun��o modif
clear # limpa a tela
if [ $user -eq 0 ]; then # estabelece uma condi��o que verifica se a variavel user � igual a zero (se o usuario � ou n�o � o root), se for verdadeiro ent�o ...
echo "a prioridade processos dos processos podem ser acrescentadas ou decrementadas de -20 a 19, sendo -20 a maior prioridade" # exibe uma cadeia de caracteres na tela
echo "informe o pid do processo:"  # solicita uma entrada ao usuario
read pid2 # l� a informa��o fornecida pelo usuario
echo "informe o numero de modifica��o de prioridade do processo" # solicita uma entrada ao usuario
read pri # l� a informa��o fornecida pelo usuario
renice $pri $pid2 # executa o comando para modificar a prioridade do processo de acordo com os parametros fornecidos pelo usuario
sleep 3 # a tela permanece estatica por tres segundos
else # caso a seja falso...
echo "a prioridade processos dos processos podera ser acrescentada ou decrementada de 0 a 19, sendo 0 a maior prioridade" # exibe uma cadeia de caracteres na tela
echo "informe o pid do processo:"  # solicita uma entrada ao usuario
read pid2 # l� a informa��o fornecida pelo usuario
echo "informe o numero de modifica��o de prioridade do processo" # solicita uma entrada ao usuario
read pri # l� a informa��o fornecida pelo usuario
renice $pri $pid2 # executa o comando para modificar a prioridade do processo de acordo com os parametros fornecidos pelo usuario
sleep 3 # a tela permanece estatica por tres segundos	 
fi # finaliza o comando if

} # finaliza a fun��o
#
prior () { # inicia a fun��o prior
clear # limpa a tela
echo "1.listar a prioridade dos processos"  # exibe uma cadeia de caracteres na tela
echo "2.modificar a prioridade de um processo"  # exibe uma cadeia de caracteres na tela
echo "3.voltar ao menu anterior"  # exibe uma cadeia de caracteres na tela
echo "Digite o número da opção :"  # solicita uma entrada ao usuario
read opt3 # l� a op��o escolhida pelo usuario

case $opt3 in # inicia o comando case com a variavel opt3 como parametro
	1) listagem1 ; prior ;; # chama a fun��o listagem1 seguida da fun��o prior
	2) listagem1; modif ; prior ;; # chama a fun��o modif seguida da fun��o prior
	3) menuproc ;; # chama a fun��o menuproc para voltar ao menu anterior
	*) echo "comando invalido" ; sleep 2 ; prior ; # informa ao usuario que a op��o selecionada estava incorreta, deixa essa mensagem durante dois segundo e volta � fun��o prior
esac # encerra o comando case
} # finaliza a fun��o
#
menuproc(){ # inicia a fun��o menuproc
clear # limpa a tela
echo "Menu Processos"  # exibe uma cadeia de caracteres na tela
echo "1) Verificar todos os processos"  # exibe uma cadeia de caracteres na tela
echo "2) Mudar prioridade de um processo em execução"  # exibe uma cadeia de caracteres na tela
echo "3) matar um processo"  # exibe uma cadeia de caracteres na tela
echo "4) Voltar ao Menu Principal"  # exibe uma cadeia de caracteres na tela
echo "5) Sair do Script"  # exibe uma cadeia de caracteres na tela
echo "Digite o número da opção :"  # solicita uma entrada ao usuario
read opt1 # l� a op��o escolhida pelo usuario

case $opt1 in # inicia o comando case com a variavel opt como parametro
	1) listagem; menuproc;; # executa a fun��o listagem e em seguida chama a fun��o menuproc
	2) prior;; # executa a fun��o prior
	3) matar;; # executa a fun��o matar 
	4) menu1;; # volta ao menu anterior ao chamar a fun��o menu1
	5) clear; exit;; # limpa a tela e encerra o script
	*) echo "Opçao invalida, digite novamente"; sleep 2; menuproc;; # informa ao usuario que a op��o selecionada estava incorreta, deixa essa mensagem durante dois segundo e volta � fun��o menuproc
esac # encerra o comando case
}  # finaliza a fun��o
#
menu1(){ # inicia a fun��o menu1
clear # limpa a tela
echo "Menu Principal " # exibe uma cadeia de caracteres na tela
echo "1) Menu NMON" # exibe uma cadeia de caracteres na tela
echo "2) Gerenciamento de Processos" # exibe uma cadeia de caracteres na tela
echo "3) Finalizar o script" # exibe uma cadeia de caracteres na tela
echo "Digite o número da opção :"  # solicita uma entrada ao usuario
read opt # l� a op��o escolhida pelo usuario

case $opt in # inicia o comando case com a variavel opt como parametro 
	1) menunmon;; # executa a fun��o menunmon
	2) menuproc;; # executa a fun��o menuproc
	3) exit;; # limpa a tela e sai do script
	*) echo "Opçao invalida, digite novamente"; sleep 2; menu1;;  # informa ao usuario que a op��o selecionada estava incorreta, deixa essa mensagem durante dois segundo e volta � fun��o menu1
esac # encerra o comando case
} # finaliza a fun��o 
#
verific() { # inicia a fun��o verific
user=$(id -u) # atribui o pid do usuario do script em uma variavel
clear # limpa a tela

if [ $user -eq 0 ];then # # estabelece uma condi��o que verifica se a variavel user � igual a zero (se o usuario � ou n�o � o root), se for verdadeiro ent�o ...
 	echo "Voce possui privelegios de superusuario" # informa o usuario que ele possui privelegios de root
else
 	echo "Voce possui privelegios de um usuario comum" # informa ao usuario que ele possui privilegios de usuarios comuns
fi # encerra o comando fi

sleep 1 # congela a tela por 1 segundo
echo "Deseja continuar?(S/N)" # solicita que o usuario forne�a um dado de entrda
read resp # l� a informa��o fernecida pelo usuario
while [ $resp != S ] && [ $resp != N ] # enquanto o dado fornecido pelo usuario estiver dentro dos parametros estabelecidos, um loop sera mantido
 do # fa�a...
 	clear # limpa a tela
 	echo "letra invalida Digite novamente(S/N) " # soliciata novamenta que o usuario forne�a um dado de entrda
 	read resp # # atribui esse dado novamente � variavel resp
done # termnia o loop

if [ $resp = S ];then # se o valor da variavel for igual a S...
 	menu1 # chama a fun��o menu1
if [ $resp = N ];then # se o valor da variavel for igual a N...
 	exit # encerra o script
fi # finaliza o comando if
fi # finaliza o comando if
} # finaliza a fun��o
verific # da inicio ao script chamando a fun��o verifc
