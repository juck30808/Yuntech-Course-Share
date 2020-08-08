/**********************************************************************/
/*【程式名稱】: 7_dgraph_1.c                                          */
/*【程式功能】: 有向圖的鄰接矩陣表示法                                */
/*【資料結構】: 陣列結構                                              */
/**********************************************************************/
/*【變數名稱及用途】                                                  */
/*    vertices : 有向圖的頂點個數                                     */
/*  adj_matrix : 表示有向圖的鄰接矩陣                                 */
/**********************************************************************/

#include <stdio.h>
#define N    80
#define true 1

int  vertices;
char adj_matrix[N][N];
void input_graph(void);
void output_graph(void);

/*----------------------------------*/
/*   輸入有向圖的邊(頂點i和頂點j)   */
/*----------------------------------*/
void input_graph(void)
{
   int i, j;

   clrscr( );
   printf("\n請輸入有向圖的頂點數 : ");
   scanf("%d",&vertices);
   if (vertices > 0)
      {
        for(i = 0; i < vertices; i++)
           for(j = 0; j < vertices; j++)
              adj_matrix[i][j] = '0';

        printf("請輸入有向圖的邊");
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

   printf("\n有向圖的鄰接矩陣表示法為 : \n\n");
   printf("    ");
   for(i = 0; i < vertices; i++)
      printf("v%d  ",i);
   printf("\n");
   for(i = 0; i < vertices; i++)
      {
        printf("v%d  ",i);
        for(j = 0; j < vertices; j++)
	   printf("%2c  ",adj_matrix[i][j]);
        printf("\n");
      }  
}

void main(void)
{ 
   input_graph();
   output_graph();   
}