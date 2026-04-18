#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <unistd.h>
#include <signal.h>

#define PORTNUMBER 12349

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

        while (1)
        {

            char c = 'A' + rand() % 26;
            int n = send(ns, &c, 1, MSG_NOSIGNAL);

            if (n <= 0)
            {
                printf("Cliente desconectado\n");
                break;
            }

            usleep(10000);
        }
        close(ns);
    }
}

int main(void)
{
    socket_service();
    exit(0);
}