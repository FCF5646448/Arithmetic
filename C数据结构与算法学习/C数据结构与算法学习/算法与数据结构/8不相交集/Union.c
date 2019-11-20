//
//  Union.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/19.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "Union.h"

/*
 初始化
 每个根节点保存的值就是该树的大小的负值，也就是-1；
 树的大小意思是树中有多小个节点
 如果节点中保存的值为正数m，那么该值表示父节点在数组中的下标。
 
 */
void DSinitialize(DisjSet S) {
    for (int i = NumSets; i>0; i--) {
        S[i] = -1;
    }
}


//合并两个不相交集，root1和root2是两颗树的根
void SDSetUnion(DisjSet s,DSSetType root1,DSSetType root2){
    if (s[root1] >= 0 || s[root2] >= 0 ) {
        return;
    }
    if (s[root1] == s[root2]) {
        //同一颗树
        return;
    }else{
        if (s[root1] > s[root2]) {
            s[root1] = root2;
        }else{
            s[root2] = root1;
        }
    }
    
}

//查找x属于set中的哪个不相交集
DSSetType DSFind(DSElementType x,DisjSet s){
    if (x > NumSets) {
        return 0;
    }
    //
    if (s[x] == 0) {
        return 0;
    }
    
    if (s[x] < 0) {
        return x;
    }else{
        return s[x] = DSFind(s[x], s);
    }
    
}

