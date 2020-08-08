/********************************************************/ 
/*【程式名稱】: 1_average_grade.c                       */ 
/*【程式功能】: 計算三位同學的平均分數                  */ 
/********************************************************/ 
/*【變數名稱及用途】                                    */ 
/* average: 用來記錄算出的平均分數                      */ 
/********************************************************/
  
#include <stdio.h> 
 
main()
{
 int grade1, grade2, grade3;
 int sum, average;

 scanf(“%d”,&grade1);
 scanf(“%d”,&grade2);
 scanf(“%d”,&grade3);
 sum=grade1+grade2+grade3;
 average=sum/3;
 printf(“\nThe average score = %d”, average);

}
