/*********************************************************/
/*【程式名稱】: 8_m_sort.c                               */
/*【程式功能】: 2-路合併排序法－按「鍵值不遞減」排序     */
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

void print_org_data(const int d[], int n);
void print_array_data(const int d[], int low, int high);
int  exp(int i, int j);
void merge_it(int d[], int high, int i, int *j);
void merge_sort_ascending(int d[], int low, int high);

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
/*   印出陣列 d 的內容(從 d[low] 到 d[high])   */ 
/*---------------------------------------------*/
void print_array_data(const int d[], int low, int high)
{
   int i;

   for(i = low; i <= high; i++){
      printf("%2d  ",d[i]);
   }
   printf("\n");
}

/*----------------------*/
/*   計算 i 的 j 次方   */
/*----------------------*/
int exp(int i, int j)
{
   int k = 1;

   if(j == 0)
      return 1;
   while(j >= 1){
      k = k * i;
      j --;
   }
   return k;
}

/*--------------------------------*/
/*   2-路合併(按「鍵值不遞減」)   */
/*--------------------------------*/
void merge_it(int d[], int high, int i, int *j)
{
   int y[Size+1], z[Size+1];
   int temp, iy, iz, jy, jz;
 
   temp = *j;
   iy = 0;
   while(iy < i && temp <= high)
      y[++iy] = d[temp++];

   iz = 0;
   while(iz < i && temp <= high)
     z[++iz] = d[temp++];

   temp = *j;
   jy = 1;
   jz = 1;
   while(jy <= iy || jz <= iz){
      if(jy <= iy && jz <= iz)
         d[temp++] = (y[jy] < z[jz]) ? y[jy++] : z[jz++];

      if(jy > iy){
         while(jz <= iz)
            d[temp++] = z[jz++];
         break;
      } 
      if(jz > iz){
         while(jy <= iy)
            d[temp++] = y[jy++];
         break;
      }         
   }
   *j = temp;  
}

/*-------------------------------*/
/*   2-路合併排序法              */
/*     1.陣列 d 共有 n 個元素    */
/*     2.按「鍵值不遞減」排序    */
/*-------------------------------*/
void merge_sort_ascending(int d[], int low, int high)
{
   int i, j, k, m, n, step=0;

   m = 0;
   n = high - low + 1;
   k = exp(2, m);
   while(k < n){
      m++;
      k = exp(2, m);
   }
   for(i = 1; i <= m; i++){
      j = low;
      while(j <= high){
         k=exp(2, i-1);
         merge_it(d, high, k, &j);
      }
      printf(" 第%d回合 ==> ",++step);
      print_array_data(d, low, high);
   }
}

void main(void)
{
   int d[Size]={83,66,55,21,88,18,88,99};

   print_org_data(d, Size); /* 列印排序前之鍵值資料 */

   /* 將陣列 d 裡的 d[0] 到 d[Size-1] 等鍵值按「鍵值不遞減」排序 */
   merge_sort_ascending(d,0,Size-1); 
}