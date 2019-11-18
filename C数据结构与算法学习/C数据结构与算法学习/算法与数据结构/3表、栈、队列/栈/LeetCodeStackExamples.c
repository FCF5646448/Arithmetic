//
//  LeetCodeStackExamples.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/19.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "LeetCodeStackExamples.h"
#include <String.h>
#include <stdlib.h>

/*
 S.length <= 10000
 S[i] 为 "(" 或 ")"
 S 是一个有效括号字符串
 */
// 这个函数会存在堆栈溢出
char * removeOuterParentheses(char * S){
    
    if (*S == '\0') {
        return S;
    }
    S++;
    
    int i=0;
    int L=1;
    int R=0;
    
    char ans[10000] = {'\0'};
    //
    while (*S != '\0') {
        if (*S == '(') {
            L++;
        }else{
            R++;
        }
        if (R != L) {
            ans[i++] = *S;
        }else{
            S++; //注意这里要跳一次，让第一次出现的最外层括号略过
            L = 1;
            R = 0;
        }
        if (*S == '\0') {
            break;
        }
        S++;
    }
    
    char * r = ans;
    return r;
}



// 这个解题思路是要有个标志位来标志当前左括号的数
char * removeOuterParentheses2(char * S){
    if (*S == '\0'){
        return NULL;
    }
    char r[10000]={'\0'} ;
    
    int x = 0;
    int i = 0;
    while(*S != '\0'){
        if (*S == '(' && x== 0){
            x++;
        }else if (*S == '('){
            r[i] = '(';
            i++;
            x++;
        }else if(*S ==')' && x > 1){
            r[i] = ')';
            i++;
            x--;
        }else{
            x--;
        }
        S++;
    }
    char *o =r;
    return o;
}

char * removeOuterParentheses3(char * S){
    int L=1;
    int R=0;
    int index = 0;
    if (*S == '\0') {
        return S;
    }
    S++;
    char * t;
    char ans[10000] = {'\0'};
    
    int i=0;
    for (t = S; *t != '\0'; t++) {
        if (*t == '(') {
            L++;
        }else{
            R++;
        }
        if (R != L) {
            ans[i++] = *t;
        }else{
            t++;
            L = 1;
            R = 0;
        }
        if (*t=='\0'){
            break;
        }
    }
    char* o=ans;
    return o;
}


//记录比分
/*
 你现在是棒球比赛记录员。
 给定一个字符串列表，每个字符串可以是以下四种类型之一：
 1.整数（一轮的得分）：直接表示您在本轮中获得的积分数。
 2. "+"（一轮的得分）：表示本轮获得的得分是前两轮有效 回合得分的总和。
 3. "D"（一轮的得分）：表示本轮获得的得分是前一轮有效 回合得分的两倍。
 4. "C"（一个操作，这不是一个回合的分数）：表示您获得的最后一个有效 回合的分数是无效的，应该被移除。
 
 每一轮的操作都是永久性的，可能会对前一轮和后一轮产生影响。
 你需要返回你在所有回合中得分的总和。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/baseball-game
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 //注：
 char ** 与 char *[] 的区别：https://blog.csdn.net/daiyutage/article/details/8604720
 */
int calPoints(char ** ops, int opsSize){
    if (opsSize <= 0) {
        return 0;
    }
    
    int sum = 0;
    
    int score[1000] = {0}; //表示每一轮有效回合得分
    int index = 0;
    
    for (int i = 0; i<opsSize; i++) {
        char * temp = ops[i];
        printf("%s ", temp);
        if (*temp == 'C') {
            //取上一个值
            index -= 1;
            if (index >= 0) {
                int tempS = score[index];
                sum -= tempS; //移除最后一个有效得分
            }else{
                break;
            }
        }else if (*temp == 'D') {
            int tempIndx = index;
            tempIndx -= 1;
            if (tempIndx >= 0) {
                int tempS = score[tempIndx];
                score[index] = tempS*2;
                sum += tempS*2;
                index++;
            }else{
                break;
            }
            
        }else if (*temp == '+') {
            int tempIndx = index;
            tempIndx -= 1;
            if (tempIndx >= 0) {
                int tempSum = 0;
                int tempS = score[tempIndx];
                tempSum += tempS;
                tempIndx -= 1;
                if (tempIndx >= 0) {
                    int tempS1 = score[tempIndx];
                    tempSum += tempS1;
                }
                score[index] = tempSum;
                sum += tempSum;
                index++;
                
            }else{
                break;
            }
        }else{
            int s = atoi(temp);
            sum += s;
            score[index++] = s;
        }
    }
    
    return sum;
}


//LeetCode 1047 删除字符串中所有相邻重复项
/*
 输入："abbaca"
 输出："ca"
 解释：
 例如，在 "abbaca" 中，我们可以删除 "bb" 由于两字母相邻且相同，这是此时唯一可以执行删除操作的重复项。之后我们得到字符串 "aaca"，其中又只有 "aa" 可以执行重复项删除操作，所以最后的字符串为 "ca"。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-all-adjacent-duplicates-in-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 1 <= S.length <= 20000
 S 仅由小写英文字母组成。
 
 解析： 这道题最主要的是赋值的先后顺序性
 */

