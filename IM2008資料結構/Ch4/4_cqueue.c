/*********************************************************/
/*【程式名稱】: 4_cqueue.c                               */
/*【程式功能】: 以陣列實作環狀佇列                       */
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
int front = n-1;
int rear = n-1;

/*--------------------------*/
/*   判斷是否為空環狀佇列   */
/*--------------------------*/
int empty(void)
{
   if(front == rear){
      printf("\n==>環狀佇列已空！\n");
      return true;
   }
   else
      return false;

   /* return (front == rear) ? true : false; */
}

/*--------------------------*/
/*   判斷環狀佇列是否滿溢   */
/*--------------------------*/
int full(void)
{
   if(front == (rear+1) % n){
      printf("\n==>環狀佇列已滿！\n");
      return true;
   }
   else
      return false;

   /* return (front == (rear+1) % n) ? true : false; */
}

/*------------------------------------*/
/*   將資料 queue_data 放入環狀佇列   */
/*------------------------------------*/
void insert_into_queue(int queue_data)
{
   rear = (rear+1) % n;
   queue[rear] = queue_data;
   printf("將 %d 放入佇列queue[%d]\n",queue_data,rear);        
}

/*----------------------------*/
/*   刪除環狀佇列頭端的資料   */
/*----------------------------*/
int delete_from_queue()
{
   front = (front+1) % n;
   return queue[front];    
}

/*------------------------------*/
/*   列印環狀佇列內的所有資料   */
/*------------------------------*/
void print_queue_data()
{
   int i;

   if(front != rear){
      printf("環狀佇列的內容為：");
      for(i = front+1; i <= rear; i++)
         printf("%d   ",queue[front]);
      printf("\n");
   }
   else{
      printf("空環狀佇列!\n");
   }
}

void main(void)
{ 
   int i=0;
   int data[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

   clrscr();
   printf("==> 已經宣告一個容量為 %d 的環狀佇列 ! \n",n);
   printf("\n==>將資料1,2,3,4,5,6,7,8,9,10依序放入環狀佇列...\n");
   while(! full()){
      printf("   步驟(%d):",i+1); 
      insert_into_queue(data[i]);
      i++;
   }
   i=1;
   printf("\n==>自環狀佇列的頭端取出資料...\n");
   while(! empty())
      printf("   步驟(%d):自環狀佇列頭端取出 %d \n",i++,
              delete_from_queue());
}