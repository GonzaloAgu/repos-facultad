#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <arpa/inet.h>
#include <stdlib.h>

#define PORTNUMBER 12350
int main(int argc, char *argv[])
{
    if (argc != 3)
    {
        printf("Deben enviarse dos parametros\n");
        printf("Ej: ./suma_client 3 2");
        exit(0);
    }

    int s;
    struct sockaddr_in servidor;

    s = socket(AF_INET, SOCK_STREAM, 0);

    servidor.sin_family = AF_INET;
    servidor.sin_port = htons(PORTNUMBER);
    servidor.sin_addr.s_addr = inet_addr("127.0.0.1");

    connect(s, (struct sockaddr *)&servidor, sizeof(servidor));

    char msg[64];
    sprintf(msg, "%s %s", argv[1], argv[2]);

    printf("Enviando mensaje: %s\n", msg);
    send(s, msg, 64, 0);

    char resultado[64];
    recv(s, resultado, sizeof(resultado), 0);

    printf("Resultado: %s\n", resultado);

    close(s);
    return 0;
}