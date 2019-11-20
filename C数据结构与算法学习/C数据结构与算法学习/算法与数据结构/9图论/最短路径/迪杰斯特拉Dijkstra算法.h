//
//  迪杰斯特拉Dijkstra算法.h
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/20.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#ifndef _____Dijkstra___h
#define _____Dijkstra___h

#include <stdio.h>

#define Max 10

struct _graph;
struct _edgeData;
typedef struct _graph * Graph;
typedef struct _edgeData * Edge;

//图的基本结构
struct _graph{
    char vexs[Max]; //顶点集合数
    int vexnum; //顶点数
    int edgnum; //边数
    int matrix[Max][Max]; //邻接矩阵
};

//边的结构体
struct _edgeData{
    char start; //边的起点
    char end;   //边的终点
    int weight; //边的权重
};


#endif /* _____Dijkstra___h */
