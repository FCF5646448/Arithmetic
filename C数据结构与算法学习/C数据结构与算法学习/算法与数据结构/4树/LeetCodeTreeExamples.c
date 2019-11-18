//
//  LeetCodeTreeExamples.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/13.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "LeetCodeTreeExamples.h"
#include <stdlib.h>

/*
 LeetCode 1038
 给出二叉搜索树的根节点，该二叉树的节点值各不相同，修改二叉树，使每个节点 node 的新值等于原树中大于或等于 node.val 的值之和
 输入：[4,1,6,0,2,5,7,null,null,null,3,null,null,null,8]
 输出：[30,36,21,36,35,26,15,null,null,null,33,null,null,null,8]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-search-tree-to-greater-sum-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 树中的节点数介于 1 和 100 之间。
 每个节点的值介于 0 和 100 之间。
 给定的树为二叉搜索树
 
 */

typedef struct LeetCodeTreeNode * lcTree;

struct LeetCodeTreeNode {
     int val;
     struct LeetCodeTreeNode *left;
     struct LeetCodeTreeNode *right;
};

/*
 笨方法：其实可以安装中序遍历将所有节点的值放到数组里，这样数组的元素都是以小到大的排序的。然后更换新值的时候，就将遍历求和，将值替换。
 妙方法：递归，从后往前算
 */
struct LeetCodeTreeNode* bstToGst(struct LeetCodeTreeNode* root){
    
    static int val = 0;
    
    if (NULL != root) {
        bstToGst(root->right);
        val += root->val;
        root->val = val;
        bstToGst(root->left);
    }
    return root;
}

void testTree() {
    
    struct LeetCodeTreeNode* root = malloc(sizeof(struct LeetCodeTreeNode*));
    root->val = 0;
    
    struct LeetCodeTreeNode* right = malloc(sizeof(struct LeetCodeTreeNode*));
    right->val = 1;
    right->left = NULL;
    right->right = NULL;
    
    root->left = NULL;
    root->right = right;
    
    bstToGst(root);
    
}
