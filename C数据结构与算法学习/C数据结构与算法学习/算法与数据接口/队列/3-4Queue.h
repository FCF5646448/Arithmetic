//
//  3-4Queue.h
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/30.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#ifndef __4Queue_h
#define __4Queue_h

#include <stdio.h>
typedef int ElementType;
typedef struct Queuerecord * Queue;

struct Queuerecord {
    int Capacity;
    int Front;
    int Rear;
    int Size;
    ElementType *Array;
};

int IsEmpty(Queue Q);
int IsFull(Queue Q);
Queue CreateQueue(int MaxElements);
void DisposeQueue(Queue Q);
void MakeEmpty(Queue Q);
void Enqueue(ElementType X,Queue Q);
ElementType Front(Queue Q);
void Dequeue(Queue Q);
ElementType FrontAndDequeue(Queue Q);


#endif /* __4Queue_h */
