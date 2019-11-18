//
//  4-2BinaryTree.h
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/5.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#ifndef __2BinaryTree_h
#define __2BinaryTree_h

#include <stdio.h>

typedef int ElementType;
typedef struct TreeNode * PreToNode;
typedef PreToNode Tree;

// 二叉树
struct TreeNode {
    ElementType element;
    Tree left;
    Tree right;
};

#endif /* __2BinaryTree_h */
