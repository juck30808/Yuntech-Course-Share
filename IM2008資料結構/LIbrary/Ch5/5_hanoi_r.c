/*******************************************************/
/*【程式名稱】: 5_hanoi_r.c                            */
/*【程式功能】: 遞迴函數(式)：河內之塔                 */
/*       輸入 : 圓盤的個數                             */
/*       輸出 : 將n個圓盤從a柱搬移至c柱之過程          */
/*【資料結構】: 遞迴                                   */
/*******************************************************/
/*【變數名稱及用途】                                   */
/*    disk_no : 圓盤的個數                             */
/*******************************************************/

#include <stdio.h>

/*-------------------------------------*/
/*   遞迴函數(式)：河內之塔 河內之塔   */
/*-------------------------------------*/
/* 第1個參數      disk_no：圓盤的個數  */
/* 第2個參數       source：來源柱      */
/* 第3個參數 intermediate：媒介柱      */
/* 第4個參數  destination：目的地柱    */
/*-------------------------------------*/
void hanoi(int disk_no,char source,char intermediate,char destination)
{
   static int step=0;

   if(disk_no > 1)
      hanoi(disk_no-1,source,destination,intermediate);
      printf("==>步驟(%d):將 %d 號圓盤從 %c 柱搬到 %c 柱。\n",++step,
             disk_no,source,destination);

   if(disk_no > 1)
      hanoi(disk_no-1,intermediate,source,destination);
}

void main(void)
{
   int disk_no;

   clrscr( );
   printf("\n有幾個圓盤 ? ");
   scanf("%d",&disk_no);
   printf("\n搬移的步驟如下 : \n");
   hanoi(disk_no,'a','b','c');
}