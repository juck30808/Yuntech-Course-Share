/*********************************************************/
/*【程式名稱】: 4_hanoi_s.c                              */
/*【程式功能】: 河內塔(使用堆疊技巧)                     */
/*【資料結構】: 陣列結構、堆疊                           */
/*       輸入 : 圓盤的個數                               */
/*       輸出 : 圓盤之搬移過程                           */
/*********************************************************/
/*【變數名稱及用途】                                     */
/*    stack[n] : 為一個堆疊結構                          */
/*         top : 為一個陣列索引，它指向堆疊stack之頂端   */
/*********************************************************/

#include <stdio.h>

#define n 100
#define true 1
#define false 0

int  stack[n][4];
int  top = -1;

int  empty(void);
int  full(void);
void push(int disk_no,
          char source, char intermediate, char destination);
void pop(int *disk_no,
         char *source, char *intermediate, char *destination);
void print_stack_data();
void swap(char *x, char *y);
void hanoi(int disk_no,
           char source, char intermediate, char destination);

/*----------------------*/
/*   判斷是否為空堆疊   */
/*----------------------*/
int empty(void)
{
    return (top < 0) ? true : false;   
}

/*----------------------*/
/*   判斷堆疊是否滿溢   */
/*----------------------*/
int full(void)
{
   return (top >= n - 1) ? true : false;
}

/*--------------------*/
/*   將資料放入堆疊   */
/*--------------------*/
void push(int disk_no,
          char source, char intermediate, char destination)
{
   top = top + 1 ;
   stack[top][0] = disk_no;
   stack[top][1] = source;
   stack[top][2] = intermediate;
   stack[top][3] = destination;
   printf("將資料 %d %c %c %c 放入堆疊\n",disk_no,
         source,intermediate, destination); 
   print_stack_data();
}

/*------------------*/
/*   列印堆疊資料   */
/*------------------*/
void print_stack_data()
{
   int i;

   printf("堆疊內容為:\n");
   if(top >= 0){
      for(i = top; i >= 0 ; i--)
         printf("stack(%d)=%d %c %c %c \n",i,stack[i][0],
                 stack[i][1],stack[i][2],stack[i][3]);    
   }
   else
      printf("空堆疊\n");
}

/*------------------------*/
/*   刪除堆疊頂端的資料   */
/*------------------------*/
void pop(int *disk_no,
         char *source, char *intermediate, char *destination)
{
   *disk_no= stack[top][0];
   *source= stack[top][1];
   *intermediate= stack[top][2];
   *destination = stack[top][3];
   top = top - 1;
   printf("自堆疊取出資料:%d %c %c %c\n",*disk_no,
         *source,*intermediate,*destination);
   print_stack_data();   
}

/*------------------------*/
/*   將 x 與 y 的值交換   */
/*------------------------*/
void swap(char *x, char *y)
{
   char temp;
   
   temp = *x;
   *x = *y;
   *y = temp;
}

/*--------------*/
/*   河內之塔   */
/*--------------*/
void hanoi(int disk_no,
           char source, char intermediate, char destination)
{
   int step=0;

   printf("搬移的過程如下：\n");
   while(1){
      while(disk_no > 1){
         push(disk_no,source,intermediate,destination);
         disk_no -= 1;
         swap(&intermediate,&destination);
      }
      printf("==>步驟(%d):將 %d 號圓盤從 %c 柱搬到 %c 柱。\n",++step,
             disk_no,source,destination);
      if(empty()) break;
      else{
         pop(&disk_no,&source,&intermediate,&destination);

         printf("**>步驟(%d):將 %d 號圓盤從 %c 柱搬到 %c 柱。\n",++step,
                disk_no,source,destination);
         disk_no -= 1;
         swap(&source,&intermediate);
      }
   }
}

void main(void)
{
   int disk_no;

   clrscr( );
   printf("==> 已經宣告一個容量為 %d 的堆疊 ! \n",n);
   printf("有幾個圓盤 ? ");
   scanf("%d",&disk_no);
   hanoi(disk_no,'a','b','c'); 
}