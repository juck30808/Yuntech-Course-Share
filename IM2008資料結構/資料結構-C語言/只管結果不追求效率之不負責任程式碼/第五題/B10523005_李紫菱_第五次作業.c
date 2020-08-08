#include<stdio.h>
#include<stdlib.h> 
struct Node{
//宣告結構，包含左子樹、右子樹、值、高度平衡因子 
    int key;
    struct Node *left;
    struct Node *right;
    int height;
};
int max(int a, int b);
int height(struct Node *N){
	//計算腳的長度 
    if (N == NULL)
        return 0;
    return N->height;
}
int max(int a, int b){
	//找最大值回傳 
    return (a > b)? a : b;
}
struct Node* newNode(int key){
	//新增個全新的節點且高度平衡因子為1 
    struct Node* node = (struct Node*)malloc(sizeof(struct Node));
    node->key   = key;
    node->left   = NULL;
    node->right  = NULL;
    node->height = 1;
    return(node);
}
struct Node *rightRotate(struct Node *y){
	//右旋轉 
    struct Node *x = y->left;
    struct Node *T2 = x->right;
    x->right = y;
    y->left = T2;
    
    //以下為計算平衡因子
    y->height = max(height(y->left), height(y->right))+1;
    x->height = max(height(x->left), height(x->right))+1;
	//以上為計算平衡因子 
    return x;
}
struct Node *leftRotate(struct Node *x){
	//左旋轉 
    struct Node *y = x->right;
    struct Node *T2 = y->left;
    y->left = x;
    x->right = T2;
 
