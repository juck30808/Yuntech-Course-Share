/*********************************************************/
/*【程式名稱】: 4_stack_a.c                              */
/*【程式功能】: 以陣列實作堆疊                           */
/*       輸入 : 整數資料 1, 2, 3, 4, 5, 6, 7, 8, 9, 10   */
/*       輸出 : 5,4,3,2,1                                */
/*【資料結構】: 陣列結構                                 */
/*********************************************************/
/*【變數名稱及用途】                                     */
/*   stack[5] : 為一個陣列，它用來儲存堆疊資料           */
/*        top : 為一個陣列索引，它指向堆疊stack之頂端    */
/*********************************************************/

#include <stdio.h>

#define n 5
#define true 1
#define false 0

int stack[n]; /* 宣告 stack[n] 為一個堆疊 */
int top = -1;

int  empty(void);
int  full(void);
void push(int stack_data);
int  pop();

/*-----------------------*/
/*    判斷是否為空堆疊   */
/*-----------------------*/
int empty(void)
{
   if(top < 0){
      printf("\n==>堆疊已空！\n");
      return true;
   }
   else
      return false;

   /* return (top < 0) ? true : false; */  
}

/*----------------------*/
/*   判斷堆疊是否滿溢   */
/*----------------------*/
int full(void)
{
   if(top >= n - 1){
      printf("\n==>堆疊已滿！\n");
      return true; 
   }
   else 
      return false;

   /* return (top >= n - 1) ? true : false; */
}

/*--------------------------------*/
/*   將資料 stack_data 放入堆疊   */
/*--------------------------------*/
void push(int stack_data)
{
   stack[++top] = stack_data;
   printf("將 %d 放入堆疊\n",stack_data);        
}

/*------------------------*/
/*   刪除堆疊頂端的資料   */
/*------------------------*/
int pop()
{
   return stack[top--];    
}

void main(void)
{
   int i=0;
   int data[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

   clrscr( );
   printf("==> 已經宣告一個容量為 %d 的堆疊 ! \n",n);
   printf("\n==>將資料1,2,3,4,5,6,7,8,9,10依序放入堆疊...\n");
   while(! full( )){
      printf("   步驟(%d):",i+1);  
      push(data[i]);   
      i++;
   }
   i=1;
   printf("\n==>自堆疊頂端取出資料...\n");
   while(! empty())
      printf("   步驟(%d):自堆疊頂端取出 %d \n",i++, pop());
}