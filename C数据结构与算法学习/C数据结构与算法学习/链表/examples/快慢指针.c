//
//  快慢指针.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/17.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "快慢指针.h"

struct FSNode;
typedef int ElementType;
typedef struct FSNode * FSPreNode;
typedef FSPreNode FSList;


struct FSNode {
    ElementType val;
    FSPreNode next;
};

//LeetCode 876  获取链表的中间结点，如果有两个，则返回后一个
// 这里要用到快慢指针，慢指针移动一位，快指针需要移动两位
FSPreNode middleNode(FSList head) {
    FSPreNode slower,fast;
    slower = head;
    fast = head;
    while (NULL != fast && NULL != fast->next) {
        fast = fast->next->next;
        slower = slower->next;
    }
    
    return slower;
}

FSList createL() {
    FSPreNode P;
    P = malloc(sizeof(struct FSNode));
    if (P == NULL) {
        printf("no space");
    }
    P->next = NULL;
    return P;
}

void insert(FSList L, ElementType val) {
    FSPreNode P,temp;
    temp = L;
    
    P = malloc(sizeof(struct FSNode));
    if (P == NULL) {
        printf("no space");
    }
    P->next = NULL;
    P->val = val;
    while (NULL != temp->next) {
        temp = temp->next;
    }
    temp->next = P;
}

void destory(FSList L) {
    while (L != NULL) {
        free(L);
        L = L->next;
    }
}

void testFS(void) {
    
    FSPreNode L,P;
    L = createL();
    P = L;
    for (int i = 1; i<9; i++) {
        insert(P,i);
        P = P->next;
    }
    
    FSPreNode middle = middleNode(L->next);
    
    printf("%d",middle->val);
    
}


