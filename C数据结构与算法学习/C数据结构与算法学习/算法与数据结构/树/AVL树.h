//
//  AVL树.h
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/8.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#ifndef AVL__h
#define AVL__h

#include <stdio.h>


struct AVLTreeNode;
typedef struct AVLTreeNode * AVLTree;
typedef AVLTree AVLPosition;
typedef int AVLElement;

AVLTree avlMakeEmpty(AVLTree T);
//
AVLPosition avlFind(AVLElement X, AVLTree T);

AVLPosition avlFindMin(AVLTree T);

AVLPosition avlFindMax(AVLTree T);

// 插入
AVLTree avlInSert(AVLElement X, AVLTree T);

// 删除
AVLTree avlDelete(AVLElement X, AVLTree T);

// 检索
AVLElement avlRetrieve(AVLPosition P);

/*
 AVL：是一种特殊的二叉查找数，它的左右子树中每个节点的左子树与右子树的高度差不超过1.这个数据结构是为了避免二叉查找树深度过高的问题。
 */
struct AVLTreeNode {
    AVLElement element;
    AVLTree left;
    AVLTree right;
    int height; //高度 因为得根据高度来判断是否需要旋转
};




#endif /* AVL__h */
