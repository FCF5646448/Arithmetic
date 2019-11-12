//
//  4-3ADT二叉查找树.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/5.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "4-3ADT二叉查找树.h"
#include <stdlib.h>

/*
 二叉查找树的最需要注意的就是插入和删除的过程。
 插入：最终插入的肯定就是一个叶子节点。所以只要遍历到节点进行新节点的生成插入即可
 删除：删除的原理就是如果有左右子树的情况，则用删除节点的右子树的最小值来替换掉当前删除的节点的值，然后再遍历去删除掉右子树的最小节点；如果只有一个子树的情况，则直接用子树替换掉当前节点，然后free。
 */
SearchTree MakeTreeEmpty(SearchTree T) {
    if (NULL != T) {
        MakeTreeEmpty(T->left);
        MakeTreeEmpty(T->right);
        free(T);
    }
    return NULL;
}

Position Find(ADTElementType X,SearchTree T) {
    if (NULL != T) {
        if (T->element == X) {
            Position temp;
            temp = T;
            return temp;
        }else if (T->element < X) {
            Find(X, T->left);
        }else if (T->element > X) {
            Find(X, T->right);
        }
    }
    
    return NULL;
}

//找最小，肯定是找最小左子树
Position FindMin(SearchTree T) {
    if (NULL != T) {
        if (NULL != T->left) {
            FindMin(T->left);
        }else{
            return T;
        }
    }
    return NULL;
}

//找最大,肯定找最大右子树
Position FindMax(SearchTree T) {
    if (NULL != T) {
        if (NULL != T->right) {
            FindMax(T->right);
        }else{
            return T;
        }
    }
    
    return NULL;
}

//插入的过程其实就是一个查找的过程，最终肯定是找到一个为NULL的子树，然后生成。
SearchTree Insert(ADTElementType X,SearchTree T) {
    if (NULL != T) {
        if (T->element > X) {
            T->left = Insert(X,T->left);
        }else if (T->element < X) {
            T->right = Insert(X, T->right);
        }
    }else{
        T = malloc(sizeof(struct ADTTreeNode));
        T->element = X;
        T->left = T->right = NULL;
    }
    return T;
}
/*删除查找二叉树节点的步骤：
 1、被删除节点是叶子节点：则直接删除就好了。
 2、被删除的节点只有一个子节点：则直接将子节点移上来替换掉被删除的节点就可以了。
 3、被删除的节点有两个子树：则根据二叉查找树的性质，只需要将右子树的最小节点找出来，将值替换掉，然后再回头去删掉替换后的那个“最小节点”的。
*/
SearchTree Delete(ADTElementType X, SearchTree T) {
    Position tempCell;
    if (NULL == T) {
        return NULL;
    }else if (X < T->element) {
        T->left = Delete(X, T->left);
    }else if (X > T->element) {
        //注意：课本上这一段是错误的
        T->right = Delete(X, T->right);
    }else if (T->left && T->right) {
        //
        tempCell = FindMin(T->right);
        T->element = tempCell->element;
        T->right = Delete(T->element, T->right);
    }else{
        tempCell = T;
        if (T->left == NULL) {
            T = T->right;
        }else if (T->right == NULL){
            T = T->left;
        }
        free(tempCell);
    }
    return T;
}
//
//ADTElementType Retrieve(Position P) {
//    return 0;
//}
