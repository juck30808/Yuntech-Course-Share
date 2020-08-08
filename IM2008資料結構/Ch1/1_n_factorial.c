/********************************************************/ 
/*【程式名稱】: 1_n_factorial.c                         */ 
/*【程式功能】: 計算n!                                  */ 
/********************************************************/ 
/*【變數名稱及用途】                                    */ 
/* product: 用來記錄算出的n!的結果                      */ 
/********************************************************/
  
#include <stdio.h> 

main()
{
 int n;
 int product=1, multiplier;

 scanf(“%d”,&n);

 multiplier = n;
 while ( multiplier >1 )
       {
         product *= multiplier;
         multiplier--;
       }
 printf(“\nThe result of %d factorial = %d”,n, product);

} 
