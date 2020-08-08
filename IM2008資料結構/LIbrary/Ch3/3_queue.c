/*****************************************************************/
/*【程式名稱】: 3_queue.c                                        */
/*【程式功能】: 以單向鏈結串列實作 queue 結構                    */
/*【資料結構】: 單向鏈結串列(singly linked list)，節點結構       */
/*****************************************************************/
/*【變數名稱及用途】                                             */
/* struct node : 定義 node 為一個節點結構                        */
/*       data : 用來儲存節點資料值                               */
/*       link : 為一個 node 指標，它指向下一個節點               */
/*      front : 為一個 node 指標，它指向 queue 的前端(串列的頭)  */
/*       rear : 為一個 node 指標，它指向 queue 的尾端(串列的尾)  */
/*****************************************************************/

#include <stdio.h>
#define N 6

void create_empty_queue(void);
void delete_all_queue(void);
int empty(void);
void insert_into_queue(int key);
int  delete_from_queue(void);

/*------------------------------*/
/*   定義 node 為一個節點結構   */
/*------------------------------*/
struct node{        	/* 定義一個單向鏈結節點結構             */
   int data;		/* data 用來儲存節點資料值	        */
   struct node *link;   /* 為一個 node 指標，它指向下一個節點   */
};
struct node *front, *rear;

/*---------------------------------------------------*/
/*   產生一個空串列，它只有 front 及 rear 兩個節點   */
/*---------------------------------------------------*/
void create_empty_queue(void)      /* Constructor */
{
   front = (struct node *) malloc(sizeof(struct node));
   rear = (struct node *) malloc(sizeof(struct node));
   front->link = NULL;
   rear->link = NULL;
}

void free_all_queue(void)        /* Destructor */
{
   struct node *this_node, *temp_node;

   if (front->link != NULL)
      {
        this_node = front->link;
        while(this_node->link != NULL)
          {
            temp_node = this_node;
            this_node = this_node->link;
            free(temp_node);
          }
        free(this_node);
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
   if(front->link == NULL)      /* queue is empty */
      return 1;                 /* true           */  
   else 
      return 0;                 /* false          */
}

/*----------------------------------*/
/*   將資料(key)放入 queue 的尾端   */
/*----------------------------------*/
void insert_into_queue(int key)
{
   struct node *new_node, *temp_node;

   new_node = (struct node *) malloc(sizeof(struct node));

   new_node->data = key;
   new_node->link = NULL;

   if (front->link == NULL)     /* queue is empty */
      { 
        front->link = new_node;
        rear->link = new_node;
      }
   else
      {
        temp_node = rear->link;
        temp_node->link = new_node;
        rear->link = new_node;
      } 
}

/*-----------------------------*/
/*   自 queue 的前端刪除資料   */
/*-----------------------------*/
int delete_from_queue(void)
{
   int key;
   struct node *temp_node;

   temp_node = front->link;
   front->link = temp_node->link;
   key = temp_node->data;
   free(temp_node);  

   return(key);
}

void main(void)
{
   int i;
   int a[N] = {0, 1, 2, 3, 4, 5};

   create_empty_queue( );

   printf("\n【將資料放入 queue 的尾端】...\n");
   for(i = 0; i < N; i++)
      {
        printf("  步驟 <%d> 放入 %d\n",i,a[i]);
        insert_into_queue(a[i]);
      }

   printf("\n【自 queue 的前端取出資料】...\n");
   i = 0;

   while(! empty())       /*while(front->link != NULL) */
      printf("  步驟 <%d> 取出 %d\n",i++,delete_from_queue());

   free_all_queue( );
}