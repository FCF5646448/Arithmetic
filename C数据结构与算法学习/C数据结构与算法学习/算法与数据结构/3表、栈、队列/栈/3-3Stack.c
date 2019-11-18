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

Stack Stack_CreateStack(int MaxElements) {
    Stack S;
    if (MaxElements < MinStackSize) {
        printf("Stack size is too small");
    }
    S = malloc(sizeof(struct StackRecord));
    
    if (S == NULL) {
        printf("Out of Space");
    }
    
    S->Array = malloc(sizeof(StackElementType) * MaxElements);
    if (S->Array == NULL) {
        printf("Out of Space");
    }
    
    S->Capacity = MaxElements;
    Stack_MakeEmpty(S);
    
    return S;
}

// 将栈顶置为-1，表示空栈
void Stack_MakeEmpty(Stack S) {
    S->TopOfStack = EmptyTOS;
}


int Stack_IsEmpty(Stack S) {
    return S->TopOfStack == EmptyTOS;
}

int Stack_IsFull(Stack S) {
    return S->TopOfStack == sizeof(S->Array);
}

//销毁栈
void Stack_DisposeStack(Stack S) {
    if (S != NULL) {
        free(S->Array);
        free(S);
    }
}

void Stack_Push(StackElementType X, Stack S) {
    if (Stack_IsFull(S)) {
        printf("Full Stack");
    }else{
        S->TopOfStack += 1;
        S->Array[S->TopOfStack] = X;
    }
}

//获取顶部元素
StackElementType Stack_Top(Stack S) {
    if (!Stack_IsEmpty(S)) {
        return S->Array[S->TopOfStack];
    }
    printf("Empty stack");
    return 0;
}

// 直接移除顶部元素
void Stack_Pop(Stack S) {
    if (Stack_IsEmpty(S)) {
        printf("Empty stack");
    }else{
        S->TopOfStack--;
    }
}

StackElementType Stack_TopAndPop(Stack S) {
    if (!Stack_IsEmpty(S)) {
        return S->Array[S->TopOfStack--];
    }
    printf("Empty stack");
    return 0;
}


