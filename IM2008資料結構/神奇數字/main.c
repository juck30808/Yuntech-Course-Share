#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

typedef struct node{                 //type + def
	int data;
	struct node *next;
}list_node;

typedef list_node *list_pointer;  //指向節點的指標 

list_pointer head,current,previous; 	//新增三個指標 


initialize(){
	head = (list_pointer)malloc(sizeof(list_node));
	head->next = NULL;
}

//插入  1.新增ptr空間定值 2.前一個為頭 3.current = head->next; 4.ptr下一個為next 
/*	previous=head -> current	previous->	ptr -> current
   			 	 						value  next 
*/
insert(int value){			
	list_pointer ptr; //新增一個指標 
	ptr = (list_pointer)malloc(sizeof(list_pointer));
	ptr->data = value;
	previous = head;	//改變首點
	current = head->next;
	while((current != NULL)&&(current->data < ptr->data)){   //大於小於可以改變排列順序 
		previous = current;			//previoud	->	current  (一直下去直到current->value) 
		current = current->next;	//(current)
	}ptr->next = current;			//
	previous->next = ptr;
} 

//印出所有 

traverse(){
	if(head->next == NULL){
		printf("串列是空的");	
	}else{
		current = head->next;
		while(current != NULL){
			printf("%d   ",current->data);
			current = current->next;
		}
	}
}

int count(){
	int length=0;
	current =head->next;
	while(current != NULL){
		length ++;
		current = current->next;
	}printf("Y %d ",length);
	return length;
}
int main(int argc, char *argv[]) {
	initialize();
	insert(30);
	insert(40);
	insert(60);
	insert(80);
	count();
	traverse();
}
