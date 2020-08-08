#include <stdio.h>
#include <stdlib.h>


struct Node {
    char data;
    Node *next;
    Node *go; 
};

int main(void)
{
	char input;
	int node_num=0;
	int magic_num=0;
	int O_num=0;
	int n;
	int i;
	Node *first;       
	first = new Node;
	Node *newNode;        
	newNode = new Node;	
	Node *preNode;        
	preNode = new Node;	
	Node *nowNode;        
	nowNode= new Node;

	
	printf("請輸入OX 到-999停止 \n");
	scanf(" %c",&input);
	first->data = input;
	 node_num++;

	scanf(" %c",&input);
	 node_num++;
	nowNode->data = input;
	first->next=nowNode;


	scanf(" %c",&input);
	while(input=='o' || input=='x' ){		 
	 	node_num++; 
		newNode = new Node;		
		newNode->data=input;	
		newNode->next=0;
		newNode->go=nowNode; 
		nowNode->next=newNode;		
		nowNode=newNode;	
		scanf(" %c",&input);
	}
	
	
	nowNode->next=first;
	newNode->go=nowNode;
	nowNode=first;
    
			
	int flag=0;
	int flag_2=0;
	while(flag==0){
		 nowNode=first;
		 magic_num++;
		 printf("magic_num=%d  \n",magic_num);		
		 flag_2=0;	 
		 O_num=0;			
		 bool directions=true;
			
		 while(flag_2==0){		
		  O_num=0; 	
		 	//printf("80 flag=%d  \n",flag_2);
			/*圈數量=0 等於OK*/ 
		 	/*計算O數量*/
		 	
			
			/*output */
			for (i =1;i<=node_num;i++){	
				printf("--  103 %c\n",nowNode->data);
				nowNode=nowNode->next;
			}
			while(nowNode->data=='Z'){
			 	nowNode=nowNode->next;
			 	printf("--  123123 %c\n",nowNode->data);
			}
			//printf("95 nowdata=%c \n",nowNode->data);
			if(directions) {
				for (i = 0 ; i< magic_num-1; i++) {
			 		nowNode=nowNode->next;	
					while(nowNode->data=='Z'){
				 		nowNode=nowNode->next;
					}	 	
				}
			}
			else {
				for (i = 0 ; i< magic_num-1; i++) {
			 		nowNode=nowNode->go;	
					while(nowNode->data=='Z'){
				 		nowNode=nowNode->go;
					}	 	
				}
			}
			printf("98 nowdata=%c \n",nowNode->data);
		    if (nowNode->data=='o'){			
		 		nowNode->data='Z';		 	
			}
			if (nowNode->data=='x'){	
			
				flag_2=1;
				printf("110 flag=%d  \n",flag_2);
			}
			for (i =1;i<=node_num;i++){	
				if (nowNode->data=='o'){					
					O_num++;					
				}			
				nowNode=nowNode->next;
			}
			printf("108 O_num=%d  \n",O_num);
			if (O_num==0){
				flag_2=1;		
				flag=1;		
			}
		 }
		 
		 
		 
		 
		 	for (i =1;i<=node_num;i++){	
				if (nowNode->data=='Z'){
					nowNode->data='o';
				}
				nowNode=nowNode->next;
			}
			nowNode=first;
			
			
	}
  	printf("%d  \n",magic_num);		
    system("pause");
}
