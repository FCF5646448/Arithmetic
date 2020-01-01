//
//  深度优先搜索DFS.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/12/20.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "深度优先搜索DFS.h"
#include <stdlib.h>

//深度优先遍历搜索图的邻接表：

#define MaxVertexNum 100
#define INFINITY    65535 //用来表示无穷大

typedef int Vertex;
typedef int Weight;

//定义边
typedef struct ENode * PtrToENode;
struct ENode {
    Vertex V1,V2;
    Weight weight;
};
typedef PtrToENode Edge;


//定义后接链表里的节点
typedef struct AdjVNode * PtrToAdjVNode;
struct AdjVNode {
    Vertex adjV;
    Weight wight;
    PtrToAdjVNode next;
};

////这个是存放边顶点元素的结构体，
typedef struct Vnode{
    PtrToAdjVNode FirstEdge; //边表头指针
    char name; //顶点名称
} AdjList[MaxVertexNum]; //存放所有顶点的结构体数组。


//定义图
typedef struct GNode * PtrToGNode;
struct GNode {
    int Nv; //顶点
    int Ne; //边
    AdjList G;
};
typedef PtrToGNode LGraph;

LGraph CreateGraph(int VerTexNum) {
    LGraph graph = malloc(sizeof(struct GNode));
    graph->Nv = VerTexNum; //
    graph->Ne = 0; //
    
    for (int i=0; i<graph->Ne; i++) {
        graph->G[i].FirstEdge = NULL;
    }
    
    return graph;
}


//无向图
void InsertEdge(LGraph graph, Edge E) {
    PtrToAdjVNode newNode;
    //生成一个新的后接链表节点，将边的一个顶点相关值赋值给它。
    newNode = malloc(sizeof(struct AdjVNode));
    newNode->adjV = E->V2;
    newNode->wight = E->weight;
    //将该节点插入到边的另一个顶点在邻接表中对应的后接链表的第0个位置。（有点绕，慢慢体会）
    newNode->next = graph->G[E->V1].FirstEdge;
    graph->G[E->V1].FirstEdge = newNode;
    
    
    // 另一个顶点，重复上面的处理步骤。
    newNode = malloc(sizeof(struct AdjVNode));
    newNode->adjV = E->V1;
    newNode->wight = E->weight;
    
    newNode->next = graph->G[E->V2].FirstEdge;
    graph->G[E->V2].FirstEdge = newNode;
}


LGraph BuildGraph() {
    LGraph graph;
    int VertexNum;
    printf("输入图的顶点数:");
    scanf("%d",&VertexNum);
    graph = CreateGraph(VertexNum);
    
    printf("\n输入图的边数:");
    scanf("%d",&(graph->Ne));
    if (graph->Ne > 0) {
        Edge E = malloc(sizeof(struct ENode));
        for (int i=0; i<graph->Ne; i++) {
            printf("\n输入第%d条边的第1个顶点：",i);
            scanf("%d",&(E->V1));
            printf("\n输入第%d条边的第2个顶点：",i);
            scanf("%d",&(E->V2));
            printf("\n输入第%d条边的权重：",i);
            scanf("%d",&(E->weight));
            
            InsertEdge(graph, E);
        }
    }
    
    printf("输入个顶点名称:\n");
    for (int i=0; i<graph->Nv; i++) {
        scanf("%s",&(graph->G[i].name));
    }
    
    return graph;
}


//定义一个数组指针
int *Visited;


//深度DFS
void DFS(LGraph graph, int i) {
    PtrToAdjVNode node;
    
    Visited[i] = 1;// 标记已访问
    printf("^(*￣(oo)￣)^  已访问顶点：%c\n",graph->G[i].name);
    
    node = graph->G[i].FirstEdge;
    //遍历边表的后接链表
    while (node) {
        if (node->adjV < graph->Nv && Visited[node->adjV] == 0) {
            //没有访问
            DFS(graph, node->adjV);
        }
        node = node->next;
    }
    
}


void DFSTraverse(LGraph G) {
    //初始化数组
    Visited = malloc(sizeof(int)*G->Nv);
    
    for (int i=0; i<G->Nv; i++) {
        Visited[i] = 0;
    }
    
    
    for (int i=0; i<G->Nv; i++) {
        if (Visited[i] == 0) {
            DFS(G, i);
        }
    }
    
}

void  TestDFS() {
    LGraph graph = BuildGraph();
    DFSTraverse(graph);
}
