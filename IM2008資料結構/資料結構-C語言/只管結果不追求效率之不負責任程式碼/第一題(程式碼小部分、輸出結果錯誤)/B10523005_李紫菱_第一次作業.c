#include<stdio.h>
#include<math.h> 
int main(void){
	double x;  
	printf("x=");
	scanf("%lf",&x); 
	int n=1;
	double sum=0;
	while(fabs((pow(x,n)/n))>0.000001){  //如果正要加的那項其值小於0.000001就停止再算下去 
		sum+=pow(-1,n+1)/n*pow(x,n);     //sum加上該項的值 
		n++;                             //N+1 
	}
	if(n=1){                             //ln(1)=0
		sum=0;
	}
	printf("ans=%f\n",sum);                //輸出答案
	system("pause");
}
