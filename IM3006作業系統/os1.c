#include <sys/wait.h>
#include <sys/types.h>
#include <stdio.h>
#include <unistd.h>
//3-12
#define BUFFER_SIZE 10

typedef struct{
  int a;
} item next-produced;
item buffer[BUFFER_SIZE];
int in =0;
int out =0;


int main(){
 pid_t pid;
 pid = fork(); 

 if(pid<0){
  fprintf(stderr,"Fork Failed");
  return 1;
 }
 else if(pid==0){
   //execlp("/bin/ls","ls",NULL);
   //3-13  
   while(1){
     while (((in+1)%BUFFER_SIZE)==out);
     buffer[in]=nextProduced;
     in = (in+1)% BUFFER_SIZE;
   }
 }
 else{
  //3-14
  while(1){
     while(in==out);
     nextConsumed = buffer[out];
     out =(out+1)%BUFFER_SIZE;
  }
  wait(NULL);
  printf("Chlid Complete");
  }
 return 0;
} 
