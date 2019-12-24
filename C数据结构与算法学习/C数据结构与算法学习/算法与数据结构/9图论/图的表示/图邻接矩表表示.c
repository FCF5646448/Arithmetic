////
////  图邻接矩表表示.c
////  C数据结构与算法学习
////
////  Created by 冯才凡 on 2019/12/19.
////  Copyright © 2019 冯才凡. All rights reserved.
////
//
//#include "图邻接矩表表示.h"
//#include <stdlib.h>
//
///*
// 邻接表的表示是用一个数组来存放图的b每一个节点，然后每一个节点自带一个链表，链表用来存储与当前节点相邻的节点。
// 
// */
//
//#define MaxVertexNum 100 //最大顶点数
//typedef int Vertex;     // 用顶点下标表示顶点
//typedef int WeightType;     //边的权重
//typedef char DataType;      //顶点数据类型
//
////定义边的节点 数据结构
//typedef struct ENode *PtrToENode;
//struct ENode {
//    Vertex V1,V2; //两个顶点组成一个边
//    WeightType weight; //边权重
//};
//typedef PtrToENode Edge;
//
//
////邻接点的定义
//typedef struct AdjVNode * PtrToAdjVNode;
//struct AdjVNode {
//    Vertex adjV;        //邻接点下标
//    WeightType wight;   //权重
//    PtrToAdjVNode Next; //指向下个邻接点的指针
//};
//
////这个是存放顶点元素的结构体，
//typedef struct Vnode{
//    PtrToAdjVNode FirstEdge; //边表头指针
//    DataType data; //存顶点的数据
//}AdjList[MaxVertexNum]; //存放所有顶点的结构体数组。
//
////图的定义
//typedef struct GNode * PtrToGNode;
//struct GNode {
//    int Nv;
//    int Ne;
//    AdjList G; //邻接表
//};
//typedef PtrToGNode LGraph; //
//
//
//
//// 初始化一个有VertexNum个顶点，但是没有边的图
//LGraph CreateGraph(int VertexNum) {
//    LGraph grap;
//    grap = malloc(sizeof(struct GNode));
//    grap->Nv = VertexNum;
//    grap->Ne = 0;
//    
//    //初始化邻接表头指针
//    for (int i=0; i<grap->Nv; i++) {
//        grap->G[i].FirstEdge = NULL;
//    }
//    
//    return grap;
//}
//
//// 最重要的就是理解这里
////插入一条边 无向图 意味着要在G数组中查找到两个节点，然后分别将另一个顶点插入到对应的链表上。
//void InsertEdge(LGraph graph, Edge E) {
//    PtrToAdjVNode newNode;
//    
//    //生成一个链表节点.
//    newNode = malloc(sizeof(struct AdjVNode));
//    newNode->adjV = E->V2;
//    newNode->wight = E->weight;
//    
//    //将该节点插入到另一个顶点G[E-V1]的后接链表的头部（既每次添加的新边都放到前面。最近最先使用原则）。
//    newNode->Next = graph->G[E->V1].FirstEdge;
//    graph->G[E->V1].FirstEdge = newNode;
//    
//    //同理：另一个方向也应该添加进来
//    newNode = malloc(sizeof(struct AdjVNode));
//    newNode->adjV = E->V1;
//    newNode->wight = E->weight;
//    
//    newNode->Next = graph->G[E->V2].FirstEdge;
//    graph->G[E->V2].FirstEdge = newNode->Next;
//    
//}
//
//
//LGraph BuildGrap()
//{
//    int VertexNum;
//    printf("输入顶点个数：");
//    scanf("%d",&VertexNum);
//    
//    LGraph graph = CreateGraph(VertexNum);
//    
//    printf("\n输入边数：");
//    scanf("%d",&(graph->Ne));
//    if (graph->Ne > 0) {
//        
//        Edge E = malloc(sizeof(struct ENode));
//        for (int i=0; i<graph->Ne; i++) {
//            printf("\n输入第%d条边的起点：",i);
//            scanf("%d",&(E->V1));
//            printf("\n输入第%d条边的终点：",i);
//            scanf("%d",&(E->V2));
//            printf("\n输入第%d条边的权重：",i);
//            scanf("%d",&(E->weight));
//            
//            InsertEdge(graph, E);
//        }
//    }
//    
//    return graph;
//}
//
//
//
//
//
//
//
