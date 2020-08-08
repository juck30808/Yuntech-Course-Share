#include <stdio.h>
#include <stdlib.h>

//OXOOOXX，神奇數字11
//OXOO XX
//OX O XX
//OX   XX
// X   XX   > 11

//OXXXOOOOX，神奇數字7
//OXXXOOO X
//OXXXO O X
//OXXX  O X
//OXXX    X
// XXX    X  > 7

typedef struct Newnode{     //定義了一個Newnode的結構  別名為node      
	char data;              //Head -> data val next
	int val;
	struct Newnode *next;
}*node;                   

 
node add(node ,char);
int getx(node);
void def_val(node);

int main(){
	char input;
	int num=2, i;
	printf("請輸入串列(大寫英文)：");
	
	node head = NULL;		//head -> NULL
	while(scanf("%c",&input),head = add(head, input),getchar() !='\n'); 
	//朋友教法：當你換行時跳出去 OXOOOXX 
	node p = head;
	
	while (getx(head)){
		for (i = 0; i < num; i++){	
			p = p->next;		//連接到下一個節點 
			if (p->val == 1){   //碰到下船的 不計算他 i扣回來 
				i--;
			} 
		}
		if(p->data == 'O'){   //如果為O就下船 設val=1 
			p->val=1; 
		}else{
			def_val(head);     //OOXX最後如果為X時 神奇數字+1 並reset 
			num++;             //
			p = head;          //重頭開始 
		}
	}	
	printf("神奇數字為:%d\n",num);
	//system("pause");  //STOP
	return 0;
}


node add(node head, char data){
	node pnew = (node)malloc(sizeof(node));  //分配空間給新節點pnew 
	pnew->data = data;
	pnew->val = 0;         //還在船上 
	if (head == NULL){     //如果為全新節點(NULL) 
		head = pnew;        
		pnew->next = head; //新節點的next連接head 
	}else{
		node p = head;     
		while (p->next != head){
			p = p->next;
		}
		p->next = pnew;//鏈接新的節點
		pnew->next = head;//連到頭節點
	}
	return head;
}

int getx(node head){
	node p = head;           //head(p) ->NULL
	while (p->next != head){ //不停的循環
		if (p->data == 'O' && p->val!=1){  //代表該值是O 且VAL!=1(還沒下船) 
		return 1;
		}
		p = p->next;
	}
return 0;	
}

void def_val(node head){  //歸零計算 重新試算num 
	node p = head;
	p->val = 0;
	while(p->next != head){
		if (p->data == 'O' )
		p->val = 0;
		p = p->next;
	}
}


