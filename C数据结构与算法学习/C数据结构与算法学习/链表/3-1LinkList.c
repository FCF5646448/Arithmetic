//
//  3-1LinkList.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/10.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "3-1LinkList.h"
#include <stdlib.h>

struct Node {
    ElementType element; //当前元素值
    Position Next; //下一个指针
};

List MakeEmpty(List L) {
    L->Next = NULL;
    return L;
}

int isEmpty(List L) {
    return L->Next == NULL;
}

int IsLast(Position P, List L) {
    return P->Next == NULL;
}


Position Fint(ElementType X, List L) {
    Position P;
    P = L->Next; //P指向第一个元素
    while (P != NULL && P->element != X) {
        P = P->Next;
    }
    return P;
}

void Delete(ElementType X, List L) {
    Position P,tempP;
    P = FindPrevious(X, L);
    if (!(P->Next == NULL)) {
        tempP = P->Next;
        P->Next = tempP->Next;
        free(tempP); //注意这里要有一个释放过程
    }
}

Position FindPrevious(ElementType X, List L) {
    Position P;
    P = L->Next;
    while (P->Next != NULL && P->Next->element != X) {
        P = P->Next;
    }
    return P;
}
//在P的后面插入X
void Insert(ElementType X, List L, Position P) {
    Position temP;
    temP = malloc(sizeof(struct Node));
    if (temP == NULL) {
        return;
    }
    temP->element = X;
    temP->Next = P->Next;
    P->Next = temP;
}

/*
 删除链表，记得要释放每一个元素
 */
void DeleteList(List L) {
    Position P,temP;
    P = L->Next;
    L->Next = NULL;
    while (P != NULL) {
        temP = P->Next;
        free(P);
        P = temP;
    }
}

Position Header(List L) {
    return L;
}

Position First(List L) {
    return L->Next;
}

Position Advance(List L) {
    return L->Next;
}

ElementType Retrieve(Position P) {
    return P->element;
}
