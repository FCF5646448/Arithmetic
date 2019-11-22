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



/*
 堆（这里使用大顶堆）排序主要分3个步骤：
 1、根据序列建立初始堆；
 2、进行查找最大值，将最大的数移到堆顶
 3、将堆顶从堆里移除，然后重新建堆，重复前两步操作
 */


/*
 将序列A找到最大值，订到堆顶的位置。
 最主要的节点i，i是堆中空穴的位置。
 
 之所以这里是2*i+1是因为起始点是从0下标开始的。。左子树的下标是2*i+1
 */
void BuidHeap(int A[], int i, int N) {
    int child;
    int tmp = A[i];
    for (; 2*i+1 < N; i = child) {
        child = 2*i+1;
        if (child != N-1 && A[child + 1] > A[child]) {
            child++;
        }
        
        if (tmp < A[child]) {
            A[i] = A[child];
        }else{
            break;
        }
    }
    A[i] = tmp;
}

void heapSort(int A[],int N) {
    //从倒数第2层开始
    for (int i = N/2; i>=0; i--) {
        BuidHeap(A, i, N);
    }
    
    for (int i = N-1; i>0; i--) {
        //将最后一个元素与堆顶交换。这样除去最后一个元素的堆又不是堆了，
        A[0] = A[0] + A[i];
        A[i] = A[0] - A[i];
        A[0] = A[0] - A[i];
        //重新构建0~i序列的堆。
        BuidHeap(A, 0, i);
    }
    
}


/*
 归并排序
 顾名思义：是将多个已排好序的序列合并成一个新的有序序列
 
 归并排序主要分为两个步骤：
 1、将n个元素分成各含n/2个元素的子序列
 2、用归并排序对两个字序列递归地进行排序
 3、合并这两个已经排序好的子序列得到排序结果
 */

#define Max 10
//m是指midlle
void Merge(int A[], int left, int m, int right) {
    int aux[Max] = {0}; //
    int i,j,k;
    for (i = left,j=m+1,k=0; k <= right-left;k++) {
        //若i到达第一个数组的尾部，将第二个数组余下元素复制到临时数组中
        if (i == m+1) {
            aux[k] = A[j++];
            continue;
        }
        
        //若j到第二个数组尾部，将第一个数组余下元素复制到临时数组
        if (j == right+1) {
            aux[k] = A[i++];
            continue;
        }
        
        //如果第一个数组的当前元素比第二个数组的当前元素小，将第一个数组的当前元素复制到临时数组中
        if (A[i] < A[j]) {
            aux[k] = A[i++];
        }else{
            aux[k] = A[j++];
        }
    }
    //将临时数组重新给到A
    for (i = left,j=0; i<=right; i++,j++) {
        A[i] = aux[j];
    }
}

void MergeSort(int A[],int star, int end) {
    if (star < end) {
        int i;
        i = star + (end-star)*0.5;
        //
        MergeSort(A, star, i);
        MergeSort(A, i+1, end);
        Merge(A, star, i, end);
    }
}






void sortTest(void) {
    int A[] = {1,10,8,5,7,15,35};
//    heapSort(A, 7);
    MergeSort(A, 0, 6);
    for (int i=0; i<7; i++) {
        printf("%d ",A[i]);
    }
}

