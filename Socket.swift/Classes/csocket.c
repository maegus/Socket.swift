//
//  csocket.c
//  Pods
//
//  Created by Draveness on 15/03/2017.
//
//

#include <stdio.h>

#include <sys/socket.h>
#include <netinet/in.h>
#include <string.h>
#include <arpa/inet.h>
#include <unistd.h>

int csocket_connect(int fd, const char *host, int port) {
    int status = 0;
    struct sockaddr_in serv_addr;
    memset(&serv_addr, '0', sizeof(serv_addr));

    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(port);
    status = inet_pton(AF_INET, host, &serv_addr.sin_addr);
    if (status <= 0) {
        printf("Socket: inet_pton error\n");
        return 1;
    }
    
    status = connect(fd, (struct sockaddr *)&serv_addr, sizeof(serv_addr));
    if (status < 0) {
        printf("Socket: connect error\n");
        return 1;
    }
    return 0;
}

int csocket_read(int fd, char *data, int length) {
    int len = read(fd, data, length-1);
    return len;
}
