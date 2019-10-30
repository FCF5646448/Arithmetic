//
//  反正单链表.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/17.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "反正单链表.h"
// 最好画图示意，其实只需要两个几个指针指向转换就行
// 注意边界问题

//struct TreNode;
//
//typedef int ElementType;
//typedef struct TreNode * TrePNode;
//typedef TrePNode TreList;
//
//struct TreNode {
//    ElementType val;
//    TrePNode next;
//};
//
//
////LeetCode 206 翻转单链表
//TreList reverseList(TreList head) {
//    TrePNode H,first,target;
//    H = head;
//    first = head;
//    if (NULL == first || NULL ==first->next) return H;
//    target = first->next;
//    while (NULL != target) {
//        //把目标节点提出来
//        first->next = target->next;
//        target->next = H;
//        H = target;
//        target = first->next;
//    }
//    return H;
//}
//
//void createList(TreList L,ElementType element) {
//    TrePNode P;
//    P = malloc(sizeof(struct TreNode));
//    if (P == NULL) {
//        printf("xxxx");
//    }
//    P->val = element;
//    P->next = NULL;
//    L->next = P;
//}
//
//void testTre(void)
//{
//    TreList L,P;
//    L = malloc(sizeof(struct TreNode));
//    L->next = NULL;
//    P = L;
//    for (int i = 1; i<10; i++) {
//        createList(P,i);
//        P = P->next;
//    }
//    
//    L = reverseList(L);
//    printf("结果：");
//    P = L;
//    while (NULL != P ) {
//        printf("%d ",P->val);
//        free(P);
//        P = P->next;
//    }
//    
//    
//    printf(" end! \n");
//}
