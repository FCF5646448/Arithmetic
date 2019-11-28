//
//  小猫钓鱼.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/28.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "小猫钓鱼.h"

/*
 游戏规则：将一副扑克牌（只有1~9的牌面）分成两份。A先拿出一张牌打到桌面上，B也拿出一张牌打到桌面上，并且放到A的牌的上面。如果某人打出牌的牌面与桌面上某张牌面相同时，可将两张相同的牌及其中间所夹牌全部取走，并以此放在自己手中牌的末尾。当任意一人打完手中的牌时游戏结束，对手获胜。
 注意：这里出牌是按手中牌的顺序出的。
 
 分析：
 1、每个人手中的牌正好是一个队列：出牌就是出对，赢牌是入队；
 2、桌面上的牌正好是一个栈：打牌的时候是一个入栈的过程，当有牌与当前栈中牌面相同时就出栈
 3、需要有个数组标记，标记哪些牌桌面上是有的。
 
 */

struct PKQueue{
    int data[1000]; //
    int head;
    int tail;
};

struct PKStack {
    int data[10];
    int top;
};


void dapaitest() {
    struct PKQueue A,B;
    A.head = 1;
    A.tail = 1;
    B.head = 1;
    B.tail = 1;
    struct PKStack S;
    //重点：真正的数值从1开始
    S.top = 0;
    
    //用来标记哪些牌桌面上是有的,默认都不在
    int book[10] = {0};
    for (int i=1; i<=9; i++) {
        book[i] = 0;
    }
    
    //A手中的牌
    printf("请依次输入A手中的牌：");
    for (int i = 0; i<6; i++) {
        scanf("%d",&A.data[A.tail++]);
    }
    printf("\n");
    
    printf("请依次输入B手中的牌：");
    for (int i = 0; i<6; i++) {
        scanf("%d",&B.data[B.tail++]);
    }
    printf("\n");
    
    //开始打牌 结束的标志是其中任何一方没牌了。
    while (A.head < A.tail && B.head < B.tail) {
        //A出牌：
        int At = A.data[A.head++];
        //判断桌面上是否有相同牌面的牌
        if (book[At] == 1) {
            //有，先把打出去的刚打出去的牌收入手中，再把桌面上范围内的牌收入囊中：
            A.data[A.tail++] = At;
            while (S.top > 0) {
                int pk = S.data[S.top];
                S.top--;
                A.data[A.tail++] = pk;
                book[pk] = 0;
                if (pk == At) {
                    break;
                }
            }
        }else{
            //没有,打出去：
            S.data[++S.top] = At;
            
            book[At] = 1;
        }
        
        if (A.head == A.tail) {
            break;
        }
        
        //B出牌
        int Bt = B.data[B.head++];
        //判断桌面上是否有相同牌面的牌
        if (book[Bt] == 1) {
            //有，收入囊中：
            B.data[B.tail++] = Bt;
            while (S.top > 0) {
                int pk = S.data[S.top];
                S.top--;
                B.data[B.tail++] = pk;
                book[pk] = 0;
                if (pk == Bt) {
                    break;
                }
            }
        }else{
            //没有：
            S.data[++S.top] = Bt;
            
            book[Bt] = 1;
        }
    }
    
    if (A.head == A.tail) {
        printf("B win");
        printf("B 的牌是： ");
        for (int i=B.head; i<B.tail; i++) {
            printf("%d ",B.data[i]);
        }
    }else if (B.head == B.tail) {
        printf("A win");
        printf("A 的牌是： ");
        for (int i=A.head; i<A.tail; i++) {
            printf("%d ",A.data[i]);
        }
    }
    printf("\n");
    printf("桌面上还剩余牌：");
    while (S.top>0) {
        printf("%d ",S.data[S.top--]);
    }
    printf("\n");
}
