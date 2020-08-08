/**********************************************************************/
/*【程式名稱】: 7_bfs.c                                               */
/*【程式功能】: 無向圖的BFS追蹤                                       */
/*【資料結構】: 陣列結構                                              */
/**********************************************************************/
/*【變數名稱及用途】                                                  */
/*    visit[N] : 當拜訪過頂點 i 時設定visit[i]=ALREADY                */
/*    vertices : 無向圖的頂點個數                                     */
/*  adj_matrix : 無向圖的鄰接矩陣表示法                               */
/*    queue[N] : 暫時存放頂點的queue                                  */
/**********************************************************************/

#include <stdio.h>
#define N    80
#define true 1

int  ALREADY = 1;
int  front = -1;
int  rear= -1;           
int  visit[N];
int  vertices;
char adj_matrix[N][N];      
char queue[N];

void input_graph(void);
void output_graph(void);
void bfs(int i);
void input_queue(int j);
int  output_queue(void);
int  queue_empty(void);

/*----------------------------------*/
/*   輸入無向圖的邊(頂點i和頂點j)   */
/*----------------------------------*/
void input_graph(void)
{
   int i, j;

   printf("\n請輸入無向圖的頂點數 : ");
   scanf("%d",&vertices);
   if (vertices > 0)
      {
        for(i = 0; i < vertices; i++)
           for(j = 0; j < vertices; j++)
              adj_matrix[i][j] = '0';
 
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
                 adj_matrix[i][j] = '1';
                 adj_matrix[j][i] = '1';
              }
          }
      }
}

/*------------------*/
/*   輸出鄰接矩陣   */
/*------------------*/
void output_graph(void)
{
   int i, j;
   printf("\n無向圖的鄰接矩陣表示法為 : \n\n");
   printf("    ");
   for(i = 0; i < vertices; i++)
      printf("v%d  ",i);
   printf("\n");

   for(i = 0; i < vertices; i++)
      {
        printf("v%d  ",i);
        for(j = 0; j < vertices; j++)
           printf("%d  ",adj_matrix[i][j]);
        printf("\n");
      }  
}

/*---------------------*/
/*   無向圖的BFS追蹤   */
/*---------------------*/
void bfs(int i)
{
   int j;
   static step = 0;

   visit[i] = ALREADY;
   printf("步驟 %d ==> 拜訪 v%d\n",++step, i);
   for(j = 0; j < vertices; j++)
      if(adj_matrix[i][j] == '1' && visit[j] != ALREADY)
         input_queue(j);

   while(front != rear)                /* queue not empty */
     { 
      i = output_queue( );
      if(visit[i] != ALREADY)
         bfs(i);
     }
}

/*----------------------------*/
/*   將頂點 j 放入 queue 中   */
/*----------------------------*/
void input_queue(int j)
{
   rear += 1;
   if(rear == N)
      printf("\nqueue is full !\n");
   else
      queue[rear] = j;
}

/*-----------------------------*/
/*   自 queue 中取出一個頂點   */
/*-----------------------------*/
int output_queue(void)
{
   if (front == rear)
      {
        printf("\nqueue is empty !\n");
        return(-1);
      }
   else
      {
        front += 1;
        return (queue[front]);
      }
}

void main(void)
{ 
   input_graph();
   output_graph();
   clrscr( );
   printf("\n無向圖的BFS追蹤過程...\n\n") ;  
   bfs(0); 
}