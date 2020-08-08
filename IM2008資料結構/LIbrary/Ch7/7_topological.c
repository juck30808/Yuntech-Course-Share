/**********************************************************************/
/*【程式名稱】: 7_topological.cpp                                     */
/*【程式功能】: 拓樸排序(有向圖)                                      */
/*【資料結構】: 陣列結構                                              */
/**********************************************************************/
/*【變數名稱及用途】                                                  */
/*    vertices : 有向圖的頂點個數                                     */
/*  adj_matrix : 用以表示有向圖的鄰接矩陣                             */
/**********************************************************************/

#include <stdio.h>
#define  V    80
#define  true 1

int  SELECTED = 1;
int  UNSELECTED = 0;
int  vertices;
int  adj_matrix[V][V];
int  mark[V];

void input_graph(void);
void topological_sort(void);
void output_graph(void);

/*--------------------------------------------------*/
/*   輸入有向圖的邊(頂點i和頂點j)及距離(成本)資料   */
/*--------------------------------------------------*/
void input_graph(void)
{
   int i, j;

   clrscr( );
   printf("\n請輸入有向圖的頂點數 : ");
   scanf("%d",&vertices);

   if(vertices > 0){
      for(i = 0; i < vertices; i++)
         for(j = 0; j < vertices; j++)
            {
              adj_matrix[i][j] = 0;
            }
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
              printf("               到頂點 : ");
              scanf("%d",&j);
              adj_matrix[i][j] = 1;
            }
       }
   }
}

/*--------------*/
/*   拓樸排序   */
/*--------------*/
void topological_sort(void)
{
   int i, j, n, one;

   printf("\n拓樸排序為 : ");
   for(i = 0; i < vertices; i++)
      mark[i] = UNSELECTED;

   n = 0;
   label:
   while(n < vertices)
     {
       for(i = 0; i < vertices; i++)
          {
            one = 0;
            if (mark[i] == UNSELECTED)
               {
                 for(j = 0; j < vertices; j++)
                    if (mark[i] == UNSELECTED && mark[j] == UNSELECTED)
                       if ( adj_matrix[j][i] == 1)
                          one += 1;
                 if (one ==0)
                    {
                      mark[i] = SELECTED;
                      n += 1;
                      printf("==> v%d  ",i);
                      goto label;
                    }
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
      printf("   v%d  ",i);
   printf("\n---------------------------------------\n"); 

   for(i = 0; i < vertices; i++)
      {
        printf("v%d |",i);
        for(j = 0; j < vertices; j++)
           printf("%5d  ",adj_matrix[i][j]);
        printf("\n");
      }  
}

void main(void)
{ 
   input_graph();
   output_graph();
   topological_sort();
}