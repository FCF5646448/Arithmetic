//
//  反正单链表.h
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/17.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#ifndef ______h
#define ______h

#include <stdio.h>
#include <stdlib.h>

struct Node;
typedef int ElementType;
typedef struct Node * PNode;
typedef PNode List;

struct Node {
    ElementType val;
    PNode next;
};

List reverseList(List head);

void test();

#endif /* ______h */
