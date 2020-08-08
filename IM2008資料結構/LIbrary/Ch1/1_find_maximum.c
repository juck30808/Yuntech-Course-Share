/********************************************************/ 
/*【程式名稱】: 1_find_maximum.c                        */ 
/*【程式功能】: 找出三個數值中的最大值                  */ 
/********************************************************/ 
/*【變數名稱及用途】                                    */ 
/* MAX: 用來記錄算出的最大值                            */ 
/********************************************************/
  
#include <stdio.h> 
 
main()
{
 int A, B, C;
 int MAX;

 scanf(“%d”,&A);
 scanf(“%d”,&B);
 scanf(“%d”,&C);

 if (A>B)
    {
      if (A>C)
           
         MAX=A;
      else
         MAX=C;
    }
 else
    {
      if (B>C)
         MAX=B;
      else
         MAX=C;
    }
 printf(“\nThe maximal number is = %d”, MAX);

}
