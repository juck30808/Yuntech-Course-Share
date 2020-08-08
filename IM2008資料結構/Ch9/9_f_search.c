/*********************************************************/
/*【程式名稱】: 9_f_search.c                             */
/*【程式功能】: 費氏搜尋                                 */
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
int fibonacci(int i);
int f_searching(int d[], int low, int high, int key, int index[]);

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

/*---------------------*/
/*   找出第i個費氏數   */
/*---------------------*/
int fibonacci(int i)
{
   if(i == 0) return (0);
   else if(i == 1) return (1);
   else return (fibonacci(i-1) + fibonacci(i-2));
}

/*--------------*/
/*   費氏搜尋   */
/*--------------*/
int f_searching(int d[], int low, int high, int key, int index[])
{
   int i, j, k, m, n, p, q, count, temp;

   if(key < d[low] || key > d[high])
     return (-1);

   count=-1; 
   n = high - low + 1;
   for(k = 0; fibonacci(k) < n+1; k++);
   k--;
   m = n + 1 - fibonacci(k);
   
   i = fibonacci(k-1);
   p = fibonacci(k-2);
   q = fibonacci(k-3);

   if(key > d[i]){
      printf("鍵值 %d 與 d[%d] 比較\n",key,i,d[i]);
      i = i + m;
   }
   while(i >= 1){      
      if(key < d[i]){
         printf("鍵值 %d 與 d[%d] 比較\n",key,i,d[i]);
         if(q == 0)
            i = 0;
         else{
            i = i - q;
            j = p;
            p = q;
            q = j - q;
         }
      }
      else;

      if(key > d[i]){
         printf("鍵值 %d 與 d[%d] 比較\n",key,i,d[i]);
         if(p == 1)
            i = 0;
         else{
            i = i + q;
            p = p - q;
            q = q - p;
         }
      }
      else;

      if(key == d[i]){ /* 找到了，將陣列索引儲存到陣列 index */
         printf("鍵值 %d 與 d[%d] 比較\n",key,i,d[i]);
         index[++count] = i;
         temp = i;

         i = temp - 1;
         while(key == d[i]){ /* 須往前比較 */
            index[++count] = i--;
         }

         i = temp + 1;
         while(key == d[i] && i < Size){ /* 須往後比較 */
            index[++count] = i++;
         }
         return (count);
      }
      else;
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
      count = f_searching(d, 0, Size-1, key, index);
      if(count >= 0){
         for(i = 0; i <= count; i++)
            printf("---> 找到了！ d[%d] = %d\n",index[i],key);
         printf("===> 在陣列 d 中總共有 %d 筆鍵值符合搜尋條件！\n\n",count+1);
      }
      else
         printf("===> 在陣列 d 中搜尋不到鍵值 %d！\n\n",key);
   }
}