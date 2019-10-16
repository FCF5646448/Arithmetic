//
//  RadixSort.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/15.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "RadixSort.h"

//

struct Node {
    ElementType Element;
    PNode Next;
};

PNode createLink() {
    PNode L;
    L = malloc(sizeof(struct Node));
    if (L == NULL) {
        printf("Out of Space");
        return NULL;
    }
    L->Next = NULL;
    return L;
}

void insert(List L, ElementType element) {
    PNode tempNode;
    
    tempNode = malloc(sizeof(struct Node));
    if (tempNode == NULL) {
        printf("Out of Space");
        return;
    }
    tempNode->Element = element;
    tempNode->Next = NULL;
//    while (NULL != P->Next) {
//        P = P->Next;
//    }
    L->Next = tempNode;
}

// 计算 当前位数上的余数, pos 代表位数，0是个位、1是十、2是百... , radix代表当前基数10
int get_num_pos(int num, int pos, int radix) {
    int temp = 1;
    for (int i = 0; i<pos-1; i++) {
        temp *= 10;
    }
    return (num/temp)%radix;
}

void radixSort(List list,int radix,int pos_len) {
    PNode P,n;
    List assignArr[radix];
    //先初始化一个数组，数组的每个元素是一个空链表
    for (int i = 0; i < radix; i++) {
        assignArr[i] = createLink();
    }
    
    for (int i=0; i<pos_len; i++) {
        P = list;
        while (P->Next != NULL) {
            // 将链表里对应的 元素放到对应数组下标对应的链表里面
            // 取一个node
//            PNode n;
            n = P->Next;
            P = P->Next;
            n->Next = NULL;
            int result = get_num_pos(n->Element, pos_len, radix);
            //
            PNode elementLink = assignArr[result];
            
            while (elementLink->Next != NULL) {
                elementLink = elementLink->Next;
            }
            elementLink->Next = n;
            
        }
        
//        printf("第%d次分配\n", i);
//        for (int j = 0; j < radix; j++) {
//            printf("N-%d\t", j);
//        }
        
        //将第一次整理好的数据重新整理成链表
        P = list;
        
        for (int i = 0; i<radix; i++) {
            PNode elementLink;
            elementLink = assignArr[i];
            // 遍历数组每个元素的链表，将链表里的数据重新串成一个新的链表
            while (NULL != elementLink->Next) {
                PNode n;
                n = elementLink->Next; //取出结点
                elementLink = elementLink->Next; //指针顺移
                n->Next = NULL; //将结点独立
                
                P->Next = n; //将结点付给P
                P = P->Next; //顺移
            }
        }
    }
    
}


void testRadix(void)
{
    PNode source, P;
    int arr[N] = {64, 8, 216, 512, 27, 729, 0, 1, 343, 125};
    int i;
    int max = 1;
    for (i = 0; i <= POS_Len - 1; i++)
        max *= Radix;
    source = createLink();
    P = source;
    
    for (i = 0; i < N; i++) {
        insert(P, arr[i]);
        P = P->Next;
    }
    
    P = source;
    while (NULL != P->Next) {
        printf("%d",P->Element);
        P = P->Next;
    }
    
    radixSort(source, Radix, POS_Len);
    printf("结果\n");
    P = source;
    while (NULL != P->Next) {
        printf("%d",P->Element);
        P = P->Next;
    }
//    print(source);
}


