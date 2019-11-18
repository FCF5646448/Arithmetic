//
//  3-1LinkList.h
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/10.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#ifndef __1LinkList_h
#define __1LinkList_h

#include <stdio.h>

typedef int LinkElementType;

struct LinkNode;
typedef struct LinkNode * PtrToNode;
typedef PtrToNode List; //表
typedef PtrToNode Position; //位置

struct LinkNode {
    LinkElementType element; //当前元素值
    Position Next; //下一个指针
};

List Link_createL();
void Link_insert(List L, LinkElementType val);

void Link_MakeEmpty(List L);

int Link_isEmpty(List L);

int Link_IsLast(Position P, List L);

Position Link_Fint(LinkElementType X, List L);

void Link_Delete(LinkElementType X, List L);
//查找前驱
Position Link_FindPrevious(LinkElementType X, List L);

void Link_Insert(LinkElementType X, List L, Position P);

void Link_DeleteList(List L);

Position Link_Header(List L);

Position Link_First(List L);

Position Link_Advance(List L);
//获取P的元素
LinkElementType Link_Retrieve(Position P);




#endif /* __1LinkList_h */
