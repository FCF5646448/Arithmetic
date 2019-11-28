//
//  解密QQ号_队列.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/28.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "解密QQ号_队列.h"
#include <stdlib.h>
//解密QQ号练习
/*
 这道题的最大技巧就是使用了head和tail两个变量，这样数组每次删除完之后就无需把后面的元素都往前移除。以空间还时间的做法。
 而这正好是队列的数据结构
 */
void jmQQQueue() {
    int q[101] = {6,3,1,7,5,8,9,2,4};
    int *real = malloc(sizeof(int) * 9);
    int head = 0;
    int tail = 9;
    int i = 0;
    while (head < tail) {
        //需要删除的数
        real[i++] = q[head++];
        q[tail++] = q[head++];
    }
    
    for (int i=0; i<9; i++) {
        printf("%d ",real[i]);
    }
}

