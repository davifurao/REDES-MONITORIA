import socket

ip_host = '127.0.0.1'
porta = 3000

s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)


s.bind({ip_host,porta})

s.listen()
conexao,endereco = s.accept()
with conexao:
    print(f'conectado com {endereco}')
    while True:
        mensagem = conexao.recv(1024)
        if not mensagem:
            break
        conexao.sendall(mensagem)