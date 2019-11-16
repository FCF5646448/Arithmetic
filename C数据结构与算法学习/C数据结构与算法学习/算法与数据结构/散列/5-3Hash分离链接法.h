//
//  5-3Hash分离链接法.h
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/15.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#ifndef __3Hash______h
#define __3Hash______h

#include <stdio.h>

/*
 散列表的分离链接法:解决冲突的方式是将key相同的节点通过一个链表存起来。
 */
typedef int HashElementType;
struct HashListNode;
typedef struct HashListNode * HashList;
typedef HashList HashPosition;

struct HashTable;
typedef struct HSTable * HashTable;

struct HashListNode {
    HashElementType val;
    HashPosition next;
};

struct HSTable {
    int tablesize;
    HashList * theLists; //注意这是个指针类型
};


HashTable HashInitializeTable(int tableSize);

void HashDestoryTable(HashTable H);

HashPosition HashFind(HashElementType val, HashTable H);

void HashInsert(HashElementType val,HashTable H);

HashElementType HashRetrieve(HashPosition P);


#endif /* __3Hash______h */
