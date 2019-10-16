//
//  RadixSort.h
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/15.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#ifndef RadixSort_h
#define RadixSort_h

// 2、基数排序
#include <stdio.h>
#include <stdlib.h>

#define N 10 //数个数
#define Radix 10
#define POS_Len 3

typedef int ElementType;

struct Node;
typedef struct Node * PNode;
typedef PNode List;


PNode createLink();

int get_num_pos(int num, int pos, int radix);

void insert(List L, ElementType element);

void radixSort(List originLink,int radix,int pos_len);

void testRadix(void);

#endif /* RadixSort_h */
