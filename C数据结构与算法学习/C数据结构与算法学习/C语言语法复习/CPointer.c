//
//  CPointer.c
//  C数据结构与算法学习
//
//  Created by 冯才凡 on 2019/10/23.
//  Copyright © 2019 冯才凡. All rights reserved.
//

#include "CPointer.h"


void testCPointer() {
    int ages[] = {23,45,12,2};
    char *names[] = {
      "Alan", "Frank","Mary","John"
    };
    int count = sizeof(ages)/sizeof(int);
    int i = 0;
    //
    for (i=0; i<count; i++) {
        printf("%s has %d years alive.\n",names[i],ages[i]);
    }
    
    printf("--------------------------------\n");
    
    int *cur_age = ages;
    char **cur_name = names; //char *是指向字符的指针，char ** 则是指向‘指向字符的指针’的指针。
    
    for (i=0; i<count; i++) {
        printf("%s is %d years old.\n",*(cur_name+i),*(cur_age+i));
    }
    
    printf("--------------------------------\n");
    
    for (i=0; i<count; i++) {
        printf("%s is %d years old again.\n",cur_name[i], cur_age[i]);
    }
    
    printf("--------------------------------\n");
    
    for (cur_name = names, cur_age = ages; cur_age - ages < count; cur_name++,cur_age++) {
        printf("%s is %d years old again.\n",*cur_name, *cur_age);
    }
    
    
    
}
