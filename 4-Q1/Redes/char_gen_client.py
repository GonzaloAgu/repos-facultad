import socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('localhost', 12349))
while True:
    data = s.recv(16)
    if not data:
      print("Desconectado")
      break
    print(data.decode(), end='')
s.close()