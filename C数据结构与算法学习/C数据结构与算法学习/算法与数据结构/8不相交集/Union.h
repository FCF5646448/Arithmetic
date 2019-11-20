//
//  Union.h
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/19.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#ifndef Union_h
#define Union_h

#include <stdio.h>

const int NumSets = 10;

// 为了下标对齐，这里设定数组大小为NumSets+1，地
typedef int DisjSet[NumSets+1];

typedef int DSSetType; //

typedef int DSElementType;

//初始化
void DSinitialize(DisjSet S);


//合并两个不相交集，root1和root2是两颗树的根
void SDSetUnion(DisjSet s,DSSetType root1,DSSetType root2);

//查找x属于set中的哪个不相交集
DSSetType DSFind(DSElementType x,DisjSet s);




#endif /* Union_h */
