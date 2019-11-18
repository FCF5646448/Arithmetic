//
//  LeetCodeArrExamples.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/13.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "LeetCodeArrExamples.h"

/*
 leetCode 1252
 给你一个 n 行 m 列的矩阵，最开始的时候，每个单元格中的值都是 0。

 另有一个索引数组 indices，indices[i] = [ri, ci] 中的 ri 和 ci 分别表示指定的行和列（从 0 开始编号）。

 你需要将每对 [ri, ci] 指定的行和列上的所有单元格的值加 1。

 请你在执行完所有 indices 指定的增量操作后，返回矩阵中 「奇数值单元格」 的数目。

  

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/cells-with-odd-values-in-a-matrix
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 输入：n = 2, m = 3, indices = [[0,1],[1,1]]
 输出：6
 解释：最开始的矩阵是 [[0,0,0],[0,0,0]]。
 第一次增量操作后得到 [[1,2,1],[0,1,0]]。
 最后的矩阵是 [[1,3,1],[1,3,1]]，里面有 6 个奇数

 
 1 <= n <= 50
 1 <= m <= 50
 1 <= indices.length <= 100
 0 <= indices[i][0] < n
 0 <= indices[i][1] < m
 
 */
int oddCells(int n, int m, int** indices, int indicesSize, int* indicesColSize){
    int originl[50][50] = {0};
    
    for (int i = 0; i<indicesSize; i++) {
        for (int j = 0; j<indicesColSize[i]; j++) {
            // 第一个数表示行，第二个数表示列
            
            printf("indices[%d][%d] = %d\n", i,j,*((int*)indices + indicesColSize[i]*i + j));
            
            if (j%2 == 0) {
                //行
                int * item = (int*)indices + indicesColSize[i]*i;
                int row = item[j];
                
                int* rows = originl[row];
                for (int k = 0; k<m; k++) {
                    rows[k]++;
                }
            }else if(j%2 == 1) {
                //列
                int * item = (int*)indices + indicesColSize[i]*i;
                int col = item[j];
                
                for (int k = 0; k < n; k++) {
                    for (int l = 0; l < m; l++) {
                        if (l == col) {
                            originl[k][l]++;
                        }
                    }
                }
                
            }
        }
    }
    
    printf("*****************************\n");
    int sum = 0;
    for (int i = 0; i<n; i++) {
        for (int j = 0; j<m; j++) {
            printf("originl[%d][%d] = %d\n",i,j,originl[i][j]);
            if (originl[i][j] % 2 == 1) {
                sum++;
            }
        }
    }
    
    
    return sum;
}


void testArr(void) {
    int indices[2][2] = {{0,1},{1,1}};
    
    int indicesColSize[2] = {2,2};
    int (*p)[2] = indices;

    
    for (int i = 0; i<2; i++) {
        for (int j = 0 ; j<2; j++) {
            printf("%d", *(*(p+i) + j));
        }
    }
    
    
    int sum = oddCells(2, 3, (int **)indices, 2, indicesColSize);
    
    printf("sum = %d\n",sum);
    
}
