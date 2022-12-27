import socket
import sys


#parametros de servidor
enderecoservidor = '127.0.0.1'
portaservidor = 1200

#criando socket do cliente

sockl = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)# o AF_INET é o IPV4 e o SOCK_DGRAM representa o UDP
mensagem = (b'oi')

sockl.sendto(mensagem,(enderecoservidor,portaservidor))
mensagemodificada = sockl.recvfrom(2048)
print(f'recebido{mensagemodificada!r}')
sockl.close()