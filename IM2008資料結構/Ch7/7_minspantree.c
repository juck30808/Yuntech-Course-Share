/**********************************************************************/
/*【程式名稱】: 7_minspantree.c                                       */
/*【程式功能】: 無向圖的最小擴張樹(使用Kruskal's方法)                 */
/*【資料結構】: 陣列結構                                              */
/**********************************************************************/
/*【變數名稱及用途】                                                  */
/*     Tset[V] : 用以表示T集合，它存放組成最小擴張樹的頂點集合        */
/*    vertices : 無向圖的頂點個數                                     */
/* adj_matrix[V][V] : 表示無向圖的鄰接矩陣，其元素為成本(或距離)      */
/*  span_tree[V][V] : 表示最小擴張樹的鄰接矩陣表示，其元素為成本(距離)*/
/* struct edge : 邊的結構                                             */
/**********************************************************************/

#include <stdio.h>
#define V    80
#define E    80
#define true 1

int MAX = 10000;
int INIT = -1;
int CYCLE = 1;
int GIVEUP = 0;
int FOUND = 1;
int NOT_FOUND = 0;
int SELECTED = 1;
int e, s, t, tot_cost;
int Tset[V];
int vertices;
int adj_matrix[V][V];
int span_tree[V][V];

struct edge{  /* 定義"邊"的結構 */
   int vx;
   int vy;
   int cost;
   int order;
   int selected;
}edge[E];      

void input_graph(void);
void input_edge(int i, int j, int cost);
void spanning_tree(void);
int  is_cycle(int ee);
void output_graph(void);
void output_span_tree(void);

/*--------------------------------------------------*/
/*   輸入無向圖的邊(頂點i和頂點j)及成本(距離)資料   */
/*--------------------------------------------------*/
void input_graph(void)
{
   int i, j, cost;

   e = -1;
   s = -1;
   t = -1;
   tot_cost = 0;

   clrscr( );
   printf("\n請輸入無向圖的頂點數 : ");
   scanf("%d",&vertices);
   if (vertices > 0)
      {
        for(i = 0; i < vertices; i++)
           for(j = 0; j < vertices; j++)
              {
                adj_matrix[i][j] = MAX;
                span_tree[i][j] = MAX;
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
                printf("         成本(或距離) : ");
                scanf("%d",&cost);
                adj_matrix[i][j] = cost;
                adj_matrix[j][i] = cost;
                input_edge(i, j, cost);
              }
          }
     }
}

/*------------------------------*/
/*   儲存邊及成本(或距離)資料   */
/*------------------------------*/
void input_edge(int i, int j, int cost)
{
   e += 1;
   edge[e].vx = i;
   edge[e].vy = j;
   edge[e].cost = cost;
   edge[e].order = 0;
   edge[e].selected = INIT; 
}

/*-------------------------------------*/
/*   以 Kruskal's 方法建造最小擴張樹   */
/*-------------------------------------*/
void spanning_tree(void)
{
   int i, j, ee, min, order, cycle, select_edge;
   
   order = 0;
   select_edge = 0;
   printf("\n以 Kruskal's 方法建造最小擴張樹之過程...\n\n");
   while(select_edge < vertices -1)
     {
       ee = -1;
       min = MAX;
       for(j = 0; j <= e; j++)
          {
            if (edge[j].selected == INIT)
               if (min > edge[j].cost)
                  {
                    min = edge[j].cost;
                    ee = j;
                  }
          }
       order += 1;
       cycle = is_cycle(ee);
       if (! cycle)
          {
            select_edge += 1;
            edge[ee].order = order;
            edge[ee].selected = SELECTED;
            tot_cost = tot_cost + edge[ee].cost;
            printf("步驟 %d ==> 選擇 邊",order);
            printf("(v%d,v%d) ",edge[ee].vx, edge[ee].vy);
            printf("距離=%d",edge[ee].cost);
            printf(" 總距離=%d\n",tot_cost);
            span_tree[edge[ee].vx][edge[ee].vy] = edge[ee].cost;
            span_tree[edge[ee].vy][edge[ee].vx] = edge[ee].cost;
          }
       else
          {
            edge[ee].order = order;
            edge[ee].selected = GIVEUP;
	    printf("步驟 %d ==> 放棄 邊",order);
            printf("(v%d,v%d) ",edge[ee].vx,edge[ee].vy);
            printf("距離=%d",edge[ee].cost);
            printf(" 總距離=%d\n",tot_cost);
          }
    }
}

/*----------------------------------------*/
/*   判斷邊 edge[ee] 的加入是否產生迴路   */
/*----------------------------------------*/
int is_cycle(int ee)
{
   int i, vx, vy;
   
   vx = NOT_FOUND;
   vy = NOT_FOUND;
   for(i = 0; i <= t; i++)
      {
        if (edge[ee].vx == Tset[i])
           {
              vx = FOUND;
              break;
           }
     }
   for(i = 0; i <= t; i++)
      {
        if (edge[ee].vy == Tset[i])
           {
             vy = FOUND;
             break;
           }
      }

   if(vx == FOUND && vy == FOUND)
      return(CYCLE);
   else
     {
       if(vx == NOT_FOUND) Tset[++t] = edge[ee].vx;
       if(vy == NOT_FOUND) Tset[++t] = edge[ee].vy;
       return(! CYCLE);
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
      printf("   v%d  ",i);
   printf("\n");
   for(i = 0; i < vertices; i++)
      {
        printf("v%d  ",i);
        for(j = 0; j < vertices; j++)
           {
             if (adj_matrix[i][j] != MAX)
                printf("%5d  ",adj_matrix[i][j]);
             else
                printf("    x  ");
           }
        printf("\n");
     }  
}

/*--------------------*/
/*   輸出最小擴張樹   */
/*--------------------*/
void output_span_tree(void)
{
   int i, j;

   printf("\n無向圖的最小擴張樹為 : \n\n");
   printf("    ");
   for(i = 0; i < vertices; i++)
      printf("   v%d  ",i);
   printf("\n");
 
   for(i = 0; i < vertices; i++)
      {
        printf("v%d  ",i);
        for(j = 0; j < vertices; j++)
           {
             if (span_tree[i][j] != MAX)
                printf("%5d  ",span_tree[i][j]);
             else
                printf("    x  ") ;
           }  
        printf("\n");
      }
}

void main(void)
{ 
   input_graph();
   output_graph();
   spanning_tree();
   output_span_tree();
}