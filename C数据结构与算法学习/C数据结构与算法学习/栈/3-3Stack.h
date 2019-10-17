//
//  3-3Stack.h
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/14.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#ifndef __3Stack_h
#define __3Stack_h

#include <stdio.h>

typedef int StackElementType;

//栈的数据实现
struct StackRecord;
typedef struct StackRecord * Stack;

int Stack_IsEmpty(Stack S);

int Stack_IsFull(Stack S);

Stack Stack_CreateStack(int MaxElements);

void Stack_DisposeStack(Stack S);

void Stack_MakeEmpty(Stack S);

void Stack_Push(StackElementType X, Stack S);

StackElementType Stack_Top(Stack S);

void Stack_Pop(Stack S);

StackElementType Stack_TopAndPop(Stack S);



#endif /* __3Stack_h */
