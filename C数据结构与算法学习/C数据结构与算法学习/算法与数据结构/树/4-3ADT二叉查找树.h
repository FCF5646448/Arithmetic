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

typedef int ADTElementType;
typedef struct ADTTreeNode * Position;
typedef struct ADTTreeNode * SearchTree;

/*
 二叉查找树的特点就是：对于每一个节点来说，左子树的所以节点的值均小于根节点，右子树所有节点的值均大于右节点。
 */
struct ADTTreeNode {
    ADTElementType element;
    SearchTree left;
    SearchTree right;
};



SearchTree MakeTreeEmpty(SearchTree T);

Position Find(ADTElementType X,SearchTree T);
//
Position FindMin(SearchTree T);
//
Position FindMax(SearchTree T);
//
SearchTree Insert(ADTElementType X,SearchTree T);
//
SearchTree Delete(ADTElementType X, SearchTree T);
//
//ADTElementType Retrieve(Position P);











#endif /* __3ADT______h */
