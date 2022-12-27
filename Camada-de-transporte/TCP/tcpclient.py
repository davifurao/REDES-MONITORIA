import socket

ip_host = '127.0.0.1'
porta = 3000

s= socket.socket(socket.AF_INET, socket.SOCK_STREAM)

s.connect(ip_host,porta)
s.sendall(b'opa')
mensagem = s.recv(1024)

print(f'respondido{mensagem!r}')

s.close(s)