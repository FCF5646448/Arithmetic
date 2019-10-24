//
//  LeetCodeStackExamples.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/19.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "LeetCodeStackExamples.h"
#include <String.h>

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
