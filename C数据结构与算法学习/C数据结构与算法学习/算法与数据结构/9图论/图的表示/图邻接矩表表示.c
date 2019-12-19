//
//  图邻接矩表表示.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/12/19.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "图邻接矩表表示.h"
#include <stdlib.h>

/*
 邻接表的表示是用一个数组来存放图的b每一个节点，然后每一个节点自带一个链表，链表用来存储与当前节点相邻的节点。
 
 */

#define MaxVertexNum 100 //最大顶点数
typedef int Vertex;     // 用顶点下标表示顶点
typedef int WeightType;     //边的权重
typedef char DataType;      //顶点数据类型

//定义边的节点 数据结构
typedef struct ENode *PtrToENode;
struct ENode {
    Vertex V1,V2; //两个顶点组成一个边
    WeightType weight; //边权重
};
typedef PtrToENode Edge;


//邻接点的定义
typedef struct AdjVNode * PtrToAdjVNode;
struct AdjVNode {
    Vertex adjV;        //邻接点下标
    WeightType wight;   //权重
    PtrToAdjVNode Next; //指向下个邻接点的指针
};

//顶点表头节点的定义
typedef struct Vnode{
    PtrToAdjVNode FirstEdge; //边表头指针
    DataType data; //存顶点的数据
}AdjList[MaxVertexNum]; //链表

//图的定义
typedef struct GNode * PtrToGNode;
struct GNode {
    int Nv;
    int Ne;
    AdjList G; //邻接表
};
typedef PtrToGNode LGraph; //



// 初始化一个有VertexNum个顶点，但是没有边的图
LGraph CreateGraph(int VertexNum) {
    LGraph grap;
    grap = malloc(sizeof(struct GNode));
    grap->Nv = VertexNum;
    grap->Ne = 0;
    
    //初始化邻接表头指针
    for (int i=0; i<grap->Nv; i++) {
        grap->G[i].FirstEdge = NULL;
    }
    
    return grap;
}


//插入一条边 无向图
void InsertEdge(LGraph graph, Edge E) {
    PtrToAdjVNode newNode;
    
    newNode = malloc(sizeof(struct AdjVNode));
    newNode->adjV = E->V2;
    newNode->wight = E->weight;
    
    newNode->Next = graph->G[E->V1].FirstEdge;
    graph->G[E->V1].FirstEdge = newNode;
    
    //无向图，另一个方向也应该添加进来
    newNode = malloc(sizeof(struct AdjVNode));
    newNode->adjV = E->V1;
    newNode->wight = E->weight;
    
    newNode->Next = graph->G[E->V2].FirstEdge;
    graph->G[E->V2].FirstEdge = newNode->Next;
    
}







