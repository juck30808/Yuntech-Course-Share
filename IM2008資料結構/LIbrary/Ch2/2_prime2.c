/****************************************************/
/*【程式名稱】: 2_prime2.c                          */
/*【程式功能】: 印出不大於 n 的所有質數             */
/*       輸入 : 大於 1 的整數 n                     */
/*       輸出 : 不大於 n 的所有質數                 */
/*【資料結構】: 陣列結構                            */
/****************************************************/
/*【變數名稱及用途】                                */
/* isprime : 布林變數(true代表質數，false代表非質數)*/
/* prime[N] : 暫存不大於 n 的所有質數               */
/*   count : 統計質數總個數                         */
/****************************************************/

#include <stdio.h>
#include <math.h>
#define N 120

int find_prime(int *prime, int n);

void main(void)
{  
   int i, n, count = 0;
   int prime[N] = {0};

   clrscr();
   printf("請輸入大於 1 的整數 : ");
   scanf("%d",&n);

   printf("\n不大於 %d 的質數有...\n\n",n);
   /*-----------------------------*/
   /*   找出不大於 n 的所有質數   */
   /*-----------------------------*/
   count = find_prime(prime, n);

   /*-----------------------------*/
   /*   印出不大於 n 的所有質數   */
   /*-----------------------------*/
   for(i = 0; i <= count; i++){
      printf("%d ",prime[i]);
      if((i+1) % 15 == 0)	/* 每印滿 15 個質數就跳下一行 */
	 printf("\n\n");
   }
   printf("\n\n小於等於 %d 的質數共有 %d 個",n,count+1);
}

/*-----------------------------------------------------------*/
/*   找出 <= n 的所有質數，採用以下定義                      */
/*   質數的定義：一個正整數，不能被小於本身的所有質數所整除  */
/*   被找到的質數站存在陣列prime[]之中                       */
/*-----------------------------------------------------------*/
int find_prime(int *prime, int n)
{
   enum boolean isprime;
   enum boolean {false,true};
   int i, j, count = -1;

   for(i = 2; i <= n; i++){
      isprime = true;
      switch(i){
         case 2 :		        /* 2 是最小的質數 */
            prime[++count] = i;
            break;
         default :
            for(j = 0; prime[j] != 0 && prime[j] <= sqrt(i) &&
                isprime == true; j++){
               if((i % prime[j]) == 0)  /* 非質數         */
                  isprime = false;
               else;               
            }
            if(isprime == true)
               prime[++count] = i;
      }
   }
   return count;
}