/*********************************************************/
/*【程式名稱】: 8_q_sort.c                               */
/*【程式功能】: 快速排序法－按「鍵值不遞減」排序         */
/*       輸入 : 一組未經排序的整數鍵值                   */
/*       輸出 : 每一回合排序之結果                       */
/*【資料結構】: 陣列結構                                 */
/*********************************************************/
/*【變數名稱及用途】                                     */
/*        d[] : 儲存待排序的鍵值以及排序過程中每一回合之 */
/*              結果                                     */
/*     Size,n : 陣列 d 的大小(元素個數)                  */
/*********************************************************/

#include <stdio.h>
#define Size 8
#define true 1

int step = 0;

void print_org_data(const int d[], int n);
void print_array_data(const int d[], int n);
void swap(int *x, int *y);
int divide_point(int d[], int low, int high);
void quick_sort_ascending(int d[], int low, int high);

/*------------------------------------------------*/
/*   列印排序前的鍵值資料(陣列 d 共有 n 個元素)   */
/*------------------------------------------------*/
void print_org_data(const int d[], int n) 
{
   int i;

   clrscr( );
   printf("陣列元素   d[0] [1] [2] [3] [4] [5] [6] [7] \n");
   printf("----------------------------------------------\n");
   printf("<排序前> ==> ");
   for(i = 0; i < n; i++){
      printf("%2d  ",d[i]);
   }
   printf("\n----------------------------------------------\n");
}

/*---------------------------------------------*/
/*   印出陣列 d 的內容(陣列 d 共有 n 個元素)   */ 
/*---------------------------------------------*/
void print_array_data(const int d[], int n)
{
   int i;

   printf("陣列元素   d[0] [1] [2] [3] [4] [5] [6] [7] \n");
   printf("----------------------------------------------\n");
   printf("             ");
   for(i = 0; i < n; i++){
      printf("%2d  ",d[i]);
   }
   printf("\n");
}

/*---------------------------*/
/*   將 x,y 兩變數之值互換   */
/*---------------------------*/
void swap(int *x, int *y)
{
   int z = *x;

   *x = *y;
   *y = z;
}

/*------------------*/
/*   找出分割點 j   */
/*------------------*/
int divide_point(int d[], int low, int high)
{
   int i, j, key;  

   key = d[low];
   i = low;
   j = high + 1;
   while(true){
      while(d[++i] < key); 
      while(d[--j] > key);
      if(i < j){
         printf("==> i=%d, j=%d , i < j",i,j);
         printf("==> 將(d[%d]=%d,d[%d]=%d)交換位置得到:\n",i,d[i],j,d[j]);
         swap(&d[i], &d[j]);
         print_array_data(d, Size);
      }
      else
         break;
   }
   printf("==> i=%d, j=%d , i >= j",i,j);
   printf("==> 將(d[%d]=%d,d[%d]=%d)交換位置得到:\n",low,d[low],j,d[j]);
   swap(&d[low], &d[j]);
   print_array_data(d, Size); 
   return j;
}

/*-------------------------------*/
/*   快速排序法                  */
/*     1.陣列 d 共有 n 個元素    */
/*     2.按「鍵值不遞減」排序    */
/*-------------------------------*/
void quick_sort_ascending(int d[], int low, int high)
{
   int i, j;
   
   if(low < high){
      j = divide_point(d, low, high); /* 找出分割點 j */
      printf("==> 以 d[%d]=%d 為分割點\n\n",j,d[j]);

      if((j-1) > low){
         printf("==> 排序 d[%d]-d[%d]\n",low,j-1);
         quick_sort_ascending(d,low,j-1);
      }

      if(high > (j+1)){
         printf("==> 排序 d[%d]-d[%d]\n",j+1,high);
         quick_sort_ascending(d,j+1,high);
      }
   }
}

void main(void)
{
   int d[Size]={83,66,55,21,88,18,88,99};

   print_org_data(d, Size); /* 列印排序前之鍵值資料 */

   /* 將陣列 d 裡的 d[0] 到 d[Size-1] 等鍵值按「鍵值不遞減」排序 */
   quick_sort_ascending(d,0,Size-1);
}