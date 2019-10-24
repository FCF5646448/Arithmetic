//
//  冒泡排序.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/24.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "冒泡排序.h"

// 从大到小排序
void MPSort(int * arr,int size) {
    for (int i=1; i<=size-1; i++) {
        for (int j=1; j<=size-i; j++) {
            if (arr[j] < arr[j+1]) {
                int temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
    
    while (size > 0) {
        printf("%d  ",arr[size--]);
    }
    
}

void testMPSort() {
    
    int originArr[8] = {3,2,4,5,2,8,9,'\0'};
    MPSort(originArr,8);
}
