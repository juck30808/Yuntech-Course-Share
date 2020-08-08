/*******************************************************/
/*祘Α嘿: 5_gcd_r.c                              */
/*祘Α: 患癹ㄧ计(Α)―ㄢタ俱计ぇ程そ计   */
/*       块 : ㄢタ俱计                             */
/*       块 : 程そ计                             */
/*戈挡篶: 患癹                                   */
/*******************************************************/
/*跑计嘿のノ硚                                   */
/*    divisor : 埃计                                   */
/*   dividend : 砆埃计                                 */
/*  remainder : 緇计                                   */
/*******************************************************/

#include <stdio.h>

int gcd(int dividend, int divisor);
void swap(int *x, int *y);

/*------------------------------------------*/
/*   患癹よΑ―ㄢタ俱计ぇ程そ计(GCD)  */
/*------------------------------------------*/
int gcd(int dividend, int divisor)
{
   int remainder;

   if (dividend < divisor)      /* 砆埃计 = 耕 */
      swap(&dividend,&divisor); /* 埃计 = 耕   */

   if (divisor !=0) {   /* 緇计 != 0 */         
      remainder = dividend % divisor;
      return gcd(divisor,remainder);   /* 患㊣gcd()ㄧ计 */
   }
   else
      return dividend;
}  

/*------------------------*/
/*   盢 x 籔 y ユ传   */
/*------------------------*/
void swap(int *x, int *y)
{
   int temp;

   temp = *x;
   *x = *y;
   *y = temp;
}

void main(void)
{ 
   clrscr( );
   printf("gcd(256,72) = %d\n",gcd(256,72)); 
}