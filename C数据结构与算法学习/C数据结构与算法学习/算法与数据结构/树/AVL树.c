//
//  AVL树.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/8.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "AVL树.h"
#include <stdlib.h>
#define Max(x,y) ((x)>(y) ? (x) : (y));


/*
 单旋、双旋： https://juejin.im/post/5d62064c6fb9a06b2c329a6f
 
 */

// 返回节点高度
int avlHeight(AVLPosition P) {
    if (NULL == P) {
        return -1;
    }else{
        return P->height;
    }
}

/*
 P节点是检测出的不平衡节点:
 P有个左子树P->left,
 左子树右旋:就是将P作为P->left的右子树，将P->left顶替掉P的位置。
 注意2点：1、两个节点也是可以直接旋转的，因为没有大小比较，
 2、不需要管整个过程是否平衡，因为这是调用之前判断的
 Left表示将要旋转的子树
 */
AVLTree singleRReroteWithLeft(AVLPosition P) {
    AVLPosition left;
    left = P->left;
    P->left = left->right; //将left原来的右子树当做P的左子树
    left->right = P;
    
    left->height = 1 + Max(avlHeight(left->left), avlHeight(left->right));
    
    P->height = 1 + Max(avlHeight(P->left), avlHeight(P->right));
    
    return left;
}

/*
 P节点是检测出的不平衡节点:
 P有个右子树P->right,
 右子树左旋:就是将P作为P->right的左子树，将P->left顶替掉P的位置。
 同理注意2点：1、两个节点也是可以直接旋转的，因为没有大小比较，
 2、不需要管整个过程是否平衡，因为这是调用之前判断的
 Right表示将要旋转的子树
 */
AVLTree singleLReroteWiithRight(AVLPosition P) {
    AVLPosition right;
    right = P->right;
    P->right = right->left; //将right原来的左子树当做P的右子树
    right->left = P;
    
    right->height = 1 + Max(avlHeight(right->left), avlHeight(right->right));
    
    P->height = 1 + Max(avlHeight(P->left), avlHeight(P->right));
    
    return right;
}

/*
 P节点是检测出的不平衡节点,
 P有个左子树，P的左子树p->left有一个右子树，
 双旋转：先p->left的右子树P->left->right左旋，再P树右旋
 Left表示将要旋转的子树
 */
AVLTree DoubleReroteWithLeft(AVLPosition P) {
    
    P->left = singleLReroteWiithRight(P->left);
    
    return singleRReroteWithLeft(P);
}

/*
 P节点是检测出的不平衡节点,
 P有个右子树，P的右子树p->right有一个左子树，
 双旋转：先p->right的左子树P->right->left右旋，再P树左旋
 Right表示将要旋转的子树
 */
AVLTree DoubleReroteWithRight(AVLPosition P) {
    P->right = singleRReroteWithLeft(P->right);
    return singleLReroteWiithRight(P);
}


AVLTree avlMakeEmpty(AVLTree T) {
    if (NULL != T) {
        avlMakeEmpty(T->left);
        avlMakeEmpty(T->right);
        free(T);
    }
    return NULL;
}
//
AVLPosition avlFind(AVLElement X, AVLTree T) {
    if (X < T->element) {
        avlFind(X, T->left);
    }else if (X > T->element) {
        avlFind(X, T->right);
    }else if (X == T->element) {
        AVLPosition temp;
        temp = T;
        return temp;
    }
    return NULL;
}
// 最小值肯定是一直往左子树查找
AVLPosition avlFindMin(AVLTree T) {
    if (NULL != T) {
        if (NULL != T->left) {
            avlFindMin(T->left);
        }else{
            return T;
        }
    }
    
    return NULL;
}
// 最大值肯定是一直往右子树查找
AVLPosition avlFindMax(AVLTree T) {
    if(NULL != T) {
        if (NULL != T->right) {
            avlFindMax(T);
        }else{
            return T;
        }
    }
    return NULL;
}

/*
 先进行插入，然后再调整平衡
 */
