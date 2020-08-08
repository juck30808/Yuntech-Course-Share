/*********************************************************/
/*【程式名稱】: 4_postfix.c                              */
/*【程式功能】: 將中置運算式轉換成後置運算式             */
/*【資料結構】: 陣列結構、堆疊                           */
/*       輸入 : 中置運算式                               */
/*       輸出 : 後置運算式                               */
/*********************************************************/
/*【變數名稱及用途】                                     */
/*    stack[] : 為一個陣列，它用來儲存堆疊資料           */
/*        top : 為一個陣列索引，它指向堆疊頂端           */
/* operator[] : 為一個陣列，它用來存放運算子             */
/* priority[] : 為一個陣列，它用來存放運算子的優先順序   */
/*********************************************************/

#include <stdio.h>

#define n 50
#define no_of_operator 6
#define true 1
#define false 0
 
int stack[n];
int top = -1;

/*----------------------------------------------*/
/*   operator[0]='('，其優先序為priority[0]=0   */
/*   operator[0]='+'，其優先序為priority[1]=1   */
/*   operator[0]='-'，其優先序為priority[2]=2   */
/*   operator[0]='*'，其優先序為priority[3]=3   */
/*   operator[0]='/'，其優先序為priority[4]=4   */
/*   operator[0]='^'，其優先序為priority[5]=5   */
/*----------------------------------------------*/
char operator[no_of_operator] = {'(','+','-','*','/','^'};
int  priority[no_of_operator] = {0,1,1,2,2,3}; 

int  empty(void);
int  full(void);
void push(char key);
char top_stack_data();
char pop(void);
int  precedence(char op);
void infix_to_postfix(char infix[], char postfix[]);

/*----------------------*/
/*   判斷是否為空堆疊   */
/*----------------------*/
int empty(void)
{
    return (top < 0) ? true : false;   
}

/*----------------------*/
/*   判斷堆疊是否滿溢   */
/*----------------------*/
int full(void)
{
   return (top >= n - 1) ? true : false;
}

/*-------------------------*/
/*   將資料 key 放入堆疊   */
/*-------------------------*/
void push(char stack_data)
{
   stack[++top] = stack_data;        
}

/*----------------------------------------*/
/*    查看堆疊頂端的資料為何?(並非刪除)   */
/*----------------------------------------*/
char top_stack_data()
{
   return stack[top];    
}

/*------------------------*/
/*   刪除堆疊頂端的資料   */
/*------------------------*/
char pop(void)
{
   return stack[top--];    
}

/*----------------------------*/
/*    傳回運算子 op 的優先序  */
/*----------------------------*/
int precedence(char op)
{
   int i;
   
   for(i=0; i < no_of_operator ; i++)
      if(operator[i] == op)
         return priority[i];
   return -1;
}

/*------------------------------------*/
/*   將中置式infix轉成後置式postfix   */
/*------------------------------------*/
void infix_to_postfix(char infix[], char postfix[])
{
   int i=0, j=-1;
   char x, y;

   while((x=infix[i++]) != '\0'){
      x = tolower(x);
      switch(x){
         case '(' : push(x);
                    break;
         case ')' : while(! empty() && (x=pop()) != '(')
                       postfix[++j]=x;
                    break;
         case '+' :
         case '-' :
         case '*' :
         case '/' : 
         case '^' : y=top_stack_data();
                    while(precedence(y) >= precedence(x)){
                       postfix[++j]=pop();
                       y=top_stack_data();
                    }
                    push(x);
                    break;
          default : /* x 為運算元 */
                    postfix[++j]=x;
      }
   }
   while(! empty())
      postfix[++j]=pop();
   postfix[++j]='\0';
}

void main(void)
{
   char infix[50], postfix[50];

   clrscr( );
   printf("==> 已經宣告一個容量為 %d 的堆疊 ! \n",n);

   while(true){
      printf("\n請輸入中置運算式(0:結束) : ");
      gets(infix);

      if(infix[0]=='0')
         break;
      else{
         infix_to_postfix(infix,postfix);
         printf("\n==>中置運算式 : %s ",infix);
         printf("\n==>後置運算式 : %s \n",postfix);
      }    
   }
}