/********************************************************/ 
/*【程式名稱】: 1_aveage_grade2.c                       */ 
/*【程式功能】: 計算全班平均分數                        */ 
/********************************************************/ 
/*【變數名稱及用途】                                    */ 
/* average: 用來記錄算出的平均分數                      */ 
/********************************************************/

  
#include <stdio.h> 

main()
{
 int i, grade;
 int average, sum=0;

 for( i=1 ; i<=60 ; i++)
    {
      printf(“\nPlease input %dth grade”,i);
      scanf(“%d”,&grade);
      sum+=grade;
    }
 average = sum/60;
 printf(“\nThe average score = %d”, average);

}
