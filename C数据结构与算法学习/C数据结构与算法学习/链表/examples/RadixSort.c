//
//  RadixSort.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/15.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "RadixSort.h"

https://learnku.com/articles/21486

struct Node {
    ElementType Element;
    PNode Next;
};

PNode createLink() {
    PNode L;
    L = malloc(sizeof(struct Node));
    if (L == NULL) {
        FatalError("Out of Space");
    }
    L->Next = NULL;
    return L;
}

// 计算 当前位数上的余数, pos 代表位数，0是个位、1是十、2是百... , radix代表当前基数10
int get_num_pos(int num, int pos, int radix) {
    int temp = 1;
    for (int i = 0; i<pos-1; i++) {
        temp *= 10;
    }
    return (num/temp)%radix;
}

void radixSort(List list,int radix,int pos_len) {
    PNode P;
    List assignArr[radix];
    //先初始化一个数组，数组的每个元素是一个空链表
    for (int i = 0; i < radix; i++) {
        assignArr[i] = createLink();
    }
    
    for (int i=0; i<pos_len; i++) {
        P = list;
        while (P->Next != NULL) {
            // 将链表里对应的 元素放到对应数组下标对应的链表里面
            PNode n;
            n = P->Next;
            
            
        }
    }
    
}



