//
//  6-3二叉堆.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/17.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "6-3二叉堆.h"
#include <stdlib.h>

PriorityQueue HeapInitialize(int MaxElements) {
    PriorityQueue H;
    
    H = malloc(sizeof(struct HeapStruct));
    if (NULL == H) {
        return NULL;
    }
    
    //开辟一段连续的内存空间
    H->Elements = malloc(sizeof(HeapElement)*(MaxElements + 1));
    if (NULL == H->Elements) {
        return NULL;
    }
    
    H->Capacity = MaxElements;
    H->Size = 0;
    //注：这里给第一个元素一个最小值。避免是一个空堆
    H->Elements[0] = 0;
    
    return H;
}

void HeapDestory(PriorityQueue H) {
    if (NULL == H) {
        return;
    }
    free(H->Elements);
    free(H);
}

void HeapMakeEmpty(PriorityQueue H) {
    if (NULL == H) {
        return;
    }
    H->Size = 0;
}

//上滤：先在下一个位置创建一个空节点，然后一层层往上走，直到满足堆序性。
void HeapInsert(HeapElement X, PriorityQueue H) {
    if (HeapIsFull(H)) {
        return;
    }
    // 注意父节点永远在i/2的位置。i/=2 就是上滤的一个过程
    int i;
    for (i= ++H->Size; H->Elements[i/2] > X; i/=2) {
        H->Elements[i] = H->Elements[i/2];
    }
    H->Elements[i] = X;
}

//类似于insert方式。将根节点的空穴“下滤”。
/*
 注意这里i*2是因为最新元素，堆顶是取的下标为1的值。左子树的下标是2*i
 */
HeapElement HeapDeleteMin(PriorityQueue H) {
    if (HeapIsEmpty(H)) {
        return H->Elements[0];
    }
    
    HeapElement min = H->Elements[1];
    HeapElement lastElement = H->Elements[H->Size--];
    
    //下面是下滤的过程
    int i, Child;
    for (i = 1; i * 2 <= H->Size; i = Child) {
        Child = i*2;
        //找到更小的儿子
        if (Child != H->Size && H->Elements[Child + 1] < H->Elements[Child]) {
            Child++;
        }
        if (lastElement > H->Elements[Child]) {
            H->Elements[i] = H->Elements[Child];
        }else{
            break;
        }
    }
    H->Elements[i] = lastElement;
    
    return min;
}

//最小元永远是在根节点处。
HeapElement HeapFindMin(PriorityQueue H) {
    if (NULL == H || NULL == H->Elements || H->Size == 0) {
        return -1;
    }
    //注：小顶堆第一个元素肯定是最小值
    return H->Elements[1];
}

int HeapIsEmpty(PriorityQueue H){
    if (H->Size == 0){
        return 1;
    }
    return 0;
}

int HeapIsFull(PriorityQueue H) {
    if (H->Size >= H->Capacity) {
        return 1;
    }
    return 0;
}
