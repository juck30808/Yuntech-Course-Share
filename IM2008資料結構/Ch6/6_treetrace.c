/*****************************************************************/
/*【程式名稱】: 6_treetrace.c                                    */
/*【程式功能】: 樹的追蹤(含前序追蹤、中序追蹤、後序追蹤)         */
/*【資料結構】: singly linked list, tree, stack                  */
/*****************************************************************/
/*【變數名稱及用途】                                             */
/*     stack[] : 用來將中置式轉後置式之堆疊                      */
/*         top : stack[]堆疊之頂端指標                           */
/*stack_node[] : 用來將建構二元樹之堆疊                          */
/*    top_node : stack_node[]堆疊之頂端指標                      */
/* struct node : 定義tree之節點結構，包括data欄及left,right鏈結欄*/
/*****************************************************************/

#include <stdio.h>

#define N 50
#define OP 5
#define STZCK_SIZE 100
#define true 1
#define false 0

int top = -1;
int top_node = -1;
char data[STZCK_SIZE];
static char op[OP] = {'(','+','-','*','/',};
static int  op_priority[5]={0,1,1,2,2};
struct node{
   char data;
   struct node *left;
   struct node *right;
};
struct node *stack_node[STZCK_SIZE];

int stack_empty(void);
int stack_full(void);
void stack_push(char key);
char stack_top_data(void);
char stack_pop(void);
void to_postfix(char infix[], char postfix[]);

int priority(char c);
struct node *bin_tree(char postfix[]);
void push_node(struct node *c);
struct node *pop_node(void);
void preorder(struct node *root);


/*----------------------*/
/*   判斷是否為空堆疊   */
/*----------------------*/
int stack_empty(void)
{
    return (top < 0) ? true : false;
}

/*----------------------*/
/*   判斷堆疊是否滿溢   */
/*----------------------*/
int stack_full(void)
{
   return (top >= N - 1) ? true : false;
}

/*-------------------------*/
/*   將資料 key 放入堆疊   */
/*-------------------------*/
void stack_push(char key)
{
   data[++top] = key;
}

/*------------------------*/
/*   傳回堆疊頂端的資料   */   
/*------------------------*/
char stack_top_data(void)
{
   return data[top];
}

/*------------------------------------*/
/*   傳回堆疊頂端的資料，但並非取出   */
/*------------------------------------*/
char stack_pop(void)
{
   return data[top--];
}

/*------------------------------------*/
/*   將中置式infix轉成後置式postfix   */
/*------------------------------------*/
void to_postfix(char infix[], char postfix[])
{
   int i=0, j=-1;
   char x, y;

   while((x=infix[i++]) != '\0'){
      x = tolower(x);
      switch(x){
         case '(' : stack_push(x);
                    break;
         case ')' : while(! stack_empty() && (x=stack_pop()) != '(')
                       postfix[++j]=x;
                    break;
         case '+' :
         case '-' :
         case '*' :
         case '/' : y=stack_top_data();
                    while(priority(y) >= priority(x)){
                       postfix[++j]=stack_pop();
                       y=stack_top_data();
                    }
                    stack_push(x);
                    break;
          default : /* x 為運算元 */
                    postfix[++j]=x;
      }
   }
   while(! stack_empty())
      postfix[++j]=stack_pop();
   postfix[++j]='\0';
}

/*---------------------------*/
/*   傳回運算子 c 的優先序   */
/*---------------------------*/
int priority(char c)
{
   int i;
   
   for(i=0; i < OP; i++)
      if(op[i] == c)
         return op_priority[i];
   return -1;
}

/*---------------------------------------------------*/
/*   將postfix轉成二元樹方式來儲存，並傳回樹根節點   */
/*---------------------------------------------------*/
struct node *bin_tree(char postfix[])
{
   int i = 0;
   char x;
   struct node *new_node;

   while((x = postfix[i++]) != '\0'){
      new_node = (struct node *) malloc(sizeof(struct node));
      new_node->data = x;
      if(x >= 'a' && x <= 'z'){   /* x is operand */
         new_node->left = NULL;
         new_node->right = NULL;
      }
      else{                       /* x is operator */
         new_node->right = pop_node();
         new_node->left = pop_node();
      }
      push_node(new_node);
   }
   return pop_node();
}

/*--------------------*/
/*   將節點放入堆疊   */
/*--------------------*/
void push_node(struct node *c)
{
   if(top_node < STZCK_SIZE)
      stack_node[++top_node] = c;
   else
      printf("堆疊 stack_node 已滿 !!\n");
}

/*------------------------*/
/*   自堆疊頂端取出節點   */
/*------------------------*/
struct node *pop_node(void)
{
   if(top_node >= 0)
      return stack_node[top_node--];
   else
      printf("堆疊 stack_node 已空 !!\n");
}

/*------------------*/
/*   進行前序追蹤   */
/*------------------*/
void preorder(struct node *root)
{
   if(root != NULL){
      printf("%c",root->data);
      preorder(root->left);
      preorder(root->right);
   }
}

/*------------------*/
/*   進行中序追蹤   */
/*------------------*/
void inorder(struct node *root)
{
   if(root != NULL){
      inorder(root->left);
      printf("%c",root->data);
      inorder(root->right);
   }
}


/*------------------*/
/*   進行後序追蹤   */
/*------------------*/
void postorder(struct node *root)
{
   if(root != NULL){
      postorder(root->left);
      postorder(root->right);
      printf("%c",root->data);
   }
}

void main(void)
{
   int i, j, l;
   char x, y, infix[N], postfix[N];
   struct node *head;

   clrscr( );
   printf("請輸入中置式 : ");
   gets(infix);

   /*------------------------*/
   /*   將中置式轉成後置式   */
   /*------------------------*/
   to_postfix(infix,postfix);
   printf("\n中置式 : %s 的後置式為 : %s \n",infix ,postfix);

   /* cout << "\n中置式 : " << infix << " 的後置式為 : " << postfix << endl;*/
 
   /*----------------*/
   /*   建構二元樹   */ 
   /*----------------*/
   head = bin_tree(postfix);

   /*--------------*/
   /*   前序追蹤   */
   /*--------------*/
   printf("\n前序追蹤結果為 ==> ");
   preorder(head);
   printf("\n");

   /*--------------*/
   /*   中序追蹤   */
   /*--------------*/
   printf("\n中序追蹤結果為 ==> ");
   inorder(head);
   printf("\n");

   /*--------------*/
   /*   後序追蹤   */
   /*--------------*/
   printf("\n後序追蹤結果為 ==> ");
   postorder(head);
   printf("\n");
}