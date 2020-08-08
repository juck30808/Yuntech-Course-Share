/*********************************************************/
/*【程式名稱】: 4_queue_l.c                              */
/*【程式功能】: 以單向鏈結串列實作佇列                   */
/*【資料結構】: 鏈結串列、佇列                           */
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

void create_queue(void);
void free_queue(void);
int  empty(void);
void insert_into_queue(int queue_data);
int  delete_from_queue(void);

/*------------------------------*/
/*   定義 node 為一個節點結構   */
/*------------------------------*/
struct node{        	/* 定義一個單向鏈結節點結構   */
   int data;		/* data用來存放整數資料	      */
   struct node *link;   /* link：指標，指向下一個節點 */
};
struct node *front, *rear;

/*---------------------------------------------------*/
/*   產生一個空佇列，它只有 front 及 rear 兩個節點   */
/*---------------------------------------------------*/
void create_queue(void)
{
   front = (struct node *) malloc(sizeof(struct node));
   rear = (struct node *) malloc(sizeof(struct node));
   front->link = null;
   rear->link = null;
   printf("==> 已經產生一個以鏈結串列實作的空佇列 ! \n");
}

/*----------------------------------------*/
/*   刪除佇列，釋放所有節點所佔之記憶體   */
/*----------------------------------------*/
void free_queue(void)
{
   struct node *x, *y;

   if(front->link != null){
      x = front->link;
      while(x->link != null){
         y = x;
         x = x->link;
         free(y);
      }
      free(x);
   }
   else;

   free(front);
   free(rear);
}

/*-----------------------------*/
/*   判斷 queue 是否空無資料   */
/*-----------------------------*/
int empty(void)
{
   if(front->link == null)   /* 空佇列 */
      return 1;              /* true   */  
   else
      return 0;              /* false  */
}

/*--------------------------------*/
/*   將資料 queue_data 放入佇列   */
/*--------------------------------*/
void insert_into_queue(int queue_data)
{
   struct node *new_node, *temp_node;

   new_node = (struct node *) malloc(sizeof(struct node));

   new_node->data = queue_data;
   new_node->link = null;

   if(front->link == null){   /* 空佇列 */
      front->link = new_node;
      rear->link = new_node;
   }
   else{
      temp_node = rear->link;
      temp_node->link = new_node;
      rear->link = new_node;
   }
   printf("將 %d 放入佇列尾端\n",queue_data);   
}

/*------------------------*/
/*   刪除佇列頭端的資料   */
/*------------------------*/
int delete_from_queue(void)
{
   int queue_data;
   struct node *x;

   x = front->link;
   front->link = x->link;
   queue_data = x->data;
   free(x);

   return(queue_data);
}

void main(void)
{
   int i;
   int data[n] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

   clrscr();
   create_queue( ); 
   printf("\n==>將資料1,2,3,4,5,6,7,8,9,10依序放入佇列...\n");
   for(i = 0; i < n; i++){
      printf("   步驟(%d):",i+1); 
      insert_into_queue(data[i]);
   }
   i = 1;
   printf("\n==>刪除佇列頭端的資料...\n");
   while(! empty()){   
      printf("   步驟(%d):刪除 %d \n",i++,
              delete_from_queue());
   }
   free_queue( );
}