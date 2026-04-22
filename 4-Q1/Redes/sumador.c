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
    int bind_res = bind(s, (struct sockaddr *)&direcc, len);

    if (bind_res < 0)
    {
        perror("bind");
        exit(1);
    }
    listen(s, 5);

    while (1)
    {
        len = sizeof(struct sockaddr_in);
        ns = accept(s, (struct sockaddr *)&direcc, &len);
        printf("Cliente conectado. Leyendo mensaje\n");

        char buffer[64];

        int mensaje_cliente = recv(ns, buffer, sizeof(buffer) - 1, 0);

        if (mensaje_cliente <= 0)
        {
            printf("Error al recibir mensaje del cliente.\n");
            close(ns);
            continue;
            buffer[mensaje_cliente] = '\0';
        }

        printf("Mensaje recibido: %s\n", buffer);

        int n1, n2;
        int result_scan = sscanf(buffer, "%d %d", &n1, &n2);

        if (result_scan != 2)
        {
            char msg[] = "Parámetros incorrectos.\n";
            printf("%s", msg);

            send(ns, msg, sizeof(msg), MSG_NOSIGNAL);
            close(ns);
            continue;
        }

        printf("Enviando resultado de la suma\n");
        int suma = n1 + n2;

        char sumaString[64];
        sprintf(sumaString, "%d\n", suma);

        int result_send = send(ns, sumaString, sizeof(sumaString), MSG_NOSIGNAL);

        if (result_send <= 0)
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