//
//  深度优先遍历.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/11/29.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "深度优先遍历.h"
#include <stdio.h>

//深度优先算法，也就是回溯算法。
//n表示从1到n
int p[100][3];
int num=0;
int result[4],book[3],n;

void dfs(int step) {
    
    //判断结束的条件。
    if (step == n+1) {
        for (int i=1; i<=n; i++) {
            printf("%d ",result[i]);
        }
        printf("\n");
        return;
    }
    
    
    for (int i=1; i<=n; i++) {
        //遍历所有的可能性
        //book[i] == 0 表示还未使用的数据
        if (book[i] == 0) {
            //使用
            result[step] = i;
            //标记已使用
            book[i] = 1;
            /*到了这里，则已经处理完了第step步骤，则接下来就是处理第step+1步了*/
            //
            dfs(step + 1);
            // 回溯回来，将刚才的尝试收回。
            book[i] = 0;
        }
    }
    
    return;
}

void testDfs() {
    n = 3;
    dfs(1);
}
