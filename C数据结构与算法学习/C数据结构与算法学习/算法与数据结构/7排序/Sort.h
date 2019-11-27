//
//  Sort.h
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/18.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#ifndef Sort_h
#define Sort_h

#include <stdio.h>

//插入排序
void insertSort(int A[],int N);


//希尔排序
void insertShellSort(int A[],int N);



// 堆排序
void heapSort(int A[],int N);


//归并排序
void MergeSort(int A[],int star, int end);


void sortTest(void);
#endif /* Sort_h */
