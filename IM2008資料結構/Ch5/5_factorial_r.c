/*************************************************/
/*【程式名稱】: 5_factorial_r.c                  */
/*【程式功能】: 遞迴函數(式)：計算 n!            */
/*       輸入 : 整數 n                           */
/*       輸出 : n! 之值                          */
/*【資料結構】: 遞迴                             */
/*************************************************/

#include <stdio.h>

long factorial(long n);

/*----------------------------*/
/*   以遞迴方式計算 n! 之值   */
/*----------------------------*/
long factorial(long n)
{
   if(n == 0)
      return 0;
   if(n == 1)
      return 1;
   if(n > 1)
     	return (n * factorial(n-1)); 
   else 
      printf("\n錯誤! n 必須為正整數!\n");
}

void main(void)
{
   int i;

   clrscr( );
   for(i=0; i <= 10; i++){
      printf("\n==> %d ! = %ld",i,factorial(i));
   }
}
