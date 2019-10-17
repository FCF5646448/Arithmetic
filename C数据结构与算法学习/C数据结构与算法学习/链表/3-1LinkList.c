//
//  3-1LinkList.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/10.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "3-1LinkList.h"
#include <stdlib.h>

List Link_createL() {
    PtrToNode P;
    P = malloc(sizeof(struct LinkNode));
    if (P == NULL) {
        printf("no space");
    }
    P->Next = NULL;
    return P;
}

void Link_insert(List L, LinkElementType val) {
    PtrToNode P,temp;
    temp = L;
    
    P = malloc(sizeof(struct LinkNode));
    if (P == NULL) {
        printf("no space");
    }
    P->Next = NULL;
    P->element = val;
    while (NULL != temp->Next) {
        temp = temp->Next;
    }
    temp->Next = P;
}

void Link_MakeEmpty(List L) {
    L->Next = NULL;
}

int Link_isEmpty(List L) {
    return L->Next == NULL;
}

int Link_IsLast(Position P, List L) {
    return P->Next == NULL;
}


Position Link_Fint(LinkElementType X, List L) {
    Position P;
    P = L->Next; //P指向第一个元素
    while (P != NULL && P->element != X) {
        P = P->Next;
    }
    return P;
}

void Link_Delete(LinkElementType X, List L) {
    Position P,tempP;
    P = Link_FindPrevious(X, L);
    if (!(P->Next == NULL)) {
        tempP = P->Next;
        P->Next = tempP->Next;
        free(tempP); //注意这里要有一个释放过程
    }
}

Position Link_FindPrevious(LinkElementType X, List L) {
    Position P;
    P = L->Next;
    while (P->Next != NULL && P->Next->element != X) {
        P = P->Next;
    }
    return P;
}
//在P的后面插入X
void Link_Insert(LinkElementType X, List L, Position P) {
    Position temP;
    temP = malloc(sizeof(struct LinkNode));
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
void Link_DeleteList(List L) {
    Position P,temP;
    P = L->Next;
    L->Next = NULL;
    while (P != NULL) {
        temP = P->Next;
        free(P);
        P = temP;
    }
}

Position Link_Header(List L) {
    return L;
}

Position Link_First(List L) {
    return L->Next;
}

Position Link_Advance(List L) {
    return L->Next;
}

LinkElementType Link_Retrieve(Position P) {
    return P->element;
}
