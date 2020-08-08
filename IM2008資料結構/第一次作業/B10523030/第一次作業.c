#include <stdio.h>
//#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(int argc, char *argv[]) {
	int i;
	double total=0,x;
	printf("叫块x (0~1)) ");
	scanf("%lf",&x);
	
	for(i=1;i<=99;i++){    //i=1   //i< 计(タ计) 案计搭(璽计) 
		if(i % 2 != 0){
			total =  total + pow(x,i)/i;   //计兜 
		}else{
			total = total - pow(x,i)/i;    //案计兜搭  
		}				 //计穦礚ど ┮计タ计 案计璽计 
	}
	printf("%f",total);
	return 0;
}

/*
x﹚镑0~1ぇ丁
璝盿0.6氮0.47  狦x砞﹚2
Ω计兜磅︽7氮-5.60
Ω计兜磅︽9 氮-19.31
Ω计兜磅︽11氮-64.83计祇床穦禫ㄓ禫ぃ穦氨ゎ
*/
