//
//  桶排序.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/24.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "桶排序.h"

//最高分10分,最低分0分
void tongSort(int *arr,int size) {
    int a[11] = {0};
    int result[11] = {-1};
    int index = 0;
    for (int i = 0; i < size; i++) {
        if (arr[i] >= 0) {
            a[arr[i]]++;
        }
    }
    
    for (int i = 10; i>=0;i--) {
        int temp = a[i];
        while (temp>0) {
            result[index++] = i;
            temp--;
        }
    }
    
    while (index >= 0) {
        printf("%d",result[index]);
        index--;
    }
    
}


void testTongSort() {
    int originArr[5] = {0};
    for (int i=0; i<5; i++) {
        int t = 0;
        scanf("%d",&t);
        originArr[i] = t;
    }
    
    tongSort(originArr,5);
    
}
