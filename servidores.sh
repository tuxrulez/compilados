#!/bin/bash
clear
bold=`tput bold`
normal=`tput sgr0`
TITULO=`echo  -e "\033[33;5mLISTA DE SERVIDORES\033[0m"`
echo "


	${TITULO}:
		1 - ${bold}Condor${normal}
		2 - ${bold}Cencosud${normal}
		3 - ${bold}Centauro Esportes${normal}
		4 - ${bold}Dia${normal}
		5 - ${bold}Muffato${normal}
		6 - ${bold}Armazem Paraiba${normal}
		7 - ${bold}Agiplan${normal}
		----------- "
echo -n "	Qual servidor: "; read srv
echo -n "	Qual usuario: "; read user

case $srv in 
	1) echo "Acesso ao Condor: "
	ssh -l $user 200.150.68.28
;;
	2) echo "Acesso ao Cencosud: "
	ssh -l $user 200.199.115.234
;;
	3) echo "Acesso ao Centauro: "
	ssh -l $user 200.182.6.122
;;
	4) echo "Acesso ao Dia: "
	ssh -l $user 179.184.210.98 -p 2223
;;
	5) echo "Acesso ao Muffato: "
	ssh -l $user 187.95.103.130
;;
	6) echo "Acesso ao Armazem Paraiba: "
	ssh -l $user 179.124.130.8
;;
	7) echo "Acesso a Agiplan: "
x=`ping 192.168.0.238 -c1`
if [ $? == "1" ]; then
	clear
	echo  "${bold}ERRO ERRO ERRO ERRO${normal}"
	echo -e "\e[31m verifique se ha:
			1 - rota padrao para a rede: route add -net 192.168.0.0/24 gw 172.16.37.1
			2 - verifique se o IP eth0:0 : ifconfig eth0:0 172.16.37.1 netmask 255.255.255.248
			3 - reinicie o ipsec
			4 - chame o Gil <gildecio@gmail.com> \e[m"
else
	ssh -l $user 192.168.0.238
fi
;;
	*) echo "Erro"
	exit 0
;;
esac