AVLTree avlInSert(AVLElement X, AVLTree T) {
    if (NULL == T) {
        T = malloc(sizeof(struct AVLTreeNode));
        if (NULL == T) {
            return NULL;
        }else{
            T->element = X;
            T->height = 0;
            T->left = T->right = NULL;
        }
    }else if (X < T->element) {
        // 先插入，再旋转, 且这里肯定是插入在左子树的
        T->left = avlInSert(X, T->left);
        
        if (avlHeight(T->left) - avlHeight(T->right) == 2) {
            //当递归回溯到这个节点时就可以进行旋转调整平衡了
            if (X < T->left->element) {
                //插入的节点是在左子树上，则以T->left为原点，将T节点右旋（注意旋转之后将T->left的右节点当做T的左节点使用）
                T = singleRReroteWithLeft(T);
                
            }else{
                T = DoubleReroteWithLeft(T);
            }
        }
    }else if (X > T->element) {
        //
        T->right = avlInSert(X, T->right);
        if (avlHeight(T->right) - avlHeight(T->left) == 2) {
            if (X > T->left->element) {
                T = singleLReroteWiithRight(T);
            }else{
                T = DoubleReroteWithRight(T);
            }
        }
    }
    
    T->height = 1 + Max(avlHeight(T->left), avlHeight(T->right));
    
    return T;
}

/*
 同理删除，先删除，再调整平衡。但是删除的话，同样要借助FindMin函数来替换掉
 这里可以简单地画图进行实践。
 */
AVLTree avlDelete(AVLElement X, AVLTree T) {
    if ( NULL == T) {
        return NULL;
    }else if (X < T->element) {
        // 删除的是左子树节点。
        T->left = avlDelete(X, T->left);
        
        // 删完左子树上的节点后，左子树高度降低。所以应该调整右子树
        if (avlHeight(T->right) - avlHeight(T->left) == 2) {
            AVLTree temp = T->right;
            //子树的左子树高于右子树，则需要对T进行一次双旋转，让其回到平衡状态；
            //子树的左子树低于右子树，则直接对T进行一次右子树左旋就可以了。
            if (avlHeight(temp->left) > avlHeight(temp->right)) {
                T = DoubleReroteWithRight(T);
            }else{
                T = singleLReroteWiithRight(T);
            }
        }
    }else if (X > T->element) {
        //删除的是右子树上的节点
        T->right = avlDelete(X, T->right);
        
        // 删除右子树节点后，右子树节点高度肯定小于等于左子树高度。所以应该调整左子树
        if (avlHeight(T->left) - avlHeight(T->right) == 2) {
            AVLTree temp = T->left;
            //子树的右子树高于左子树，则需要对T进行一次双旋转，让其回到平衡状态；
            //子树的右子树低于左子树，则直接对T进行一次左子树右旋就可以了。
            if (avlHeight(temp->right) > avlHeight(temp->left)) {
                T = DoubleReroteWithLeft(T);
            }else{
                T = singleLReroteWiithRight(T);
            }
        }
        
    }else if (T->left && T->right) {
        /*  找的节点是有左右子树的话
            如果是左子树高度小于右子树，则用右子树的最小值替换当前节点，然后再去删除最小节点；
            如果是左子树高度大于右子树，则用左子树的最大值替换当前节点，然后再去删除最大节点。
         */
        if (avlHeight(T->left) < avlHeight(T->right)) {
            //左子树比右子树低,将右子树的最小值代替root
            AVLPosition tempCell = avlFindMin(T->right);
            T->element = tempCell->element;
            T->right = avlDelete(T->element, T->right);
            
        }else {
            //左子树比右子树高,将左子树的最大值代替root
            AVLPosition temp = avlFindMax(T->left);
            T->element = temp->element;
            T->left = avlDelete(T->element, T->left);
        }
        
    }else{
        /*
         找到的节点是叶子节点或者只有一个子树的节点，则直接用子树替换当期节点，然后free。
         */
        AVLPosition tempCell = T;
        if (T->left == NULL) {
            T = T->right;
        }else if (T->right == NULL){
            T = T->left;
        }
        free(tempCell);
    }
    
    
    
    T->height = 1 + Max(avlHeight(T->left), avlHeight(T->right));
    
    return T;
}

// 检索
AVLElement avlRetrieve(AVLPosition P) {
    return P->element;
}



