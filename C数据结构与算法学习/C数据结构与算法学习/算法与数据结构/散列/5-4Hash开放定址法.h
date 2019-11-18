//
//  5-4Hash开放定址法.h
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/16.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#ifndef __4Hash______h
#define __4Hash______h

#include <stdio.h>

typedef int Hash2ElementType;

typedef unsigned int Index;
typedef Index Hash2Position;

struct HSTable2;
typedef struct HSTable2 * HashTable;





enum KindOfEntry {
    Legitimate,
    Empty,
    Deleted
};

//这里是使用了平方探测法。
struct HashEntry {
    Hash2ElementType Element;
    enum KindOfEntry Info;
};

typedef struct HashEntry *  Cell;

struct HSTable2 {
    int TableSize;
    Cell TheCells;
};

HashTable Hash2InitializTable(int TableSize);

void Hash2DestoryTable(HashTable H);

Hash2Position Hash2Find(Hash2ElementType key, HashTable H);

void Hash2Insert(Hash2ElementType key, HashTable H);

#endif /* __4Hash______h */
