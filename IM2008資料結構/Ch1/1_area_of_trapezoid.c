  /********************************************************/ 
  /*【程式名稱】: 1_area_of_trapezoid.c                   */ 
  /*【程式功能】: 計算梯形面積                            */ 
  /********************************************************/ 
  /*【變數名稱及用途】                                    */ 
  /* area: 用來記錄算出的梯形面積                         */ 
  /********************************************************/
   
#include <stdio.h> 
main()
{
 int base1, base2, height;
 int basenum, area;

 scanf(“%d”,&base1);
 scanf(“%d”,&base2);
 scanf(“%d”,&height);

 basenum = base1 + base2;
 area = basenum * height / 2;
 printf(“\nThe area is %d”,area);

}  
