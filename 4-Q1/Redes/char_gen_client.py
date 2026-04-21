import socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('localhost', 12350))
s.sendall("20 10".encode())
resultado = s.recv(64).decode()
print(resultado)
s.close()