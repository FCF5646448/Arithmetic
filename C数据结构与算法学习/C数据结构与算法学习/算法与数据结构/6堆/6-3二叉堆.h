//
//  6-3二叉堆.h
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/17.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#ifndef __3____h
#define __3____h

#include <stdio.h>

/*
 二叉堆：
 */

struct HeapStruct;
typedef struct HeapStruct * PriorityQueue;
typedef int HeapElement;

struct HeapStruct{
    int Capacity; //容量
    int Size; //实际大小
    HeapElement * Elements; //一个数组存各个元素
};

PriorityQueue HeapInitialize(int MaxElements);

void HeapDestory(PriorityQueue H);

void HeapMakeEmpty(PriorityQueue H);

void HeapInsert(HeapElement X, PriorityQueue H);

HeapElement HeapDeleteMin(PriorityQueue H);

HeapElement HeapFindMin(PriorityQueue H);

int HeapIsEmpty(PriorityQueue H);

int HeapIsFull(PriorityQueue H);

#endif /* __3____h */
