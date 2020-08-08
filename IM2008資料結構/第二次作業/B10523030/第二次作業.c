#include <stdio.h>
//#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	int i,j=1,x;
	printf("請輸入要算到多大：");
	scanf("%d",&x);
	printf("質數為："); 
	for(i=2;i<=x;i++){ 
		for(j=2;j<=i;j++){				//printf("第%d圈 第%d次\n",i,j);
			if(i==j){
				printf("%d,\n",i);
			}else if(i%j==0){			//	printf("非質數\n");
				break;
			}
		}
	}
	return 0;
}
