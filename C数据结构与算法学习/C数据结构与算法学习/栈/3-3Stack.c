//
//  3-3Stack.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/14.
//  Copyright © 2019 冯才凡. All rights reserved.
//


#include "3-3Stack.h"
#include <stdlib.h>

#define MinStackSize (5)
#define EmptyTOS (-1)

struct StackRecord {
    ElementType * Array; //使用数组实现
    int Capacity;
    int TopOfStack;
};

Stack CreateStack(int MaxElements) {
    Stack S;
    if (MaxElements < MinStackSize) {
        Error("Stack size is too small");
    }
    S = malloc(sizeof(struct StackRecord));
    
    if (S == NULL) {
        FatalError("Out of Space");
    }
    
    S->Array = malloc(sizeof(ElementType) * MaxElements);
    if (S->Array == NULL) {
        FatalError("Out of Space");
    }
    
    S->Capacity = MaxElements;
    MakeEmpty(S);
    
    return S;
}

// 将栈顶置为-1，表示空栈
void MakeEmpty(Stack S) {
    S->TopOfStack = EmptyTOS;
}


int IsEmpty(Stack S) {
    return S->TopOfStack == EmptyTOS;
}

int IsFull(Stack S) {
    return S->TopOfStack == sizeof(S->Array);
}

//销毁栈
void DisposeStack(Stack S) {
    if (S != NULL) {
        free(S->Array);
        free(S);
    }
}

void Push(ElementType X, Stack S) {
    if (IsFull(S)) {
        Error("Full Stack");
    }else{
        S->TopOfStack += 1;
        S->Array[S->TopOfStack] = X;
    }
}

//获取顶部元素
ElementType Top(Stack S) {
    if (!IsEmpty(S)) {
        return S->Array[S->TopOfStack];
    }
    Error("Empty stack");
    return 0;
}

// 直接移除顶部元素
void Pop(Stack S) {
    if (IsEmpty(S)) {
        Error("Empty stack");
    }else{
        S->TopOfStack--;
    }
}

ElementType TopAndPop(Stack S) {
    if (!IsEmpty(S)) {
        return S->Array[S->TopOfStack--];
    }
    Error("Empty stack");
    return 0;
}


