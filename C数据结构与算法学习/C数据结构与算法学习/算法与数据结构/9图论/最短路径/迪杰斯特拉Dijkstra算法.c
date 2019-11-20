//
//  迪杰斯特拉Dijkstra算法.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/20.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "迪杰斯特拉Dijkstra算法.h"
#include <stdlib.h>
#include <math.h>

#define INF 10000

/*
 G 图
 vs 起始顶点
 prev 前驱顶点数组，prev[i]的值是顶点vs到顶点i的最短路径所经历的全部顶点中位于i之前的那个顶点
 dist 长度数组，即dist[i]是顶点vs到顶点i的最短路径长度。
 */
void dijkstra(Graph G, int vs, int prev[], int dist[]){
    
    int flag[Max]; //flag[i]表示顶点vs到顶点i的最短路径已经成功获取。
    // 初始化
    for (int i=0; i<G->vexnum; i++) {
        flag[i] = 0;    //顶点i的最短路径还没获取到
        prev[i] = 0;    //顶点i的前驱节点为0
        dist[i] = G->matrix[vs][i];//顶点i的最短路径为顶点i的权
    }
    
    //对顶点vs自身进行初始化
    flag[vs] = 1;
    dist[vs] = 0;
    
    int min;
    int k = 0;
    for (int i=0; i<G->vexnum; i++) {
        //
        min = INF; //无穷大
        for (int j = 0; j<G->vexnum; j++) {
            if (flag[j] == 0 && dist[j]<min) {
                min = dist[j];
                k = j;
            }
        }
        
        //标记顶点k为已获取到的最短路径
        flag[k] = 1;
         //修正当前最短路径和前驱顶点,即当已经”顶点k的最短路径“之后，更新”未获取最短路径的顶点的最短路径和前驱顶点“
        for (int j=0; j<G->vexnum; j++) {
            int temp = ((G->matrix[k][j] ==  INF ) ?  INF : (min + G->matrix[k][j]));
            if (flag[j] == 0 && (temp < dist[j])) {
                dist[j] = temp;
                prev[j] = k;
            }
        }
    }
    
    for (int i=0; i<G->vexnum; i++) {
        printf("(%d,%d) == %d ",G->vexs[vs],G->vexs[i],dist[i]);
    }
    
}
