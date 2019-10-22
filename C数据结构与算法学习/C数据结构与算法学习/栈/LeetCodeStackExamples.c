//
//  LeetCodeStackExamples.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/19.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "LeetCodeStackExamples.h"
#include <stdio.h>
#include <String.h>

char * removeOuterParentheses(char * S){
    int L=1;
    int R=0;
    int index = 0;
    if (*S == '\0') {
        return S;
    }
    S++;
    char * t;
    char * ans = NULL;
    
    for (t = S; *t != '\0'; t++) {
        if (*t == '(') {
            L++;
        }else{
            R++;
        }
        if (R != L) {
            ans[index++] = *t;
        }else{
            t++;
            L = 1;
            R = 0;
        }
    }
    
    return ans;
}






void testremoveOuterParentheses() {
    char *S = "(()()())";
    char * r = removeOuterParentheses(S);
    printf("%s",r);
}


