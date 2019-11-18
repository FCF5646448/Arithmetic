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

//左子树右旋
STTree singleReroteWithLeft(STTree tree) {
    STTree temp = tree->left;
    tree->left = temp->right;
    temp->right = tree;
    return temp;
}

//右子树左旋
STTree singleReroteWithRight(STTree tree) {
    STTree temp = tree->right;
    tree->right = temp->left;
    temp->left = tree;
    return temp;
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
    
    STPosition header = NULL;
    STPosition leftMax;
    STPosition rightMin;
    
    header->left = header->right = NULL;
    leftMax = rightMin = header;
    
    while (val != tree->val) {
        if (val < tree->val) {
            //
            if (val < tree->left->val) {
                // 将temp旋转到根,边遍历边交换
                tree = singleReroteWithLeft(tree);
            }
            if (tree->left == NULL) {
                break;
            }
            
            //链接右边 (搞不懂为什么要进行这一步，感觉直接旋转就可以了)
            rightMin->left = tree;
            rightMin = tree;
            tree = tree->left;
            
        }else if (val > tree->val){
            //
            
            if (val > tree->right->val) {
                tree = singleReroteWithRight(tree);
            }
            
            if (tree->right == NULL) {
                break;
            }
            
            //链接左边
            leftMax->right = tree;
            leftMax = tree;
            tree = tree->right;
        }
    }
    
    //组装
    leftMax->right = tree->left;
    rightMin->left = tree->right;
    tree->left = header->right;
    tree->right = header->left;
    
    return tree;
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
