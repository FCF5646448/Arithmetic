//
//  伸展树.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/12.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "伸展树.h"
#include <stdlib.h>

//前序打印
void proder_STTree(STTree tree) {
    if (NULL != tree) {
        printf("%d ",tree->val);
        proder_STTree(tree->left);
        proder_STTree(tree->right);
    }
}

//中序
void inorder_STTree(STTree tree) {
    if (NULL != tree) {
        inorder_STTree(tree->left);
        printf("%d ", tree->val);
        inorder_STTree(tree->right);
    }
}

//后续
void postorder_STTree(STTree tree) {
    if (NULL != tree) {
        postorder_STTree(tree->left);
        postorder_STTree(tree->right);
        printf("%d ", tree->val);
    }
}

//search
STPosition search_STTree(STElementType x,STTree tree) {
    if (NULL == tree || tree->val == x) {
        return tree;
    }
    
    if (x < tree->val) {
        return search_STTree(x, tree->left);
    }else{
        return search_STTree(x, tree->right);
    }
}

//最小
STPosition minimun_STTree(STTree tree) {
    if (NULL == tree) {
        return NULL;
    }
    while ( NULL != tree->left) {
        minimun_STTree(tree->left);
    }
    return tree;
}

//最大
STPosition maximun_STTree(STTree tree) {
    if (tree == NULL) {
        return NULL;
    }
    while (NULL != tree->right) {
        maximun_STTree(tree->right);
    }
    return tree;
}

//旋转key对应的节点为根节点
/*
 1、伸展树存在值为val的节点，则将该节点旋转为根节点
 2、伸展树不存在值为val的节点，且小于最小节点：
 
 3、伸展树不存在值为val的节点，且大于最大节点：
 
 */
STTree sttree_STTree(STElementType val, STTree tree) {
    if (NULL == tree) {
        return tree;
    }
    
//    STPosition N;
//    N->left = N->right = NULL;
//    STPosition r;
//    STPosition l;
//    r = l = N;
//    
//    while (1) {
//        if (val < tree->val) {
//            //
//            if (tree->left == NULL) {
//                break;
//            }
//            if (val < tree->left->val) {
//                // 将temp旋转到根,边遍历边交换
//                STPosition temp = tree->left;
//                tree->left = temp->right;
//                temp->right = tree;
//                tree = temp;
//                
//                if (tree->left == NULL) {
//                    //说明走到了最右侧
//                    break;
//                }
//            }
//            
//            //
//            r->left = tree;
//            r = tree;
//            tree = tree->left;
//            
//        }else if (val > tree->val){
//            //
//            
//        }
//    }
    
    
    
    return NULL;
}

//将节点插入到伸展树中，并返回根节点
STPosition insert_STTree(STElementType x, STTree tree) {
    return NULL;
}

//删除key节点，并返回根节点
STPosition delete_STTree(STElementType x, STTree tree) {
    return NULL;
}

//打印
void print_STTree() {
    
}
