//
//  RadixSort.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/15.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "RadixSort.h"

/* 总结：
 1、指针的含义不是特别清晰，通篇代码里都是在移动指针的位置
 2、每个链表都有一个header
 3、创建链表只是创建一个带有默认值的单结点。
 4、整个排序的规则是：
        1）先把所有的数据用链表串起来；然后生成一个从0~9的基数桶，每个桶都放一个链表；
        2）然后先从最低位开始，将该位数对应的数据放到对应的桶链表里(链表自然就从小到大排序);
        3）遍历完第一遍后，将所有数据按基数顺序又重新串联起来；
        4）进行进一位遍历，重复2、3步骤。
 */

//

//#define N 10 //数个数
//#define Radix 10
//#define POS_Len 3
//
//typedef int ElementType;
//
//struct RSNode;
//typedef struct RSNode * RSPNode;
//typedef RSPNode RSList;
//
//struct RSNode {
//    ElementType Element;
//    RSPNode Next;
//};
//
//RSPNode createLink() {
//    RSPNode L;
//    L = malloc(sizeof(struct RSNode));
//    if (L == NULL) {
//        printf("Out of Space");
//        return NULL;
//    }
//    L->Next = NULL;
//    return L;
//}
//
//void insert(RSList L, ElementType element) {
//    RSPNode tempNode;
//    
//    tempNode = malloc(sizeof(struct RSNode));
//    if (tempNode == NULL) {
//        printf("Out of Space");
//        return;
//    }
//    tempNode->Element = element;
//    tempNode->Next = NULL;
//    L->Next = tempNode;
//}
//
//// 计算 当前位数上的余数, pos 代表位数，0是个位、1是十、2是百... , radix代表当前基数10
//int get_num_pos(int num, int pos, int radix) {
//    int temp = 1, i;
//    for (i = 0; i < pos - 1; i++)
//        temp *= radix;
//    return (num / temp) % radix;
//}
//
//// 基数排序
//void radixSort(RSList list,int radix,int pos_len) {
//    RSPNode P;
//    RSList assignArr[radix];
//    //先初始化一个数组，数组的每个元素是一个空链表
//    for (int i = 0; i < radix; i++) {
//        assignArr[i] = createLink();
//    }
//    
//    for (int i=1; i<=pos_len; i++) {
//        P = list;
//        // 将链表里对应的 元素放到对应数组下标对应的链表里面 无需保留原来链表
//        while (P->Next != NULL) {
//            // 取一个node
//            RSPNode n;
//            n = P->Next;
//            P->Next = n->Next; //直接丢弃这个结点。
//            n->Next = NULL;
//            int result = get_num_pos(n->Element, i, radix);
//            //
//            RSPNode elementLink = assignArr[result];
//            
//            while (elementLink->Next != NULL) {
//                elementLink = elementLink->Next;
//            }
//            elementLink->Next = n;
//        }
//        
//        //将第一次整理好的数据重新整理成 链表
//        P = list;
//        
//        for (int i = 0; i<radix; i++) {
//            RSPNode elementLink;
//            elementLink = assignArr[i];
//            // 遍历数组每个元素的链表，将链表里的数据重新串成一个新的链表
//            while (NULL != elementLink->Next) {
//                RSPNode n;
//                n = elementLink->Next; //取出结点
//                elementLink->Next = n->Next; //链表直接截断已取出的结点
//                n->Next = NULL; //将结点独立
//                
//                P->Next = n; //将结点付给P
//                P = P->Next; //顺移
//            }
//        }
//    }
//    
//}
//
//
//void testRadix(void)
//{
//    RSPNode source, P;
//    int arr[N] = {64, 8, 8, 512, 127, 729, 7, 1, 343, 125};
//    int i;
//    int max = 1;
//    for (i = 0; i <= POS_Len - 1; i++)
//        max *= Radix;
//    source = createLink();
//    P = source;
//    
//    for (i = 0; i < N; i++) {
//        insert(P, arr[i]);
//        P = P->Next;
//    }
//    
//    P = source;
//    while (NULL != P->Next) {
//        printf("%d",P->Element);
//        P = P->Next;
//    }
//    
//    radixSort(source, Radix, POS_Len);
//    printf("\n结果: ");
//    P = source->Next;
//    while (NULL != P ) {
//        printf("%d ",P->Element);
//        P = P->Next;
//    }
//    printf("\n");
//}


