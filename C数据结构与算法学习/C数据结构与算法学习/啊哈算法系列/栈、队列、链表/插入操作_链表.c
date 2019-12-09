//
//  插入操作_链表.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/12/9.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "插入操作_链表.h"
#include <stdlib.h>

//在有数组的情况下，为什么还要用链表？
//1、数组如果要插入一个数据的话，则要把插入位置及后面的元素都往后移一位。所以衍生出链表的结果。链表可以不是连续的存储空间，对插入删除删除操作更灵活。

typedef int NodeValueType;

struct ahNode {
    NodeValueType value;
    struct ahNode * next;
};

void ahTestLink() {
    struct ahNode * head = NULL;
    struct ahNode * q = NULL;
    
    for (int i = 0; i<5; i++) {
        struct ahNode * p;
        p = (struct ahNode *)malloc(sizeof(struct ahNode));
        // 给value赋值
        scanf("%d", &p->value);
        p->next = NULL;
        
        if (head == NULL) {
            head = p;
        }else{
            q->next = p;
        }
        q = p;
    }
    printf("\n");
    int a;
    printf("输入待插入的数：");
    scanf("%d",&a);
    
    printf("\n");
    struct ahNode * tmp = head;
    while (tmp != NULL) {
        // 遍历到最后一个或者找到比插入数更大的数之前插入
        if (tmp->next == NULL || tmp->next->value > a) {
            struct ahNode * p = (struct ahNode *)malloc(sizeof(struct ahNode));
            p->value = a;
            p->next = tmp->next;
            tmp->next = p;
            break;
        }
        
        tmp = tmp->next;
    }
    
    printf("插入后的序列：\n");
    tmp = head;
    while ( tmp != NULL) {
        printf("%d ",tmp->value);
        tmp = tmp->next;
    }
    
    printf("\n");
}

