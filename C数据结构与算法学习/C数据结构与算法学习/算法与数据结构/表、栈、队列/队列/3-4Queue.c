//
//  3-4Queue.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/30.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "3-4Queue.h"
#include <stdlib.h>

int IsEmpty(Queue Q) {
    return Q->Capacity == 0;
}

int IsFull(Queue Q) {
    return Q->Size == Q->Capacity;
}

Queue CreateQueue(int MaxElements) {
    Queue q;
    q = malloc(sizeof(struct Queuerecord));
    if (q == NULL) {
        return NULL;
    }
    q->Capacity = MaxElements;
    q->Rear = 0;
    q->Front = 0;
    q->Size = 0;
    q->Array = malloc(sizeof(ElementType)*MaxElements);
    return q;
}

void DisposeQueue(Queue Q) {
    Q->Capacity = 0;
    Q->Front = 0;
    Q->Rear = 0;
    Q->Size = 0;
    free(Q->Array);
    free(Q);
}

void MakeEmpty(Queue Q) {
    Q->Capacity = 0;
    Q->Front = 0;
    Q->Rear = 0;
    Q->Size = 0;
}

void Enqueue(ElementType X,Queue Q) {
    Q->Front++;
    Q->Size++;
    Q->Array[Q->Front] = X;
}

ElementType Front(Queue Q) {
    return Q->Array[Q->Front];
}

void Dequeue(Queue Q) {
    while (Q->Front != Q->Rear) {
        printf("%d", Q->Array[Q->Front]);
        Q->Front--;
        Q->Size--;
    }
}

ElementType FrontAndDequeue(Queue Q) {
    ElementType temp = Q->Array[Q->Front];
    Q->Front--;
    Q->Size--;
    return temp;
}
