//
//  4-3ADT二叉查找树.h
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/5.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#ifndef __3ADT______h
#define __3ADT______h

#include <stdio.h>

typedef int ElementType;
typedef int Position;
typedef struct ADTTreeNode * SearchTree;

struct ADTTreeNode {
    ElementType element;
    SearchTree left;
    SearchTree right;
};

SearchTree MakeEmpty(SearchTree T);
//
//Position Find(ElementType X,SearchTree T);
//
//Position FindMin(SearchTree T);
//
//Position FindMax(SearchTree T);
//
//SearchTree Insert(ElementType X,SearchTree T);
//
//SearchTree Delete(ElementType X, SearchTree T);
//
//ElementType Retrieve(Position P);











#endif /* __3ADT______h */
