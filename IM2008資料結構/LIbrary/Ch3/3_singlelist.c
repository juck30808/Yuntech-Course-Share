/*******************************************************************/
/*【程式名稱】: 3_singlelist.c                                     */
/*【程式功能】: 節點資料由小至大排序之單向鏈結串列的資料增刪與列印 */
/*【資料結構】: 單向鏈結串列(singly linked list)，節點結構         */
/*******************************************************************/
/*【變數名稱及用途】                                               */
/* struct node : 定義 node 為一個節點結構                          */
/*       data : 用來儲存節點資料值                                 */
/*       link : 為一個 node 指標，它指向下一個節點                 */
/*      front : 為一個 node 指標，它指向單向鏈結串列的前端         */
/*       rear : 為一個 node 指標，它指向單向鏈結串列的尾端         */
/*******************************************************************/

#include <stdio.h>
#define N 6

void create_single_list(void);
void free_single_list(void);
int  empty(void);
void insert_node(int key);
void delete_node(int key);
void print(void);
void reverse(void);


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
void create_single_list(void)      /* Constructor */
{
   front = (struct node *) malloc(sizeof(struct node));
   rear = (struct node *) malloc(sizeof(struct node));
   front->link = NULL;  
   rear->link = NULL;
}

void free_single_list(void)        /* Destructor */
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

/*----------------------*/
/*   判斷是否為空串列   */
/*----------------------*/
int empty(void)
{
   if(front->link == NULL)                      /* 空串列 */
      return 1;                                 /* true   */
   else
      return 0;                                 /* false  */
}

/*--------------------------------------------------------*/
/*    將資料(key)插入單向鏈結串列中，並按小至大順序排列   */
/*--------------------------------------------------------*/
void insert_node(int key)
{
   struct node *new_node, *prev_node, *this_node;
   
   new_node = (struct node *) malloc(sizeof(struct node));

   new_node->data = key;
   new_node->link = NULL;

   if (empty())                            /* 空串列，插入第一個節點到front之後 */
      {
        front->link = new_node;
        rear->link = new_node;
      }
   else
      {
        this_node = front->link;
        if (key < this_node->data)                           /* 插入到串列之前端 */
           {  
             front->link = new_node;
             new_node->link = this_node;
           }
        else
           {
             while(this_node->link != NULL)                    /* 插入到串列中間 */
               {  
                 prev_node = this_node;
                 this_node = this_node->link;
                 if (key < this_node->data)
                    {
                      prev_node->link = new_node;               
                      new_node->link = this_node;
                      return;
                    }
                 else;           
              }
            this_node->link = new_node;                        /* 插入到串列尾端 */
            rear->link = new_node;
          } 
      }
}

/*-----------------------------------*/
/*    自單向鏈結串列中刪除資料(key)  */
/*-----------------------------------*/
void delete_node(int key)
{
   struct node *this_node, *prev_node, *temp_node;

   prev_node = front;
   this_node = front->link;

   while(this_node->link != NULL)                        /* 當不是最後一個節點時 */
     {
       if (key == this_node->data)
          {
            temp_node = this_node;
            prev_node->link = this_node->link;
	    free(temp_node);
            return;
          }
       prev_node = this_node;
       this_node = this_node->link;
    }
 
   if (key == this_node->data)                               /* 判斷最後一個節點 */
      {
        temp_node = this_node;
        prev_node->link = NULL;              /* 我們將最後一個節點的link指向NULL */
        rear->link = prev_node;
        free(temp_node);
      }
   else
      printf("... 找不到資料 %d \n",key);
}

/*-------------------------------------*/
/*   從 front 開始列印資料(由小至大)   */
/*-------------------------------------*/
void print(void)
{
   struct node *this_node;
    
   if (! empty())                                                 /* 若非空串列 */
      {
        this_node = front->link;
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

/*------------------------*/
/*    將單向鏈結串列反轉  */
/*------------------------*/
void reverse(void)
{
   struct node *prev_node, *this_node, *next_node;
   
   next_node = front->link;
   this_node = NULL;
   while(next_node->link != NULL)
     {
       prev_node = this_node;
       this_node = next_node;
       next_node = next_node->link; 
       this_node->link = prev_node;
     }
   next_node->link = this_node;
   front->link = next_node;
}


void main(void)
{
   int i;
   int a[N] = {5, 65, 31, 83, 78, 21};

   create_single_list( );

   clrscr( );
   printf("\n【將資料插入單向鏈結串列，並保持資料由小至大之排序】...\n");
   for(i = 0; i < N; i++)
      {
        printf("\n  步驟 <%d> 插入 %d\n",i,a[i]);
        insert_node(a[i]);
        print();
      }

   printf("\n【刪除 5】...\n");
   delete_node(5);
   print();

   printf("\n【刪除 83】...\n");
   delete_node(83);
   print();


   printf("\n【刪除 31】...\n");
   delete_node(31);
   print(); 

   printf("\n【將串列反轉】...\n");   
   reverse();
   print();
   
   printf("\n【將串列反轉】...\n"); 
   reverse();
   print(); 

   free_single_list( );
}