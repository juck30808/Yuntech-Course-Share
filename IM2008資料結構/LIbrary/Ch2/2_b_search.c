/*********************************************************/
/*【程式名稱】: 2_b_search.c                             */
/*【程式功能】: 二元搜尋法(鍵值可重複)                   */
/*       輸入 : 欲搜尋的鍵值                             */
/*       輸出 : 是否找到，如果找到則顯示其索引位置       */
/*【資料結構】: 陣列結構                                 */
/*********************************************************/
/*【變數名稱及用途】                                     */
/*        d[] : 儲存待搜尋的鍵值(已經按鍵值遞增排序)     */
/*    index[] : 滿足條件之鍵值其索引位置存放在此         */
/*      count : 共有多少筆資料滿足搜尋條件               */
/*********************************************************/

#include <stdio.h>
#define Size 8
#define true 1

void print_array_data(int *d, int n);
int binary_search(int *d, int low_index, int high_index,
                  int key, int *index);

/*--------------------*/
/*   列印陣列元素值   */
/*--------------------*/
void print_array_data(int *d, int n)
{
   int i ;

   printf("陣列元素 d[0] [1] [2] [3] [4] [5] [6] [7] \n");
   printf("------------------------------------------\n");
   printf("鍵  值 ==>");
   for(i = 0; i < n; i++){
      printf("%3d ",d[i]);
   }
   printf("\n\n");
}

/*----------------*/
/*   二元搜尋法   */
/*----------------*/
int binary_search(int *d, int low_index, int high_index,
                  int key, int *index)
{
   int i, middle, count;

   if(d[low_index] > key || d[high_index] < key ) /* not found */
     return (-1);

   count=-1;
   while(low_index <= high_index){
      middle = (low_index + high_index)/2;
      if(key > d[middle])
         low_index = middle + 1;      /* 下一回合須搜尋後半部 */
      else{
         if(key < d[middle])
            high_index = middle - 1;  /* 下一回合須搜尋前半部 */  
          
         else{ /* key == d[middle] */
            index[++count] = middle;  /* 找到了 */
                                      /* 須再比較前後筆鍵值是否相同 */

            i = middle - 1;
            while(i >= low_index && key == d[i]) /* 比較前面幾筆是否同鍵值 */
               index[++count] = i--;

	    i = middle + 1;
	    while(i <= high_index && key == d[i]) /* 比較後面幾筆是否同鍵值 */
               index[++count] = i++;

            return (count);
         }
      }
   }
   return (-1);
}

void main(void)
{
   int d[Size]={14, 33, 48, 50, 87, 93, 120, 121}; /* 已遞增排序 */
   int key;
   int i, count=-1; /* 共有多少筆資料滿足搜尋條件   */
   int index[Size]; /* 儲存滿足條件之鍵值之索引位值 */

   clrscr( );
   while(true){
      print_array_data(d, Size);
      printf("請輸入要搜尋的鍵值(結束時輸入-1) : ");
      scanf("%d",&key);
      if(key == -1) break;
      else;

      count = binary_search(d, 0, Size-1, key, index);

      if(count > -1){
	 for(i = 0; i <= count; i++)
            printf("\n在 d[%d] 找到了鍵值 %d！",index[i],key);
         printf(" ==>共找到 %d 筆！\n\n",count+1);
      }
      else
         printf("\n==>找不到鍵值 %d ！\n\n",key);
   }
}
