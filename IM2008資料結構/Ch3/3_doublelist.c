/**********************************************************************/
/*【程式名稱】: 3_doublelist.c                                        */
/*【程式功能】: 節點資料由小至大排序之雙向鏈結串列的資料增刪與列印    */
/*【資料結構】: 雙向鏈結串列(double linked list)，節點結構            */
/**********************************************************************/
/*【變數名稱及用途】                                                  */
/* struct node : 定義 node 為一個節點結構                             */
/*       data : 用來儲存節點資料值                                    */
/*     r_link : 為一個 node 指標，它指向下一個節點                    */
/*     l_link : 為一個 node 指標，它指向前一個節點                    */
/*      front : 為一個 node 指標，它指向雙向鏈結串列的前端(串列的頭)  */
/*       rear : 為一個 node 指標，它指向雙向鏈結串列的尾端(串列的尾)  */
/**********************************************************************/

#include <stdio.h>
#define N 6

void create_double_list(void);
void free_double_list(void);
int  empty(void);
void insert_node(int key);
void delete_node(int key);
void print_front(void);
void print_rear(void);

/*------------------------------*/
/*    定義 node 為一個節點類別  */
/*------------------------------*/
struct node{        	      /* 定義一個雙向鏈結節點結構 */
   int data;
   struct node *l_link;
   struct node *r_link;
};
struct node *front, *rear;


/*---------------------------------------------------*/
/*   產生一個空串列，它只有 front 及 rear 兩個節點   */
/*---------------------------------------------------*/
void create_double_list(void)            /* Constructor */
{
   front = (struct node *) malloc(sizeof(struct node));
   rear = (struct node *) malloc(sizeof(struct node));
   front->r_link = NULL;
   rear->r_link = NULL;
}

void free_double_list(void)              /* Destructor */
{
   struct node *this_node, *temp_node;

   if (! empty())                        /* 若非空串列 */
      { 
        this_node = front->r_link;
        while(this_node->r_link != front)  /* 若非最後一個節點 */
          {
            temp_node = this_node;
            this_node = this_node->r_link;
            free(temp_node);
          }
        free(this_node);
      }
   else;
  
   free(front);
   free(rear);
}

/*----------------------*/
/*   判斷是否為空串列   */
/*----------------------*/
int empty(void)
{
   if(front->r_link == NULL) /* queue is empty */
      return 1;              /* true           */  
   else
      return 0;              /* false          */
}

/*--------------------------------------------------------*/ 
/*   將資料(key)插入雙向鏈結串列中，並按小至大順序排列    */
/*--------------------------------------------------------*/
void insert_node(int key)
{
   struct node *new_node, *prev_node, *this_node;
   
   new_node = (struct node *) malloc(sizeof(struct node));

   new_node->data = key;
   new_node->l_link = NULL;
   new_node->r_link = NULL;
  
   if (empty())                     /* 空串列，插入第一個節點到front之後 */
      {
        front->r_link = new_node;
        rear->r_link = new_node;
        new_node->l_link = front;
        new_node->r_link = front;   /* 我們將最後一個節點的r_link指向front */
      }
   else
      {
        this_node = front->r_link;
        if (key < this_node->data)  /* 插入到串列之前端 */
           {  
             front->r_link = new_node;
             new_node->r_link = this_node;
             new_node->l_link = front;
           }
        else
           {
             while(this_node->r_link != front)    /* 插入到串列中間 */
               {
                 prev_node = this_node;
                 this_node = this_node->r_link;
                 if (key < this_node->data)
                    {
                      prev_node->r_link = new_node;
                      new_node->l_link = prev_node;               
                      new_node->r_link = this_node;
                      this_node->l_link = new_node; 
                      return;
                    }
                 else;           
               }
             this_node->r_link = new_node;   /* 插入到串列之尾端 */
             new_node->l_link = this_node;  
             new_node->r_link = front;       /* 我們將最後一個節點的r_link指向front */
             rear->r_link = new_node;
           } 
      }
}

/*-----------------------------------*/
/*   自雙向鏈結串列中刪除資料(key)   */
/*-----------------------------------*/
void delete_node(int key)
{
   struct node *this_node, *prev_node, *temp_node;

   prev_node = front;
   this_node = front->r_link;

   while(this_node->r_link != front)          /* 當不是最後一個節點時 */
     {
       if (key == this_node->data)
          {
            temp_node = this_node;
            prev_node->r_link = this_node->r_link;
            this_node->r_link->l_link = prev_node;
            free(temp_node);
            return;
          }
       prev_node = this_node;
       this_node = this_node->r_link;
     }
   if (key == this_node->data)                /* 判斷最後一個節點 */
      {  
        temp_node = this_node;
        prev_node->r_link = front;            /* 我們將最後一個節點的r_link指向front */
        rear->r_link = prev_node;
        free(temp_node);
      }
   else
        printf("... 找不到資料 %d \n",key);
}

/*-------------------------------------*/
/*   從 front 開始列印資料(由小至大)   */
/*-------------------------------------*/
void print_front(void)
{
   struct node *this_node;
   
   if (! empty())                             /* 若非空串列 */
      {
        this_node = front->r_link;
        printf(" ==> 串列內容為 : ");

        while(this_node->r_link != front)
          {
            printf("%d ->",this_node->data); 
            this_node = this_node->r_link;
          }
        printf("%d \n",this_node->data); 
      }
   else 
        printf(" !!! 空串列\n");
}

/*------------------------------------*/
/*   從 rear 開始列印資料(由大至小)   */
/*------------------------------------*/
void print_rear(void)
{
   struct node *this_node;
   
   if (! empty())                              /* 若非空串列 */
      {                           
        this_node = rear->r_link;
        printf(" ==> 串列內容為 : ");

        while(this_node->l_link != front)
          {
            printf("%d ->",this_node->data); 
            this_node = this_node->l_link;
          }
        printf("%d \n",this_node->data);
      }
   else 
        printf(" !!! 空串列\n");
}

void main(void)
{ 
   int i;
   int a[N] = {5, 65, 31, 83, 78, 21};

   create_double_list( );

   clrscr( );
   printf("\n【將資料插入雙向鏈結串列，並保持資料由小至大之排序】...\n");
   for(i = 0; i < N; i++)
      {
        printf("\n 步驟 <%d> 插入 %d \n",i,a[i]);
        insert_node(a[i]);
        print_front();
      }

   printf("\n【刪除 5】...\n");
   delete_node(5);
   print_front();
 
   
   printf("\n【刪除 83】...\n");
   delete_node(83);
   print_front(); 
   
   
   printf("\n【刪除 31】...\n");
   delete_node(31);
   print_front(); 

   printf("\n【從rear往front列印(由大至小)】...\n");   
   print_rear();

   free_double_list( );
}