/****************************************************************/
/*【程式名稱】: 5_perm_r.c                                      */
/*【程式功能】: 遞迴函數(式)：列印出3筆和4筆資料的所有排列方式  */
/*       輸入 :                                                 */
/*       輸出 : 3筆和4筆資料的所有排列方式                      */
/*【資料結構】: 遞迴                                            */
/****************************************************************/
/*【變數名稱及用途】                                            */
/* permutation(char data[],int no_of_data,int from,int n)       */
/*        data[] : 存放待排列的資料                             */
/*    no_of_data : 幾筆資料                                     */
/*       from, n : 從data[from]到data[n]的資料要排列            */
/* backup_data[] : 將 data[] 備份到 backup_data[]               */
/****************************************************************/

#include <stdio.h>

#define N 5

void permutation(char data[],int no_of_data,int from,int n);
void swap(char *x, char *y);

/*-----------------------------------------------------------*/
/*   排列data[]裡的no_of_data筆資料(從data[from]到data[n])   */
/*-----------------------------------------------------------*/
void permutation(char data[],int no_of_data,int from,int n)
{
   int  i, j, k;
   char temp[N];

   if(from == n){
      printf("\n");
      for(i = 0; i < no_of_data; i++){
         printf("%c  ",data[i]);
      }
   }
   else{
      for(k = 0; k < no_of_data; k++)  
         temp[k] = data[k];

      for(j = from; j <= n; j++){
	 swap(&data[from],&data[j]);
         permutation(data, no_of_data, from+1, n);

         for(k = 0; k < no_of_data; k++)
            data[k] = temp[k];
      }
   }
}

/*------------------------*/
/*   將 x 與 y 的值交換   */
/*------------------------*/
void swap(char *x, char *y)
{
   int temp;

   temp = *x;
   *x = *y;
   *y = temp;
}

void main(void)
{
      char data[N]={'a','b','c','d','e'};

      clrscr( );
      printf("\na、b、c 3筆資料的排列方式有以下幾種:"); 
      permutation(data,3,0,2);

      printf("\n\na、b、c、d 4筆資料的排列方式有以下幾種:"); 
      permutation(data,4,0,3);
}