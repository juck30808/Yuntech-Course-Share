/**********************************************************************/
/*【程式名稱】: 7_shortest.c                                          */
/*【程式功能】: 從一頂點到其餘每一頂點的最短距離(有向圖)              */
/*【資料結構】: 陣列結構                                              */
/**********************************************************************/
/*【變數名稱及用途】                                                  */
/*    vertices : 有向圖的頂點個數                                     */
/*  cost[i][j] : 儲存頂點 i 到頂點 j 的距離(或成本)                   */
/*     dist[i] : 儲存出發頂點 start(或v) 到頂點 i 的距離(或成本)      */
/**********************************************************************/

#include <stdio.h>
#define V    80
#define E    80
#define true 1

int  start;
int  MAX = 10000;
int  SELECTED = 1;
int  UNSELECTED = 0; 
 
int  vertices;
int  node;
int  cost[V][V];
int  mark[V];
long int dist[V];    

void input_graph(void);
void shortest_path(int v);
int  min_dist(int a, int b);
void output_cost(void);
void output_dist(int v);

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
              mark[i] = UNSELECTED;

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
                   printf("                 距離 : ");
                   scanf("%d",&distance);
                   cost[i][j] = distance;
                 }
             }
     }
}

/*---------------------------------------*/
/*   求頂點 v 到其餘每一頂點的最短距離   */
/*---------------------------------------*/
void shortest_path(int v)
{
   int i, j, u, w, t;
   long int min;

   for(i = 0; i < vertices; i++)
      dist[i] = cost[v][i];

   node = 2;
   mark[v] = SELECTED;
   dist[v] = 0;

   while(node < vertices)
     {
       min = MAX;
       u = -1;
       for(i = 0; i < vertices; i++)
          {
            if (mark[i] == UNSELECTED && dist[i] < min)
               {
                 min = dist[i];
                 u = i;
               }
          }
       if (u != -1)
          {
            mark[u] = SELECTED;
            node += 1;
            for(w = 0; w < vertices; w++)
               {
                 if (mark[w] == UNSELECTED)
                   dist[w] = min_dist(dist[w], dist[u]+cost[u][w]);
               } 
          }
       else
          break; 
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

/*--------------------*/
/*   輸出 cost 矩陣   */
/*--------------------*/
void output_cost(void)
{
   int i, j;

   printf("\n有向圖的鄰接矩陣表示法為 : \n\n");
   printf("    ");
   for(i = 0; i < vertices; i++)
      printf("   v%d  ",i);
   printf("\n----------------------------------------------------------------\n"); 

   for(i = 0; i < vertices; i++)
      {
        printf("v%d |",i);
        for(j = 0; j < vertices; j++)
           {
             if (cost[i][j] != MAX)
                printf("%5d  ",cost[i][j]);
             else
                printf("    x  ");
           }
        printf("\n");
     }  
}

/*--------------------*/
/*   輸出 dist 矩陣   */
/*--------------------*/
void output_dist(int v)
{
   int i;

   printf("\n從頂點 %d 到其餘每一頂點的最短距離為 : \n\n",v);
   printf("距離陣列 dist :  ");

   for(i = 0; i < vertices; i++)
      printf("  [%d] ",i);
   printf("\n----------------------------------------------------------------\n");

   printf("                ");
   for(i = 0; i < vertices; i++)
      {
        if (dist[i] != MAX)
           printf("%6d",dist[i]);
        else
           printf("     x");
      }
   printf("\n");
}

void main(void)
{ 
   input_graph();
   printf("從哪一個頂點出發 : ");
   scanf("%d",&start);
   shortest_path(start);
   output_cost();
   output_dist(start);
}