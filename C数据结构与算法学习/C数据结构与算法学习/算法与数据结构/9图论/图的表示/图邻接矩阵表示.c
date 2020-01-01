////
////  图邻接矩阵表示.c
////  C数据结构与算法学习
////
////  Created by 冯才凡 on 2019/12/18.
////  Copyright © 2019 冯才凡. All rights reserved.
////
//
//#include "图邻接矩阵表示.h"
//#include <stdlib.h>
//
///*
// 邻接矩阵就是用一个二维数组（矩阵）来表示图，数组的横纵坐标依次表示的是顶点，值表示的是否连接或权重。
// 所以需要两个顶点和一个权重的值用来定义一个边的结构体。
// 然后图则有一个二维数组组成，二维数组对应的值与边是一一对应的。
// */
//#define MaxVertexNum 100 //最大顶点数
//#define INFINITY    65535 //用来表示无穷大
//typedef int Vertex; //用顶点下标表示顶点，为整数
//typedef int WeightType; //边的权重
//typedef char DataType;  //顶点存储的数据类型设为字符型
//
////边的定义
//typedef struct ENode *PtrToENode;
//struct ENode {
//    Vertex V1,V2; //一条边对应的两个顶点
//    WeightType Weight; //边的权重
//};
//typedef PtrToENode Edge;
//
//
////图的定义
//typedef struct GNode *PtrToGNode;
//struct GNode {
//    int Nv; //顶点数
//    int Ne; //边数
//    WeightType G[MaxVertexNum][MaxVertexNum]; //邻接矩阵, 无权图中，G[MaxVertexNum][MaxVertexNum]==1表示两个点直接有连接，为0表示无连接，有权图中，可以表示权重。
//    DataType Data[MaxVertexNum]; //存储顶点数据
//};
//typedef PtrToGNode MGraph;
//
//
//// 建图 ,传入一个顶点数
//// 初始化一个有VertexNum个顶点，没有边的图
//MGraph Create(int VertexNum) {
//    MGraph graph;
//    
//    graph = malloc(sizeof(struct GNode));
//    graph->Nv = VertexNum;
//    graph->Ne = 0;
//    
//    //初始化邻接矩阵,值都为无穷大
//    for (int i=1; i<=graph->Nv; i++) {
//        for (int j=1; j<=graph->Nv; j++) {
//            graph->G[i][j] = INFINITY;
//        }
//    }
//    return graph;
//}
//
////插入一条边，当前例子默认为无向图，所以得两个方向都初始化。
//void InsertEdge(MGraph graph, Edge E) {
//    graph->G[E->V1][E->V2] = E->Weight;
//    graph->G[E->V2][E->V1] = E->Weight;
//}
//
//// 形成一个完整的图
//MGraph buildGraph() {
//    MGraph graph = NULL;
//    int Nv;
//    
//    printf("创建一个图:\n");
//    printf("输入图的顶点数:");
//    scanf("%d",&Nv);
//    printf("\n");
//    // 初始化图
//    graph = Create(Nv);
//    
//    printf("输入图的边数：");
//    scanf("%d",&(graph->Ne));
//    printf("\n初始化边：");
//    
//    if (graph->Ne != 0) {
//        //有边
//        Edge E = malloc(sizeof(struct ENode));
//        for (int i=1; i<=graph->Ne; i++) {
//            printf("\n输入第%d条边的起点：",i);
//            scanf("%d",&(E->V1));
//            printf("\n输入第%d条边的终点：",i);
//            scanf("%d",&(E->V2));
//            printf("\n输入第%d条边的权重：",i);
//            scanf("%d",&(E->Weight));
//            
//            InsertEdge(graph, E);
//        }
//    }
//    
//    //给每个顶点命名
////    printf("\n 给每个顶点命名：");
////    for (int i=0; i<graph->Nv; i++) {
////        scanf("%s",&(graph->Data[i]));
////    }
//    
//    return graph;
//}
//
//
//void testCreatG() {
//    MGraph G = buildGraph();
//    
//    printf("\n最终的图：");
//    for (int i=1; i<=G->Nv; i++) {
//        for (int j=1; j<=G->Nv; j++) {
//            printf("%d--%d: %d \n",i,j,G->G[i][j]);
//        }
//    }
//    
//}
//
//
//
//
//
//
