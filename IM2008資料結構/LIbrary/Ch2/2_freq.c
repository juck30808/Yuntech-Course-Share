/****************************************************/
/*【程式名稱】: 2_freq.c                            */
/*【程式功能】: 尋找出眾數及其出現頻率              */
/*       輸入 : 輸入15個介於 0 至 5 之間的正整數    */
/*       輸出 : 眾數及其出現頻率                    */
/*【資料結構】: 陣列結構                            */
/****************************************************/
/*【變數名稱及用途】                                */
/*       x[N] : 儲存輸入的整數                      */
/*   count[i] : 記錄整數 i 出現的次數               */
/*          n : 眾數                                */
/****************************************************/

#include <stdio.h>
#define N 15      /* 輸入 15 個整數                 */
#define NUMBER 6  /* 輸入的整數必須介於 0 至 5 之間 */

int frequency(int *count);

void main(void)
{
   int i,n;
   int x[N] = {0};
   int count[NUMBER] = {0};

   clrscr();
   printf("請輸入15個整數 i ，0 <= i <= 5 :\n");

   for(i = 0; i < N; i++){
      scanf("%d",&x[i]);
      count[x[i]] = count[x[i]] + 1;
   };
   n = frequency(count);
   printf("\n眾數為 %d ，共出現 %d 次\n",n,count[n]);
}

/*------------------------------------------------------------*/ 
/*   尋找眾數(當同時有好幾個最大者時，以輸入值較小者為眾數)   */
/*------------------------------------------------------------*/ 
int frequency(int *count)
{
   int i;
   int most_freq_no = count[0];
   int n = 0;  /* 眾數 */
   
   printf("\ncount陣列之內容為 : ");
   printf("\n----------------------------------");
   for(i = 0; i <= NUMBER-1 ; i++){
      printf("\n ==> count[%d] = %d",i,count[i]);
      printf(" (%d 出現 %d 次)",i,count[i]);
      if(count[i] > most_freq_no){
         most_freq_no = count[i];
         n = i;
      }
   }
   printf("\n----------------------------------");
   return n;
} 