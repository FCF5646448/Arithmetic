//
//  冒泡排序.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/24.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "冒泡排序.h"

// 从大到小排序
/*
 注：冒泡排序：实质就是相邻的数相比较。
    然后i到size之间的都是未排好序的；
    j到i之间的都是已排好序的。
    所以每次插进一个i到size区间的数，
    都需要将0到i之后的数相邻之间比较一下，确保排好序
 
 */
void MPSort(int * arr,int size) {
    for (int i=0; i<size-1; i++) {
        for (int j=0; j<size-i; j++) {
            if (arr[j] < arr[j+1]) {
                int temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
    printf("\n");
    int i = 0;
    while (i<size) {
        printf("%d  ",arr[i++]);
    }
    
}

void testMPSort() {
    
    int originArr[] = {3,2,4,5,2,8,9,7};
    int * p = originArr;
    for (int i=0; i<8; i++) {
        printf("%d ",originArr[i]);
    }
    
    MPSort(p,8);
}