char * removeDuplicates(char * S){
    if (S == NULL) {
        return S;
    }
    
    printf("%lu",strlen(S));
    
    char C[200000] = {'\0'}; //注意这个数组大小
    int index = 0;
    char last = '\0';
    while (*S != '\0') {
        C[index] = *S;
        if (index > 0) {
            int tempIndex = index - 1;
            last = C[tempIndex];
        }
        
        if (last == C[index]) {
            // 减两次
            C[index--] = '\0';
            C[index--] = '\0';
            last = '\0';
        }
        
        
        index++;
        
        S++;
    }
    
    char * o = C;
    return o;
}


/*
 给定两个没有重复元素的数组 nums1 和 nums2 ，其中nums1 是 nums2 的子集。找到 nums1 中每个元素在 nums2 中的下一个比其大的值。
 
 nums1 中数字 x 的下一个更大元素是指 x 在 nums2 中对应位置的右边的第一个比 x 大的元素。如果不存在，对应位置输出-1。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/next-greater-element-i
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 // 解题：注意是要找比当前元素大的下一个值，之前的值是不需要比较的。
 // 技巧：单调栈
 */
// LeetCode不通过，不知道为啥  o(╥﹏╥)o， 后续发现 returnSize的主要作用是返回 return数组的size，而不是依赖于外部参数。这样就可以通过了。
int* nextGreaterElement(int* nums1, int nums1Size, int* nums2, int nums2Size, int* returnSize){
    int lastIndex = -1; //初始无值
    int *Stack = (int *)malloc(nums2Size*sizeof(int));
    
    *returnSize = nums1Size;
    int *p = (int *)malloc(nums1Size*sizeof(int));

    for (int i=0; i<nums1Size; i++) {
        int findX = nums1[i];
        for (int j=nums2Size-1; j>=0; j--) {
            int tempNum = nums2[j];
            if(tempNum > findX) {
                // 只将大于查找数的数放到栈里
                // 将栈里小于当前的入栈数出栈，保持栈的单调性
                while (lastIndex >= 0 && Stack[lastIndex] < tempNum) {
                    Stack[lastIndex--] = -1; //丢弃小的数
                }
                Stack[++lastIndex] = tempNum;
            }else if (tempNum == findX) {
                break;
            }
        }
        if (lastIndex >= 0) {
            //找到了
            p[i] = Stack[lastIndex];
        }else{
            //没找到
            p[i] = -1;
        }
        lastIndex = -1;
    }
    free(Stack);
    return p;
}

//单调栈的简单实践
void testnextGreaterElement1(int* nums2, int nums2Size,int targetNum) {
    //1、 给定1个数，怎么使用单调栈查找后一个更大值
    // 从后往前查找，
    int findX = targetNum; //假设查找的值
    int lastIndex = -1; //初始无值
    int Stack[1000] = {-1};
    
    for (int j=nums2Size-1; j>=0; j--) {
        int tempNum = nums2[j];
        if(tempNum > findX) {
            // 只将大于查找数的数放到栈里
            // 将栈里小于当前的入栈数出栈，保持栈的单调性
            while (lastIndex >= 0 && Stack[lastIndex] < tempNum) {
                Stack[lastIndex--] = -1; //丢弃小的数
            }
            Stack[++lastIndex] = tempNum;
        }else if (tempNum == findX) {
            break;
        }
    }
    
    if (lastIndex >= 0) {
        printf("%d 's next GreaterElement is %d",targetNum,Stack[lastIndex]);
    }else{
        printf("no next GreaterElement for %d",targetNum);
    }
    
}

/**********************************************************/
/*************************test**************************/
/**********************************************************/

void testremoveOuterParentheses() {
    char *S = "(()())(())";
    char * r = removeOuterParentheses3(S);
    printf("%s",r);
}

void testcalPoints() {
    char * opsArr[] = {"5","-2","4","C","D","9","+","+"};
    char ** ops = opsArr;
    int r = calPoints(ops,8);
    printf("\nresult:%d\n",r);
}


void testremoveDuplicates() {
    char * S = "aaaaaaaaa";
    char * r = removeDuplicates(S);
    printf("%s \n",r);
}


void testnextGreaterElement() {
    
    int nums[] = {1,3,4,2};
    int *num2 = nums;
    
    int indexN = 3;
    int subnum[] = {4,1,2};
    int *num1 = subnum;
    
    int result[3] = {};
    int *R = result;
// 不知道为啥在LeetCode通不过
    int *r = nextGreaterElement(num1,indexN,num2,4,R);
    int i = 0;
    while (i < indexN) {
        printf("%d ",r[i++]);
    }
    
//    testnextGreaterElement1(num2,7,55);
}
