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

typedef int ElementType;

//栈的数据实现
struct StackRecord;
typedef struct StackRecord * Stack;

int IsEmpty(Stack S);

int IsFull(Stack S);

Stack CreateStack(int MaxElements);

void DisposeStack(Stack S);

void MakeEmpty(Stack S);

void Push(ElementType X, Stack S);

ElementType Top(Stack S);

void Pop(Stack S);

ElementType TopAndPop(Stack S);



#endif /* __3Stack_h */
