/**********************************************************************/
/*【程式名稱】: 7_ugraph_2.c                                          */
/*【程式功能】: 無向圖的鄰接串列表示法                                */
/*【資料結構】: 單向鏈結串列(singly linked list)，節點結構            */
/**********************************************************************/
/*【變數名稱及用途】                                                  */
/*    vertices : 無向圖的頂點個數                                     */
/*   v_list[N] : 用以表示無向圖的鄰接串列                             */
/**********************************************************************/

#include <stdio.h>
#define N    80
#define true 1

int vertices;
struct node{        	/* 定義一個單向鏈結節點結構           */
   int data;		/* data 用來儲存節點資料值	      */
   struct node *link;	/* 為一個 node 指標，它指向下一個節點 */
};
struct node v_list[N];

void input_graph(void);
void adj_list(int i, int j);
void output_adj_list(void);

/*----------------------------------*/
/*   輸入無向圖的邊(頂點i和頂點j)   */
/*----------------------------------*/
void input_graph(void)
{
   int i, j;

   clrscr( );
   printf("\n請輸入無向圖的頂點數 : ");
   scanf("%d",&vertices);

   if (vertices > 0)
      {
        for(i = 0; i < vertices; i++)
           {
             v_list[i].data = 0;
             v_list[i].link = NULL;
           } 
        printf("請輸入無向圖的邊");
        printf("(0<=邊的編號<=%d)...\n",vertices-1);
        while(true)
          {
            printf("邊是連接頂點(-1:結束) : ");
            scanf("%d",&i);
            if (i == -1)
               break;
            else
              {
                printf("               和頂點 : ");
                scanf("%d",&j);
                adj_list(i,j);
              }
         }
    }
}

/*------------------*/
/*   建構鄰接串列   */
/*------------------*/
void adj_list(int i, int j)
{
   struct node *new_node, *x;
   
   new_node = (struct node *) malloc(sizeof(struct node));
   new_node->data = j;
   new_node->link = NULL;
   x = &v_list[i];
   while(x->link != NULL)
      x = x-> link;
   x->link = new_node;

   new_node = (struct node *) malloc(sizeof(struct node));
   new_node->data = i;
   new_node->link = NULL;
   x = &v_list[j];
   while(x->link != NULL)
      x = x-> link;
   x->link = new_node;
}

/*------------------*/
/*   輸出鄰接串列   */
/*------------------*/
void output_adj_list(void)
{
   int i, j;
   struct node *new_node, *x;

   printf("\n無向圖的鄰接串列表示法為 : \n\n");
   for(i = 0; i < vertices; i++)
      {
        printf("v%d",i);
        x = &v_list[i];
        while(x->link != NULL)
          {
            x = x-> link;
            printf(" ==> v%d",x->data);
          }
        printf("\n");
     }
}

void main(void)
{ 
   input_graph( );
   output_adj_list( );
}