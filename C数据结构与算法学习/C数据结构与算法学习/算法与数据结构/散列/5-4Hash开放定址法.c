//
//  5-4Hash开放定址法.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/16.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "5-4Hash开放定址法.h"
#include <stdlib.h>

HashTable Hash2InitializTable(int TableSize) {
    HashTable H;
    if (TableSize < 0) {
        return NULL;
    }
    
    H = malloc(sizeof(struct HSTable2));
    if (H == NULL) {
        return NULL;
    }
    //这里也应该是一个素数。大于TableSize的最近素数。
    H->TableSize = TableSize;
    //生成一个执行struct HashEntry结构体的指针。
    H->TheCells = malloc(sizeof(struct HashEntry *) * H->TableSize);
    if (H->TheCells == NULL) {
        return NULL;
    }
    
    for (int i=0; i<TableSize; i++) {
        H->TheCells[i].Info = Empty;
    }
    
    return H;
}

void Hash2DestoryTable(HashTable H) {
    if (NULL == H) {
        return;
    }
    if (NULL != H->TheCells) {
        free(H->TheCells);
    }
    free(H);
}

//
Hash2Position Hash2Find(Hash2ElementType key, HashTable H) {
    Hash2Position currentPos;

    int CollisionNum = 0;
    //这里也应该是hash函数，这里暂时用mod代替
    currentPos = (key%H->TableSize);
    while (H->TheCells[currentPos].Info != Empty && H->TheCells[currentPos].Element != key) {
        // 平方探址法的精髓：F(i) = F(i-1)+2*1 -1
        currentPos += 2 * ++CollisionNum -1;
        
        //如果超过表大小，则将其拉回表的范围。
        if (currentPos >= H->TableSize) {
            currentPos -= H->TableSize;
        }
    }

    return currentPos;
}

void Hash2Insert(Hash2ElementType key, HashTable H) {
    Hash2Position Pos;
    Pos = Hash2Find(key, H);
    if (H->TheCells[Pos].Info != Legitimate) {
        H->TheCells[Pos].Info = Legitimate;
        H->TheCells[Pos].Element = key;
    }
}
