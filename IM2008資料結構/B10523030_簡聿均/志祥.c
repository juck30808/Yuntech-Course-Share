#include <stdio.h>
#include <stdlib.h>

typedef struct Linknode{
	char data;
	int val;
	struct Linknode *pNext;
}node,*PNODE;       //PNODE一個連結串列類型的指標

PNODE addback(PNODE ,char);//尾插
int getx(PNODE);
void def_val(PNODE);

PNODE addback(PNODE phead, char data){    //尾部插入
	PNODE pnew = (PNODE)malloc(sizeof(node));
	pnew->data = data;
	pnew->val = 0;
	if (phead == NULL){
		phead = pnew;
		pnew->pNext = phead;//一個節點的環
	}else{
		PNODE p = phead;
		while (p->pNext != phead){
			p = p->pNext;
		}
		p->pNext = pnew;//鏈接新的節點
		pnew->pNext = phead;//連到頭節點
	}
	return phead;
}

int getx(PNODE phead){
	PNODE p = phead;
	while (p->pNext != phead){ //不停的循環到頭節點 判斷 
		if ((p->data == 'o' || p->data == 'O' )&& p->val!=1)
		return 1;
		p = p->pNext;
	}
return 0;	
}

void def_val(PNODE phead){
	PNODE p = phead;
	p->val = 0;
	while(p->pNext != phead){
		if (p->data == 'o' || p->data == 'O' )
		p->val = 0;
		p = p->pNext;
	}
}

int main(){
	PNODE phead = NULL;//頭節點
	char input;
	int tmp = 2,i;
	printf("請輸入串列內容:");
	while(scanf("%c",&input),phead = addback(phead, input),getchar()!='\n');
	PNODE p = phead;
	while (getx(phead)){
		for (i = 0; i < tmp; i++){	
			p = p->pNext;//循環
			if (p->val == 1)
			i--;
		}
		if(p->data == 'o' || p->data == 'O' ){ 
			p->val=1; 
		}else{
			def_val(phead);
			tmp++;
			p = phead;
		}
	}	
	printf("神奇數字:%d\n",tmp);
	return 0;
}


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

