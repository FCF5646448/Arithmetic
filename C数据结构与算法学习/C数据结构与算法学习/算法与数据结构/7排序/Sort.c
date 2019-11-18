//
//  Sort.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/18.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "Sort.h"

/*
 插入排序：
 插入排序就是假设i之前的元素都是已排好序的，然后每次遍历到新元素时。
 */
void insertSort(int A[],int N) {
    int tmp;
    for (int i = 1; i<N; i++) {
        tmp = A[i];
        int j;
        //A[i]从i逐个跟已排序好的序列(0,i-1]进行比较，满足条件就进行交换。
        for (j=i; j>0 && A[j-1]>tmp; j--) {
            A[j] = A[j-1];
        }
        A[j] = tmp;
    }
}


/*
 希尔排序：
 希尔排序是升级后的插入排序。它是把序列逐步分割成若干个小序列排序。然后再合并，之后再分割：
 比如：12、1、6、7、4、10、5、9。
 第一次increment = N/2 = 4
 就分割成了4组：(12,4)、（1、10）、（6、5）、（7、9），最终得到：4、1、5、7、12、10、6、9
 第二次increment = 2
 就分割成了2组：（4、5、12、6）、（1、7、10、9），最终得到（4、1、5、7、6、9、12、10）
 最后一次increment=1。则最终得到1、4、5、6、7、9、10、12
 */
void insertShellSort(int A[],int N) {
    
    int tmp;
    int i,j,increment;
    for (increment = N/2; increment > 0 ; increment /= 2) {
        for (i = increment; i<N; i++) {
            tmp = A[i];
            for (j = i; j >= increment; j -= increment) {
                if (tmp < A[j-increment]) {
                    A[j] = A[j-increment];
                }else{
                    break;
                }
            }
            A[j] = tmp;
        }
    }
}
