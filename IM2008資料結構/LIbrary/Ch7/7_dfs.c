/**********************************************************************/
/*【程式名稱】: 7_dfs.c                                               */
/*【程式功能】: 無向圖的DFS追蹤                                       */
/*【資料結構】: 陣列結構                                              */
/**********************************************************************/
/*【變數名稱及用途】                                                  */
/*    visit[N] : 當拜訪過頂點 i 時設定visit[i]=ALREADY                */
/*    vertices : 無向圖的頂點個數                                     */
/*  adj_matrix : 無向圖的鄰接矩陣表示法                               */
/**********************************************************************/

#include <stdio.h>
#define N    80
#define true 1

int  ALREADY = 1;
int  visit[N];
int  vertices;
char adj_matrix[N][N];

void input_graph(void);
void output_graph(void);
void dfs(int i);

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
/*   無向圖的DFS追蹤   */
/*---------------------*/
void dfs(int i)
{
   int j;
   static step = 0;

   visit[i] = ALREADY;
   printf("步驟 %d ==> 拜訪 v%d\n",++step, i);
   for(j = 0; j < vertices; j++)
      if(adj_matrix[i][j] == '1' && visit[j] != ALREADY)
         dfs(j);
}

void main(void)
{ 
   input_graph();
   output_graph();
   clrscr( );
   printf("\n無向圖的DFS追蹤過程...\n\n");
   dfs(0);
}