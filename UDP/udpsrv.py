import socket

ip = '127.0.0.1'
portaservidor = 1200
escutando = (ip,portaservidor)
socksrv = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)


socksrv.bind(escutando)
print(f'pronto para escutar')

while(True):
    mensagem, enderecocliente = socksrv.recvfrom(2048)

    mensagemmodificada = mensagem.upper()
    socksrv.sendto(mensagemmodificada,enderecocliente)
