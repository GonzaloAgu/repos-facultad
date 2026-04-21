#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <unistd.h>
#include <signal.h>

#define PORTNUMBER 12350

void socket_service(void)
{
    srand(time(NULL));
    char buf[10];
    int s, n, ns, len;
    struct sockaddr_in direcc;
    s = socket(AF_INET, SOCK_STREAM, 0);

    int opt = 1;
    setsockopt(s, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(opt));

    bzero((char *)&direcc, sizeof(direcc));

    direcc.sin_family = AF_INET;
    direcc.sin_port = htons(PORTNUMBER);
    direcc.sin_addr.s_addr = htonl(INADDR_ANY);
    len = sizeof(struct sockaddr_in);
    bind(s, (struct sockaddr *)&direcc, len);
    listen(s, 5);

    while (1)
    {
        len = sizeof(struct sockaddr_in);
        ns = accept(s, (struct sockaddr *)&direcc, &len);

        char buffer[64];

        int mensaje_cliente = recv(ns, &buffer, sizeof(buffer) - 1, MSG_WAITALL);
        buffer[mensaje_cliente] = '\0';

        if (mensaje_cliente <= 0)
        {
            printf("Error al recibir mensaje del cliente.\n");
            close(ns);
            continue;
        }

        int n1, n2;
        int result_scan = sscanf(buffer, "%d %d", &n1, &n2);

        if (result_scan != 2)
        {
            printf("Cantidad de parámetros incorrecta.\n");
            close(ns);
            continue;
        }
        int suma = n1 + n2;
        int result_send = send(ns, &suma, sizeof(int), MSG_NOSIGNAL);

        if (n <= 0)
        {
            printf("Error al enviar la respuesta al cliente.\n");
        }
        close(ns);
    }
}

int main(void)
{
    socket_service();
    exit(0);
}