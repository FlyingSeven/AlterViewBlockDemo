#AlterViewBlock  
##先从文档入手
###_`Declaring and Using a Block`_ 
####You use the ^ operator to declare a block variable and to indicate the beginning of a block literal. The body of the block itself is contained within {}, as shown in this example (as usual with C, ; indicates the end of the statement):
	int num = 7;
	int (^MyBlock)(int) = ^(int multiplier){ // 声明和实现
		return num * multiplier;
	};  
####经典的一张图   
##![][img1]
####block可以使用在它定义区块的变量，但是无法直接在作用域内更改，此时要添加*__block*.(**A powerful feature of blocks is that they can modify variables in the same lexical scope. You signal that a block can modify a variable using the __block storage type modifier.**)。  
###_`Using a Block Directly`_
	// qsort(void *, size_t, size_t, int (*)(const void *, const void *))
	
	char *myCharacters[3] = { "TomJohn", "George", "Charles Condomine" };
    qsort_b(myCharacters, 3, sizeof(char *), ^(const void *l, const void *r) {
    char *left = *(char **)l;
    char *right = *(char **)r;
    return strncmp(left, right, 1);
    });

####这点可以多加利用，相当于要获得某些变量时，比如我要获得某个bool型变量的值，这时我可能还要去做判断或者请求来确定，那直接用block来写，在block里去做这些事情，是很高效的一种写法。
###_`Block Functionality`_
> A block is an anonymous inline collection of code that:  
> * Has a typed argument list just like a function  
> * Has an inferred or declared return type  
> * Can capture state from the lexical scope[^1] within which it is defined  
> * Can optionally modify the state of the lexical scope  
> * Can share the potential for modification with other blocks defined within the same lexical scope  
> *Can continue to share and modify state defined within the lexical scope (the stack frame) after the lexical scope (the stack frame) has been destroyed 
 
###_`Declaring and Creating Blocks`_
	void (^blockReturningVoidWithVoidArgument)(void);
    int (^blockReturningIntWithIntAndCharArguments)(int, char);
    void (^arrayOfTenBlocksReturningVoidWithIntArgument[10])(int);

    float (^oneFrom)(float);
    oneFrom = ^(float aFloat) {
    float result = aFloat - 1.0;
    return result;
    };  
###_`Global Blocks`_
	#import <stdio.h>
	int GlobalInt = 0;
	int (^getGlobalInt)(void) = ^{ return GlobalInt; };

##然后简单罗列几种平时的用法：  
###_`属性用法：`_ 
	@property (nonatomic, copy) void (^Block)(); // 声明一个返回值为空，无参block属性
	@property (nonatomic, copy) NSString* (^Block)(NSString *); // 声明一个返回值为NSString类型，参数为NSString类型的block属性  
###_`typedef:`_
	typedef void(^Block)(); // 通上述属性用法第一个
	typedef NSString* (^Block)(NSString *); // 第二个
####这样可能调用的时候会更方便一些,比如
	@property (nonatomic, copy) block myBlock;
###_`在函数体里作为变量进行回调操作:`_
	
	- (void)workWithBlockOne:(Block)ablock{ // typedef 后直接作为变量
	  // ...
    }  
    - (void)workWithBlockTwo:(void(^)())ablock{ // 直接书写变量
     // ...
    }  
  

[img1]:https://github.com/FlyingSeven/AlterViewBlockDemo/blob/master/AlterViewBlockDemo/Resource/Screen%20Shot%202015-11-05%20at%209.49.20%20PM.png?raw=true "good!"
[^1]:变量定义区域.


