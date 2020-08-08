/*********************************************************/
/*【程式名稱】: 4_stack_l.c                              */
/*【程式功能】: 以鏈結串列實作堆疊                       */
/*【資料結構】: 鏈結串列、堆疊                           */
/*       輸入 : 整數資料 1, 2, 3, 4, 5, 6, 7, 8, 9, 10   */
/*       輸出 : 10, 9, 8, 7, 6, 5, 4, 3, 2, 1            */
/*********************************************************/
/*【變數名稱及用途】                                     */
/* struct node : 定義 node 為一個節點結構                */
/*        data : 用來儲存節點的資料值                    */
/*        link : 為節點指標，它指向下一個節點            */
/*       front : 為節點指標，它指向堆疊的頭端            */
/*        rear : 為節點指標，它指向堆疊的尾端            */
/*********************************************************/

#include <stdio.h>

#define n 10
#define null 0

void create_stack(void);
void free_stack(void);
int  empty(void);
void push(int stack_data);
int  pop(void);

struct node{ 		/* 定義一個單向鏈結節點結構   */
   int data;		/* data：用來存放整數資料     */
   struct node *link;	/* link：指標，指向下一個節點 */
};
struct node *top;

void main(void)
{
   int i;
   int data[n] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

   clrscr();
   create_stack();
   printf("\n==>將資料1,2,3,4,5,6,7,8,9,10依序放入堆疊...\n");
   for(i = 0; i < n; i++){
      printf("   步驟(%d):",i+1); 
      push(data[i]);
   }
   printf("\n==>自堆疊頂端取出資料...\n");
   i = 1;
   while(! empty()){
      printf("   步驟(%d):自堆疊頂端取出 %d \n",i++, pop());
   }
   free_stack();
}

/*-------------------------------------*/
/*   產生一個空堆疊，它只有 top 節點   */
/*-------------------------------------*/
void create_stack(void)
{
   top = (struct node *) malloc(sizeof(struct node));
   top->link = null;
   printf("==> 已經產生一個以鏈結串列實作的空堆疊 ! \n");
}

/*----------------------------------------*/
/*   刪除堆疊，釋放所有節點所佔之記憶體   */
/*----------------------------------------*/
void free_stack(void)
{
   struct node *x, *y;

   if(top->link != null){
      x = top->link;
      while(x->link != null){
         y = x;
         x = x->link;
         free(y);
      }
      free(x);
   }
   else;
   free(top);
}

/*-----------------------------*/
/*   判斷 stack 是否空無資料   */
/*-----------------------------*/
int empty(void)
{
   if(top->link == null)   /* 空堆疊 */
      return 1;            /* true   */  
   else
      return 0;            /* false  */
}

/*--------------------------------*/
/*   將資料 stack_data 放入堆疊   */
/*--------------------------------*/
void push(int stack_data)
{
   struct node *new_node;

   new_node = (struct node *) malloc(sizeof(struct node));

   new_node->data = stack_data;
   new_node->link = top->link;
   top->link = new_node;

   printf("將 %d 放入堆疊\n",stack_data); 
}

/*------------------------*/
/*   刪除堆疊頂端的資料   */
/*------------------------*/
int pop(void)
{
   int stack_data;
   struct node *x;

   x = top->link;
   top->link = x->link;
   stack_data = x->data;
   free(x);

   return(stack_data);
}