    //以下為計算平衡因子
    x->height = max(height(x->left), height(x->right))+1;
    y->height = max(height(y->left), height(y->right))+1;
	//以上為計算平衡因子 
    return y;
}
int getBalance(struct Node *N){
    if (N == NULL){ //如果=NULL就代表沒有子樹，所以平衡因子就=0 
        return 0;
    } 
    return height(N->left) - height(N->right);//平衡因子=左腳長度減右腳長度 
} 
struct Node* insert(struct Node* node, int key){
    //以下為新增節點 
    if (node == NULL){ 
    //如果此樹為空樹，就直接新增節點 
        return(newNode(key));
	} 
    if (key < node->key){ 
    //如果要新增的值比目前的值還小
		//就往左找 
        node->left  = insert(node->left, key);
    }else if (key > node->key){ 
    //如果要新增的值比目前地值還大
		//就往右找 
        node->right = insert(node->right, key);
    }else{
    	//直到找到適合洞，就插入 
        return node;
	} 
	//以上為新增節點 
	//以下為平衡AVL tree 
    node->height = 1 + max(height(node->left),height(node->right));//計算左右腳長度 
    int balance = getBalance(node);//進入getBalance計算平衡因子 
    if (balance > 1 && key < node->left->key){ 
    //如果左邊的左腳比較長，就直接做右旋轉 
        return rightRotate(node);
	} 
    if (balance < -1 && key > node->right->key){ 
    //如果右邊的右腳比較長，就直接做左旋轉 
        return leftRotate(node);
	} 
    // Left Right Case
    if (balance > 1 && key > node->left->key){
    //如果是左邊的右腳比較長，就讓他先旋轉成左邊的左腳比較常長 
        node->left =  leftRotate(node->left);
        //然後再執行右旋轉 
        return rightRotate(node);
    }
    // Right Left Case
    if (balance < -1 && key < node->right->key){
    //如果是右邊的左腳比較長，就他先旋轉成右邊的右腳比較長  
        node->right = rightRotate(node->right);
        //然後再執行左旋轉 
        return leftRotate(node);
    }
    //以上為平衡AVL tree 
    return node;
}
struct Node * minValueNode(struct Node* node){
	//回傳最小值(最左邊的值 
    struct Node* current = node;
    while (current->left != NULL){
	//一直往左找，直到最左邊為止 
        current = current->left;
	} 
    return current;
}
struct Node* deleteNode(struct Node* root, int key){
	//以下為刪除節點 
    if (root == NULL){
		printf("查無此值\n"); 
        return root;
	} 
    if ( key < root->key ){ 
		//如果要刪除的數字比目前的數字小，就繼續往左找 
        root->left = deleteNode(root->left, key); 
    }else if( key > root->key ){ 
		//如果要刪除的數字比目前的數字大，就繼續往右找
        root->right = deleteNode(root->right, key);
    }else if(key == root->key ){
    	//找到要刪除的值時 
        if( (root->left == NULL) || (root->right == NULL) ){
        	//如果只有左子樹或右子樹其中一個時的狀況 
				//若左子樹不為空 令temp=左子樹
				//若左子樹為空 令temp=右子樹 
            struct Node *temp = root->left ? root->left :
                                             root->right;
            if (temp == NULL){
            //如果temp=NULL代表左右子樹都是空的，就直接刪掉 
                temp = root;
                root = NULL;
            }else{
            //temp不為空就用子樹取代自己 
             *root = *temp; // Copy the contents of
                            // the non-empty child
            } 
            free(temp);
        }else{
        	//如果左右子樹都有的話 
            //找右邊最小的值取代自己(其餘不變) 
            struct Node* temp = minValueNode(root->right);
            root->key = temp->key;
            root->right = deleteNode(root->right, temp->key);
        }
        printf("刪除%d",key);
    }
    if (root == NULL){ //目前AVL tree為空樹 
    	return root;
	} 
	//以上為刪除節點 
    //以下為平衡AVL tree
    root->height = 1 + max(height(root->left),height(root->right));//計算左右腳長度 
    int balance = getBalance(root);//進入getBalance計算平衡因子 
    if (balance > 1 && getBalance(root->left) >= 0){ 
    //如果是左邊的左腳比較長，就直接做右旋轉 
        return rightRotate(root); 
	} 
    if (balance < -1 && getBalance(root->right) <= 0){
    //如果是右邊的右腳比較長，就直接左旋轉 
        return leftRotate(root);
	}
    if (balance > 1 && getBalance(root->left) < 0){
    //如果是左邊的右腳比較長，就讓他先旋轉成左邊的左腳比較常長 
        root->left =  leftRotate(root->left);
        //然後再執行右旋轉 
        return rightRotate(root);
    }
    if (balance < -1 && getBalance(root->right) > 0){
    //如果是右邊的左腳比較長，就他先旋轉成右邊的右腳比較長 
        root->right = rightRotate(root->right);
        //然後再執行左旋轉 
        return leftRotate(root);
    }
    //以上為平衡AVL tree
    return root;
}
void preOrder(struct Node *root){
	//遞迴印出目前的AVL tree 
    if(root != NULL){ 
        printf("%d ", root->key);
        preOrder(root->left);//先印左邊印完再印右邊 
        preOrder(root->right);
    }
}
int main(){
	struct Node *root = NULL;
	printf("請輸入指令，插入為i，刪除為d(ex：i 5,d 7)，輸入Q停止：\n");
	char input='\0';
	int num ;
	scanf(" %c",&input);
	while(input!='Q'){//只要不是Q就繼續執行 
		if((input =='i')||(input=='d')){ 
			scanf("%d",&num);
			if(input =='i'){ //如果是i就insert 
				root = insert(root,num);
				printf("插入%d",num);
			}else{//如果是d就delete 
				root = deleteNode(root, num);
			}
			printf("目前AVL tree：");
			preOrder(root);
			printf("\n");
			printf("請輸入指令，插入為i，刪除為d(ex：i 5,d 7)，輸入Q停止：\n");
			scanf(" %c",&input);
		}else if(input !='\0'){//不是i d Q就代表輸入錯誤 
			printf("輸入錯誤，請請輸入指令，插入為i，刪除為d，(ex：i 5,d 7)，輸入Q停止：\n");
			scanf(" %c",&input);
		}
	}
    return 0;
}
