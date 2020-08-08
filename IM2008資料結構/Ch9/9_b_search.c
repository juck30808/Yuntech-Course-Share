/*********************************************************/
/*【程式名稱】: 9_b_search.c                             */
/*【程式功能】: 二分搜尋                                 */
/*       輸入 : 一組已經按「鍵值不遞減」排序的鍵值       */
/*              要搜尋的鍵值 key                         */
/*       輸出 : 搜尋之過程和結果                         */
/*【資料結構】: 陣列結構                                 */
/*********************************************************/
/*【變數名稱及用途】                                     */
/*        d[] : 儲存待搜尋的鍵值                         */
/*    index[] : 若d[i]=key，則將i暫存至index[]中         */
/*     Size,n : 陣列 d 的大小(元素個數)                  */
/*********************************************************/

#include <stdio.h>
#define Size 16
#define true 1

void print_org_data(const int d[], int n) ;
int  b_searching(int d[], int low, int high, int key, int index[]);

/*--------------------------------------------*/
/*   列印待搜尋的鍵值(陣列 d 共有 n 個元素)   */
/*--------------------------------------------*/
void print_org_data(const int d[], int n) 
{
   int i;

   printf("陣列元素 d[0]  [1]  [2]  [3]  [4]  [5]  [6]  [7]  [8]  [9] [10] [11] [12] [13] [14] [15]\n");
   printf("----------------------------------------------------------------------------------------\n");
   printf("<鍵  值> ");
   for(i = 0; i < n; i++){
      printf("%4d ",d[i]);
   }
   printf("\n----------------------------------------------------------------------------------------\n");
}

/*--------------*/
/*   二分搜尋   */
/*--------------*/
int b_searching(int d[], int low, int high, int key, int index[])
{
   int i, count, temp;

   if(key < d[low] || key > d[high])
     return (-1);

   count=-1;
   while(low <= high){
      i = (low + high)/2;
      if(key < d[i]){
         printf("鍵值 %d 與 d[%d] 比較\n",key,i,d[i]);
         high = i - 1;          /* 下一回合須往前半部搜尋 */
      }
      else{
         if(key > d[i]){
            printf("鍵值 %d 與 d[%d] 比較\n",key,i,d[i]);
            low = i + 1;        /* 下一回合須往後半部搜尋 */
         }
         else{
            printf("鍵值 %d 與 d[%d] 比較\n",key,i,d[i]);
            index[++count] = i; /* 找到了，將陣列索引儲存到陣列 index */
            temp = i;

            i = temp - 1;            
            while(key == d[i]){	/* 須往前比較 */
               index[++count] = i--;
            }

	    i = temp + 1;       /* 須往後比較 */
	    while(key == d[i] && i < Size){
               index[++count] = i++;
            }
            return (count);
         }
      }
   }
   return (-1);
}

void main(void)
{
   static int d[Size]={1,9,31,35,75,87,88,91,95,157,163,387,391,391,472,789};
   int key;
   int i, index[Size+1], count=-1;

   clrscr( );
   while(true){
      print_org_data(d, Size);
      printf("請輸入要搜尋的鍵值 K (要結束時輸入-1) : ");
      scanf("%d",&key);
      if(key == -1) break;
      else;
      count = b_searching(d, 0, Size-1, key, index);
      if(count >= 0){
         for(i = 0; i <= count; i++)
            printf("---> 找到了！ d[%d] = %d\n",index[i],key);
         printf("===> 在陣列 d 中總共有 %d 筆鍵值符合搜尋條件！\n\n",count+1);
      }
      else
         printf("===> 在陣列 d 中搜尋不到鍵值 %d！\n\n",key);
   }
}