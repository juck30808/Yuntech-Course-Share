#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<stdbool.h>
struct node{    //宣告struct結構，包含id、link 
		char id;
		struct node *link;
struct node *link_back;
	};
int main(void){
    //宣告front(鏈結開端) new_node(新的鏈結) rear(鏈結尾端)使用node結構 
	struct node *front, *new_node,*rear,*temp_node,*this_node;
	front =(struct node *) malloc(sizeof(struct node));
	rear =(struct node *) malloc(sizeof(struct node));
	temp_node =(struct node *) malloc(sizeof(struct node));
	this_node =(struct node *) malloc(sizeof(struct node));
	//宣告複製用的鏈結 
	struct node *front_c, *new_node_c,*rear_c,*temp_node_c,*this_node_c;
	front_c =(struct node *) malloc(sizeof(struct node));
	rear_c =(struct node *) malloc(sizeof(struct node));
	this_node_c =(struct node *) malloc(sizeof(struct node));
	temp_node_c =(struct node *) malloc(sizeof(struct node));
	//初始化front rear的link為空 
	front->link = NULL;
	front->link_back =NULL;
	rear->link = NULL;
	rear->link_back =NULL;
	char input='\0';
	int count =0;   //節點個數 
	int countO =0;  //要下船的水手人數 
	//一次輸入一個，S=Stop ，所以當輸入到S就停止輸入，並開始計算神奇數字 
	printf("請逐一輸入要排入的人(O或X)(輸入S停止輸入)：\n");
	scanf(" %c",&input); //前面要記得加空白，不然會scanf到多餘的 
	printf("%c\n",input);
	while(input!='S'){
		//如果是O/X才把他加到鏈結內，其餘顯示錯誤，並請使用者重新輸入 
		if((input =='O')||(input=='X')){ 
			if(input =='O'){
				countO ++;
			}
			//以下為增加新鏈結程式碼 
			new_node =(struct node *) malloc(sizeof(struct node));
			new_node->id=input;
			new_node->link = NULL;
			new_node->link_back =NULL;
			if(front->link == NULL){
				front->link =new_node;
				rear->link =new_node;
			}else{
				rear->link->link =new_node;
				new_node->link_back =rear->link ;
				rear->link =new_node;
			}
			//以上為增加新鏈結程式碼  
			count++;	
			printf("請逐一輸入要排入的人(O或X)(輸入S停止輸入)：\n");
			scanf(" %c",&input);
			printf("%c\n",input);
		}else if(input !='\0'){
			printf("輸入錯誤，請逐一輸入要排入的人(O或X)(輸入S停止輸入)：\n");
			scanf(" %c",&input);
			printf("%c\n",input);
		}
		
	}
	new_node->link =front->link ;
	front->link->link_back =new_node;
	//以下為copy
	front_c ->link =NULL;
	rear_c ->link =NULL;
	this_node_c = front->link ;
	int i;
	for( i=0;i<count;i++){
		new_node_c =(struct node *) malloc(sizeof(struct node));
		new_node_c->id=this_node_c->id ;
		new_node_c->link = NULL;
		new_node_c->link_back =NULL;
		if(front_c->link == NULL){
			front_c->link =new_node_c;
			rear_c->link =new_node_c;
		}else{
			rear_c->link->link =new_node_c;
			new_node_c->link_back =rear_c->link ;
			rear_c->link =new_node_c;
		}
		this_node_c = this_node_c->link ;
	}
	new_node_c->link =front_c->link;
	front_c->link->link_back =new_node_c;
	//以上為copy
	//印出目前鏈結 
	this_node_c =front_c->link ;
	for(i=0;i<count;i++){
		printf("%c\n",this_node_c->id );
		this_node_c=this_node_c->link ;
	}
	//印出目前鏈結 
	//以下為算神奇數字 
	int num =1 ;             //神奇數字 
	this_node_c = front_c->link ;
	int countO_c = countO;   //要下船的水手人數 
	int count_c = count;     //節點個數 
	printf("%d目前還須找%d個水手下水\n",num,countO);
	bool dir =true;  //宣告dir(作為判斷順逆的依據 
	while(countO_c >0){
		//以下決定是順時針還是逆時針  
		if(dir){
			printf("next順\n");
			for( i =0;i<num;i++){;
				this_node_c = this_node_c->link ;
			}	
		}else{
			printf("next逆\n");
			for( i =0;i<num;i++){
				this_node_c = this_node_c->link_back  ;
			}
		}
		//以上決定是順時針還是逆時針 
		if(this_node_c ->id =='O'){  //如果是O就移除此節點，將要下船的水手人數減一 
			printf("找到O\n");
			countO_c--;
			printf("%d目前還須找%d個水手下水\n\n",num,countO_c);
			//如果要移除的節點是頭或尾的話，要更新，以免出現front/rear->link=NULL的情形 
			if(this_node_c ==front_c->link ){    
				front_c->link =this_node_c ->link;
			}
			if(this_node_c ==rear_c->link ){
				rear_c->link = this_node_c->link_back ;
			}
			//移除此鏈結 
			this_node_c->link_back->link = this_node_c->link ;
			this_node_c->link->link_back =this_node_c->link_back ;
			if(dir){
				this_node_c = this_node_c->link ; 
				dir = false;
			}else{
				this_node_c = this_node_c->link_back ;
				dir = true;
			}
			//移除此鏈結 
			count_c--;
			//印出目前鏈結 
			printf("接著用下面鏈結找O\n");
			this_node =front_c->link ;
			for(i=0;i<count_c;i++){
				printf("%c\n",this_node->id );
				this_node=this_node->link ;
			}
			//印出目前鏈結 
		}else{
			//神奇數字往上加一，其餘數值初始化 
			num++;
			countO_c=countO;
			count_c=count;
			printf("可惜要重來\n\n");
			printf("%d目前還須找%d個水手下水\n",num,countO_c);
			dir =true;
			//以下為copy
			front_c ->link =NULL;
			rear_c ->link =NULL;
			this_node_c = front->link ;
			int i;
			for( i=0;i<count;i++){
				new_node_c =(struct node *) malloc(sizeof(struct node));
				new_node_c->id=this_node_c->id ;
				new_node_c->link = NULL;
				new_node_c->link_back =NULL;
				if(front_c->link == NULL){
					front_c->link =new_node_c;
					rear_c->link =new_node_c;
				}else{
					rear_c->link->link =new_node_c;
					new_node_c->link_back =rear_c->link ;
					rear_c->link =new_node_c;
				}
				this_node_c = this_node_c->link ;
			}
			new_node_c->link =front_c->link;
			front_c->link->link_back =new_node_c;
			//以上為copy
			//印出目前鏈結 
			printf("接著用下面鏈結找O\n");
			this_node =front_c->link ;
			for(i=0;i<count_c;i++){
				printf("%c\n",this_node->id );
				this_node=this_node->link ;
			}
			//印出目前鏈結 
			this_node_c = front_c->link ; //把this_node_c指回最前面(front_c) 
		}
	}
	//以上為算神奇數字 
	printf("\n神奇數字為：%d\n",num);
	system("pause");

}
