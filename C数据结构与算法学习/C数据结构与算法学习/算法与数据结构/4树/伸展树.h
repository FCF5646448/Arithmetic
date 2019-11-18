//
//  伸展树.h
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/12.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#ifndef ____h
#define ____h

#include <stdio.h>

struct StretchTreeNode;
typedef int STElementType;
typedef struct StretchTreeNode * STTree;
typedef STTree STPosition;

/*
 伸展树：伸展树也是一种二叉查找树，但是其对平衡的要求不高。伸展树的理念是：将最近最先使用的节点放到最容易查找的位置(根节点)。也就是说，它会在搜索的时候进行自我调整，将search的节点自调整到根节点。
 */
struct StretchTreeNode {
    STElementType val;
    STTree left;
    STTree right;
};


//前序打印
void proder_STTree(STTree tree);

//中序
void inorder_STTree(STTree tree);

//后续
void postorder_STTree(STTree tree);

//search
STPosition search_STTree(STElementType x,STTree tree);

//最小
STPosition minimun_STTree(STTree tree);

//最大
STPosition maximun_STTree(STTree tree);

//旋转key对应的节点为根节点
STTree sttree_STTree(STElementType val, STTree tree);

//将节点插入到伸展树中，并返回根节点
STPosition insert_STTree(STElementType x, STTree tree);

//删除key节点，并返回根节点
STPosition delete_STTree(STElementType x, STTree tree);

//打印
void print_STTree(void);


#endif /* ____h */
