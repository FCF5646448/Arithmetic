//
//  快速排序.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/31.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "快速排序.h"

/*
 注：快速排序用到了两个算法思维，一个是二分法，一个是递归。
 最最主要的思想是按顺序确定基准数，然后从两端开始往中间找。
 还有一个需要注意的点是先右侧起，找到小于基准数的值，然后再从左侧找大于基准数的值。因为基准数往往是定的最左侧的数，让右侧先行就更容易保存平衡！！！
 */

void QuickSort(int *q, int left,int right) {
    if (left > right) {
        return;
    }
    
    //基准数
    int temp = q[left];
    int i = left;
    int j = right;
    //
    
    //循环结束的条件就是左右两端的哨兵碰到一起了,此时则说明找到了基准数应该处于的位置
    while (i != j) {
        //
        
        //先从右往左找，找小于基准数的值，从右往左找
        while (q[j] >= temp && i < j) {
            j--;
        }
        
        //找到小于基准数的值之后，再接着找大于基准数的值，从左往右找
        while (q[i] <= temp && i < j) {
            i++;
        }
        
        //交换
        if (i<j) {
            int t = q[i];
            q[i] = q[j];
            q[j] = t;
        }
    }
    
    //最重要的，将基准数归位
    q[left] = q[i];
    q[i] = temp;
    
    //接着，递归分别处理左右两边的小队列
    QuickSort(q,left,i-1);
    QuickSort(q, j+1, right);
    
    return;
}



void testQuickSort() {
    
    int originArr[] = {6,1,2,7,9,3,4,5,10,8};
    int * p = originArr;
    QuickSort(p, 0, 9);
    
    for (int i=0; i<10; i++) {
        printf("%d ",originArr[i]);
    }
    
}
