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

#define Radix 10
#define POS_Len 3

typedef int ElementType;

struct Node;
typedef struct Node * PNode;
typedef PNode List;

void radixSort(List originLink,int radix,int pos_len);

#endif /* RadixSort_h */
