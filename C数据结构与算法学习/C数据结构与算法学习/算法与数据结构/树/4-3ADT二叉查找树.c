//
//  4-3ADT二叉查找树.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/5.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "4-3ADT二叉查找树.h"
#include <stdlib.h>


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
        if (NULL != T->right) {
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
// 这段不太好理解
SearchTree Delete(ADTElementType X, SearchTree T) {
    Position tempCell;
    if (NULL == T) {
        return NULL;
    }else if (X > T->element) {
        T->right = Delete(X, T->left);
    }else if (X < T->element) {
        T->left = Delete(X, T->right);
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
