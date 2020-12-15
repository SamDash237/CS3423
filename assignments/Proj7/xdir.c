#include <stdarg.h>
#include <string.h>
#include <errno.h>
#include <dirent.h>
#include <stdio.h>
#include <sys/stat.h>
#include <unistd.h>

#define MAX_LINE_SIZE 4096
void errExit(const char szFmt[], ...);
int main(int argc, char *argv[]){
    char sz[MAX_LINE_SIZE];
    DIR *pDr;
    struct dirent *pDirent;
    struct stat statBuf;
    char fileType;
    char fileString[100];
    int rc;

    if(argc < 2){
        errExit("Not enough arguments!");
    }
    pDr = opendir(argv[1]);
    if(pDr == NULL){
            errExit("Could not open '%s' : %s", argv[0], strerror(errno));
     }

 while ((pDirent = readdir(pDr)) != NULL){
    if(!argv[2]){            
        if(pDirent->d_name[0] != '.')
            printf("    %s\n", pDirent->d_name);
    }
    else if(strcmp(argv[2], "-l") == 0)
    { 
        strcpy(fileString, argv[1]);
        strcat(fileString, "/");
        strcat(fileString, pDirent->d_name);
        rc = stat((fileString), &statBuf);

        if(rc < 0)
            errExit("Stat: %s", strerror(errno));
        
        if(S_ISLNK(statBuf.st_mode))
            fileType = 'L';
        else if(S_ISFIFO(statBuf.st_mode))
            fileType = 'P';
        else if(S_ISREG(statBuf.st_mode))
            fileType = 'F';
        else if(S_ISDIR(statBuf.st_mode))
            fileType = 'D';
        else
            fileType = 'L';

        if(!argv[3]){
            if(pDirent->d_name[0] != '.') {

            printf("    %s %c %ld blks %ld bytes\n", pDirent->d_name, fileType, statBuf.st_blocks, statBuf.st_size);
            }
        }
        else if(strcmp(argv[3], "-a") == 0) {
            printf("    %s %c %ld blks %ld bytes\n", pDirent->d_name, fileType, statBuf.st_blocks, statBuf.st_size);
        }
        else {
            printf("wrong command, %s not found", argv[2]);
        }
    }
    else if(strcmp(argv[2], "-a") == 0)
        printf("    %s\n", pDirent->d_name);
}
closedir(pDr);
return 0;
}
