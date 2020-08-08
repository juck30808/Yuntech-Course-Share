/******************************************************************/
/**【程式名稱】: 3_concatenate2list_2.c                           */
/**【程式功能】: 以將兩個單向鏈結串列合併成一個串列               */
/**【資料結構】: 單向鏈結串列(singly linked list)，節點結構       */
/******************************************************************/
/**【變數名稱及用途】                                             */
/** struct node : 定義 node 為一個節點結構                        */
/**       data : 用來儲存節點資料值                               */
/**       link : 為一個 node 指標，它指向下一個節點               */
/**      front : 為一個 node 指標，它指向單向鏈結串列的前端       */
/**       rear : 為一個 node 指標，它指向單向鏈結串列的尾端       */
/******************************************************************/

#include <stdio.h>
#define N 6

void create_list_x(void);
void create_list_y(void);
void create_list_z(void);
void cancatenate(struct node *front_x, struct node *rear_x,
		 struct node *front_y, struct node *rear_y,
		 struct node *front_z, struct node *rear_z);
void print(struct node *front_);
void length(struct node *front_);
 
/* ------------------------------*/
/*    定義 node 為一個節點類別   */
/* ------------------------------*/
struct node{        	        /* 定義一個單向鏈結節點結構           */
   int data;		        /* data 用來儲存節點資料值	      */
   struct node *link;	        /* 為一個 node 指標，它指向下一個節點 */
};
struct node *front_1, *rear_1;
struct node *front_2, *rear_2;
struct node *front_3, *rear_3;

/* ---------------------------------------------------*/
/*    產生串列list_1，它只有 front 及 rear 兩個節點   */
/* ---------------------------------------------------*/
void create_list_1(void)               /* Constructor */
{
   front_1 = (struct node *) malloc(sizeof(struct node));
   rear_1 = (struct node *) malloc(sizeof(struct node));
   front_1->link = NULL;
   rear_1->link = NULL;
}

/* ---------------------------------------------------*/
/*    產生串列list_2，它只有 front 及 rear 兩個節點   */
/* ---------------------------------------------------*/
void create_list_2(void)               /* Constructor */
{
   front_2 = (struct node *) malloc(sizeof(struct node));
   rear_2 = (struct node *) malloc(sizeof(struct node));
   front_2->link = NULL;
   rear_2->link = NULL;
}

/* ---------------------------------------------------*/
/*    產生串列list_3，它只有 front 及 rear 兩個節點   */
/* ---------------------------------------------------*/
void create_list_3(void)               /* Constructor */
{
   front_3 = (struct node *) malloc(sizeof(struct node));
   rear_3 = (struct node *) malloc(sizeof(struct node));
   front_3->link = NULL;
   rear_3->link = NULL;
}

/* ---------------------------------------*/
/*    將資料(key)插入單向鏈結串列的尾端   */
/* ---------------------------------------*/
void insert(int key, struct node *front_, struct node *rear_)
{
   struct node *new_node, *temp_node;

   new_node = (struct node *) malloc(sizeof(struct node));

   new_node->data = key;
   new_node->link = NULL;

   if (front_->link == NULL)              /* queue is empty */
      {
        front_->link = new_node;
        rear_->link = new_node;
      } 
   else
      {
        temp_node = rear_->link;
        temp_node->link = new_node;
        rear_->link = new_node;
      }
}


/*-------------------------------------------------------------------*/
/*    將front_y串列合併到front_x串列之後，並以front_z為新串列的前端  */
/* ------------------------------------------------------------------*/
void cancatenate(struct node *front_x, struct node *rear_x,
		 struct node *front_y, struct node *rear_y,
		 struct node *front_z, struct node *rear_z)
{
   struct node *this_node;

   if (front_x->link == NULL)                      /* front_x 為空串列 */
      { 
        front_z->link = front_y->link;
        rear_z->link = rear_y->link;
      }
   else
      {
        if (front_y->link == NULL)                 /* front_y 為空串列 */
           {
             front_z->link = front_x->link;
             rear_z->link = rear_x->link;
           }
      else                              /* front_x, front_y 均非空串列 */
           {
             front_z->link = front_x->link;
             this_node = rear_x->link;
             this_node->link = front_y->link;
             rear_z->link = rear_y->link;
           }
      } 
}


/* ---------------------------*/
/*    從 front 開始列印資料   */
/* ---------------------------*/
void print(struct node *front_)
{
   struct node *this_node;

   if (front_->link != NULL)
      {
        this_node = front_->link;
        printf(" ==> 串列內容為 : ");

        while(this_node->link != NULL)
          {
            printf("%d ->",this_node->data);
            this_node = this_node->link;
          }
        printf("%d \n",this_node->data);
     }
   else
        printf(" !!! 空串列\n");
}

/* -------------------- */
/*    計算串列的長度    */
/* -------------------- */
void length(struct node *front_)
{
   int count = 0;
   struct node *this_node;

   if (front_->link != NULL)
      {
        this_node = front_->link;
        while(this_node->link != NULL)
             {
               count ++;
               this_node = this_node->link;
             }
        count ++;
        printf(" ==> 串列長度為 : %d\n",count);
      }
   else
        printf(" !!! 空串列，串列長度為 : 0 \n");
}

void main(void)
{
   int i;
   int a[N] = {0, 1, 2, 3, 4, 5};
   int b[N] = {10, 11, 12, 13, 14, 15};

   create_list_1( );
   create_list_2( );
   create_list_3( );

   clrscr( );
   for(i = 0; i < N; i++)
      {
        insert(a[i], front_1, rear_1);
      }
   printf("\n【單向鏈結串列 1】...\n");
   print(front_1);
   length(front_1);

   for(i = 0; i < N; i++)
      {
        insert(b[i], front_2, rear_2);
      }
   printf("\n【單向鏈結串列 2】...\n");
   print(front_2);
   length(front_2);

   printf("\n【單向鏈結串列 3】...\n");
   print(front_3);
   length(front_3);

   cancatenate(front_1, rear_1, front_2, rear_2, front_3, rear_3);
   printf("\n【 合併後的單向鏈結串列】...\n");
   print(front_3);
   length(front_3);
}
