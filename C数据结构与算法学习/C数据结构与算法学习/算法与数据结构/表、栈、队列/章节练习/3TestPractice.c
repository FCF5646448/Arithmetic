//
//  3TestPractice.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/1.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "3TestPractice.h"
typedef int ElementType;
typedef struct TestLinkNode * TLink;
typedef struct TestDoubtLinkNode *TDLink;
typedef TLink Node;
typedef TDLink DNode;

// 单链表
struct TestLinkNode {
    ElementType val;
    Node Next;
};

struct TestDoubtLinkNode {
    ElementType val;
    DNode Next; //后
    DNode Pre;  //前
};




//3.1打印一个单链表的所有元素
void testPrinAlink(TLink L) {
    TLink temp = L;
    while (NULL != temp->Next) {
        printf("%d",temp->val);
        temp = temp->Next;
    }
}

//3.2给你一个链表L和另一个链表P，它包含以升序排列的整数。函数将打印L中由P所指定位置的元素
void PrintLots(TLink L,TLink P){
    TLink tempA = L;
    TLink tempB = P;
    int count = 0;
    // 对L进行循环，因为L肯定更长
    while (NULL != tempA->Next) {
        //取出需要打印的下标
        int index = tempB->val;
        if (count == index) {
            //找到需要打印的位置
            printf("%d",tempA->val);
            tempB = tempB->Next;
        }
        count++;
        tempA = tempA->Next;
    }
}

//3.3只通过调整指针来交换两个相邻的元素 Position是需要交换的位置,将它与它后一个位置的值进行交换
void SwapWithNextA(TLink L,int Position){
    Node first;
    first = L;
    
    int count = 0;
    while (NULL != first->Next) {
        //先找到这个值
        if (count+1 == Position) {
            if (NULL != first->Next) {
                Node second = first->Next;
                if (NULL != second->Next) {
                    //交换
                    first->Next = second->Next;
                    second->Next = first->Next->Next;
                    first->Next->Next = second;
                    break;
                }
            }
        }
        count++;
        first = first->Next;
    }
}

void SwapWithNext2B(TDLink L,int Position){
    TDLink first;
    first = L;
    int count = 0;
    while (NULL != first->Next) {
        //
        if (count == Position) {
            DNode secoond = first->Next;
            first->Next = secoond->Next;
            secoond->Next->Pre = first;
            secoond->Next = first->Next->Next;
            secoond->Pre = first->Next;
            break;
        }
        count++;
        first = first->Next;
    }
}

//4 给定两个已排序的




