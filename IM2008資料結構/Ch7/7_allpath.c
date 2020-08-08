/**********************************************************************/
/*【程式名稱】: 7_allpath.cpp                                         */
/*【程式功能】: 任兩頂點之最短距離(有向圖)                            */
/*【資料結構】: 陣列結構                                              */
/**********************************************************************/
/*【變數名稱及用途】                                                  */
/*    vertices : 有向圖的頂點個數                                     */
/*  cost[i][j] : 儲存頂點 i 到頂點 j 的距離(或成本)                   */
/*     a[i][j] : 儲存A-1、A1、A2、...、Avertices-1                    */
/**********************************************************************/

#include <stdio.h>
#define   V    80
#define   E    80
#define   true 1
int  start;
int  MAX = 10000;
int  vertices;
int  cost[V][V];
int  a[V][V];

void input_graph(void);
void all_path(void);
int  min_dist(int a, int b);
void output_cost(int k);

/*--------------------------------------------------*/
/*   輸入有向圖的邊(頂點i和頂點j)及距離(成本)資料   */
/*--------------------------------------------------*/
void input_graph(void)
{
   int i, j, distance;

   clrscr( );
   printf("\n請輸入有向圖的頂點數 : ");
   scanf("%d",&vertices);

   if (vertices > 0)
      {
        for(i = 0; i < vertices; i++)
           for(j = 0; j < vertices; j++)
              {
                cost[i][j] = MAX;
              }
        for(i = 0; i < vertices; i++)
           cost[i][i] = 0;

        printf("請輸入有向圖的邊");
        printf("(0<=邊的編號<=%d)... \n",vertices-1);
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
                printf("                 距離 : ");
	        scanf("%d",&distance);
                cost[i][j] = distance;
              }
          }
     }
}

/*--------------------------*/
/*   求任兩頂點之最短距離   */
/*--------------------------*/
void all_path(void)
{            
   int i, j, k;
            
   for(i = 0; i < vertices; i++)
      {
        for(j = 0; j < vertices; j++)
           a[i][j] = cost[i][j];
      }

   output_cost(-1);
   
   for(k = 0; k < vertices; k++)
      {
        for(i = 0; i < vertices; i++)
           for(j = 0; j < vertices; j++)
              a[i][j] = min_dist(a[i][j],a[i][k]+a[k][j]);
        output_cost(k);
      }
}

/*-------------------------*/
/*   輸出 a , b 之較小者   */ 
/*-------------------------*/
int min_dist(int a, int b)
{            
   if(a > b)
      return (b);
   else
      return (a);
}

/*---------------------*/
/*    輸出 cost 矩陣   */
/*---------------------*/
void output_cost(int k)
{
   int i, j;
   printf("\n有向圖的鄰接矩陣 A %d :\n\n",k);
   printf("    ");
   for(i = 0; i < vertices; i++)
      printf("   v%d  ",i);
   printf("\n----------------------------------------------\n"); 

   for(i = 0; i < vertices; i++)
      {
        printf("v%d |",i);
        for(j = 0; j < vertices; j++)
           {
             if (a[i][j] != MAX)
                printf("%5d  ",a[i][j]);
             else
                printf("    x  ") ;
           }
        printf("\n");
      }  
}

void main(void)
{ 
   input_graph();
   all_path();
}