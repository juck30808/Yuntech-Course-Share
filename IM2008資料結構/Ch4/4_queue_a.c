/*********************************************************/
/*【程式名稱】: 4_queue_a.c                              */
/*【程式功能】: 以陣列實作佇列                           */
/*【資料結構】: 陣列結構                                 */
/*       輸入 : 整數資料 1, 2, 3, 4, 5, 6, 7, 8, 9, 10   */
/*       輸出 : 10, 9, 8, 7, 6, 5, 4, 3, 2, 1            */
/*********************************************************/
/*【變數名稱及用途】                                     */
/*      data[] : 定義 data[] 為一個佇列結構              */
/*       front : 為一個陣列索引，它指向佇列頭端          */
/*        rear : 為一個陣列索引，它指向佇列尾端          */
/*********************************************************/

#include <stdio.h>

#define n 5
#define true 1
#define false 0

int queue[n];
int front = 0;
int rear = -1;

/*----------------------*/
/*   判斷是否為空佇列   */
/*----------------------*/
int empty(void)
{
   if(front > rear){
      printf("\n==>佇列已空！\n");
      return true;
   }
   else
      return false;

   /* return (front > rear) ? true : false; */
}

/*----------------------*/
/*   判斷佇列是否滿溢   */
/*----------------------*/
int full(void)
{
   if(rear >= n - 1){
      printf("\n==>佇列已滿！\n");
      return true;
   }
   else
      return false;

   /* return (rear >= n - 1) ? true : false; */
}

/*------------------------------------*/
/*   將資料 queue_data 放入佇列尾端   */
/*------------------------------------*/ 
void insert_into_queue(int queue_data)
{
   queue[++rear] = queue_data;
   printf("將 %d 放入佇列尾端\n",queue_data);   
}

/*------------------------*/
/*   刪除佇列頭端的資料   */
/*------------------------*/
int delete_from_queue()
{
   return queue[front++];    
}

void main(void)
{ 
   int i=0;
   int data[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

   clrscr( );
   printf("==> 已經宣告一個容量為 %d 的佇列 ! ...\n",n);
   printf("\n==>將資料1,2,3,4,5,6,7,8,9,10依序放入佇列...\n");
   while(! full( )){
      printf("   步驟(%d):",i+1); 
      insert_into_queue(data[i]);
      i++;
   }
   i=1;
   printf("\n==>刪除佇列頭端的資料...\n");
   while(! empty())
      printf("   步驟(%d):刪除 %d \n",i++ ,
              delete_from_queue());
}