#!/bin/bash

#primeiramente verifica se o pacote Net stat está instalado.
#Para fazer isso verificamos a existência do ping e traceroute também, pois somente o pacote netstat pode já estar instalado
#assim, estando o pacote corrompido.
if command -v netstat >/dev/null 2>&1 && \
   command -v ping >/dev/null 2>&1 && \
   command -v traceroute >/dev/null 2>&1; then
   echo "O pacote Net tools está completamente instalado"
else
    echo "instalando o pacote Net tools:"
    sudo apt-get update
    sudo apt-get -y install net-tools
    sudo apt install traceroute
    #sudo apt-get -y upgrade
fi



#verificar o gateway
function gateway(){
    gateway=$(command ip route show | awk '/default/ {print $3}') #Nessa parte pedi ajuda ao chatgpt. Mas essencialmente
#quando digitamos o comando ip route show, é mostrada várias rotas. e a rota default é o endereço do roteador.


echo "Gateway padrão: $gateway"
opcoes
}



function ping(){
    echo "Digite o endereço IP para realizar o Ping: "
    read ip_ping

if [[ $ip_ping =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then #verificação do ip(se ele é ipv4)
    command ping -c 5 $ip_ping #o parametro -c é para indicar que serão enviados 4 pacotes icmp e o cat é para exibir a saída na tela
    opcoes
else
echo "O endereço IP $ip_ping é inválido"
echo "Voltando para a tela inicial"
    opcoes 
fi
}




function traceroute(){
echo "Agora iremos verificar as rotas que o comando traceroute"
read -p "Insira o endereço IP de destino: " ip_destino
if [[ $ip_destino =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then #verificação do ip(se ele é ipv4)
    command traceroute $ip_destino 
    opcoes 
else
    echo "O endereço IP $ip_destino é inválido"
    echo "Voltando para a tela inicial"
    opcoes 
fi
}

function opcoes(){
    echo "Digite (1) para ping"
    echo "Digite (2) para traceroute"
    echo "Digite (3) para saber qual o gateway"
    echo "Digite (4) para sair ou pressione Cntrl+c"
    echo "Digite o número escolhido: "
    read  valor

    if [ $valor -eq 0 ]; then
        opcoes
    fi

    if [ $valor -eq 1 ]; then
        ping
    fi
    if [ $valor -eq 2 ]; then
        traceroute
    fi
    if [ $valor -eq 3 ]; then
        gateway
    fi
    if [ $valor -eq 4 ]; then
        echo "fechando o programa"
        exit 0 #saída do código
    fi

}
opcoes #chamada da funcao opcoes


