#include <stdio.h>
#include <stdlib.h>
/*
typedef struct A{
	int num;
	int exp;
	struct node*next;	//delay
}poly_node ;
*/
//struct poly_node poly_ptr;


//char a[]="abc"  = char a[]={'a','b','c','\n'}
main(){
//	char input[];
//	printf("請輸入數值(大寫OX)：");	
//	scanf("%s",&input);	
	char input[]="OXXOOX";
	int length = sizeof(input) / sizeof(input[0]);
	for(int i=0;i<length;i++){
		printf("%c",input[i]);
	} 
}
