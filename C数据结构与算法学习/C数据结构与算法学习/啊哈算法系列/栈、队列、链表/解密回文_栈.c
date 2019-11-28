//
//  解密回文_栈.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/28.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "解密回文_栈.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

// top变量是栈的核心

void testStack() {
    //是否是回文
    int ishuiwen = 1;
    
    char A[100] = "adfghhgfdaa";
    char S[100];
    int len = strlen(A);
    int mid = len/2 - 1;
    
    int top = 0;
    for (int i = 0; i<=mid; i++) {
        S[top++] = A[i];
    }
    
    top--;
    
    while (top >= 0) {
        if (S[top] == A[len-1-top]) {
            top--;
            continue;
        }else{
            ishuiwen = 0;
            break;
        }
    }
    
    if (ishuiwen) {
        printf("是回文");
    }else{
        printf("不是回文");
    }
    
}
