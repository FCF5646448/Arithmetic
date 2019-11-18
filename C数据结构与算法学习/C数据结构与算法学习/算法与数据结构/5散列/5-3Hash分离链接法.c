//
//  5-3Hash分离链接法.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/15.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "5-3Hash分离链接法.h"
#include <stdlib.h>

/*
 hash表是包含一个大小和一个连续内存的list，list存的是指针，指针指向对应key值的链表
 */
HashTable HashInitializeTable(int tableSize) {
    
    HashTable H;
    
    if (tableSize < 0) {
        return NULL;
    }
    
    H = malloc(sizeof(struct HSTable)); //其实也只是一个指针
    if (NULL == H) {
        return NULL;
    }
    //这里应该是NextPrime(tableSize),意为最接近tableSize的下一个素数
    H->tablesize = tableSize;
    //注意这里不是给结构体分配空间，而是给指针分配空间，该指针指向struct HashListNode结构体。
    H->theLists = malloc(sizeof(struct HashListNode * )*tableSize);
    if (NULL == H->theLists) {
        printf("out of space");
        return NULL;
    }
    
    for (int i = 0; i<H->tablesize; i++) {
        H->theLists[i] = malloc(sizeof(struct HashListNode));
        if (NULL == H->theLists[i]) {
            printf("out of space");
            return NULL;
        }
        H->theLists[i]->next = NULL;
    }
    
    
    return H;
}

void HashDestoryTable(HashTable H) {
    if (NULL == H) {
        return;
    }
    
    if (NULL != H->theLists) {
        for (int i=0; i<H->tablesize; i++) {
            free(H->theLists[i]);
        }
        free(H->theLists);
    }
    free(H);
}

//先通过散列函数获取到元素处于当前散列表的位置，然后再拿到散列表里的链表，最后在链表中取出所要找的元素
HashPosition HashFind(HashElementType val, HashTable H) {
    HashPosition P;
    HashList L;
    L = H->theLists[(val%H->tablesize)]; //这里应该是具体的散列函数，这里暂时用mod代替
    P = L->next;
    while (NULL != P && P->val != val) {
        P = P->next;
    }
    return P;
}


void HashInsert(HashElementType val,HashTable H) {
    HashPosition P;
    P = HashFind(val, H);
    if (P == NULL) {
        // 确保不存在后再插入
        HashList temp = malloc(sizeof(struct HashListNode));
        if (NULL == temp) {
            return;
        }
        
        //找到已经存在的链表
        HashList L = H->theLists[(val%H->tablesize)];
        
        temp->next = L->next;
        temp->val = val;
        
        L->next = temp;
        
    }
}


HashElementType HashRetrieve(HashPosition P) {
    return 0;
}



