#include<stdio.h>
#include<time.h> 
#include<math.h> 
int main(void){
	int i; 
	int print = 2; //宣告要判斷的數字，從2開始 
	int pf;      //宣告因數 
	time_t start = time(NULL);   //設定本程式開始的時間 (固定不變) 
	time_t end = time(NULL);     //設定目前的時間，與start相減用來計算已過的秒數 (出現一次end = time(NULL);end就改變一次) 
	while((end - start)<=10){     //已過秒數<=10才會繼續找 
		pf=print;                    // 重置因數，先假設因數為自己本身 
		for(i=2;i<=sqrt(print);i++){   //i為2到print開根號之間
			if(print%i==0){      //如果print能被整除
				pf=i;            //就更改因數 
				break;           //找到因數就不用繼續算下去 ，即跳出 
			}
		}
		if(pf==print){           //如果因數就是自己本身，亦同無法被1與自己以外的數整除，那print就是質數 
			printf("%d\n",print);//輸出print 
		}
		print++;                 //要繼續判斷下個數是否質數 ，所以print加一 
        end = time(NULL);        //設定目前的時間 
	}
	system("pause");
}
	
