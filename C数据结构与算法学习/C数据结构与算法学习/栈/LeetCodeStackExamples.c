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
 */
int calPoints(char ** ops, int opsSize){
    if (opsSize <= 0) {
        return 0;
    }
    
    int sum = 0;
    
    for (int i = 0; i<opsSize; i++) {
        char * temp = ops;
        printf("%s ", temp);
        if (*temp == 'C') {
            
        }else if (*temp == 'D') {
            
        }else if (*temp == '+') {
            
        }
        ops++;
    }
    
    return 0;
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
    char * opsArr = {"5","2","C","D","+"};
    char ** ops = &opsArr;
    int r = calPoints(ops,5);
    printf("%d",r);
}
