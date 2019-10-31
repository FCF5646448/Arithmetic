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

/*
 栈的数据实现：
 这里用的是栈的数组实现，具体实现看代码。顺便说一下栈的链表实现。栈的链表实现，是指用链表存储栈里的元素，链表head始终指向栈顶元素，所以每一次push都是使用malloc生成一个链表元素Node，然后将其插入到栈顶，每次pop都是将链表head弹出，这样就导致重复地malloc和free。使用数组实现则只是避免了重复调用malloc和free
 */
struct StackRecord;
typedef struct StackRecord * Stack;

struct StackRecord {
    StackElementType * Array; //使用数组实现
    int Capacity; //总数量size
    int TopOfStack; //栈顶下标
};


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
