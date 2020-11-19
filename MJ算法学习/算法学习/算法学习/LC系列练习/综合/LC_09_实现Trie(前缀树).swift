//
//  LC_09_实现Trie(前缀树).swift
//  算法学习
//
//  Created by 冯才凡 on 2020/11/18.
//  Copyright © 2020 冯才凡. All rights reserved.
//

import Foundation

/*
 实现一个 Trie (前缀树)，包含 insert, search, 和 startsWith 这三个操作。
 
 示例:
 
 Trie trie = new Trie();
 
 trie.insert("apple");
 trie.search("apple");   // 返回 true
 trie.search("app");     // 返回 false
 trie.startsWith("app"); // 返回 true
 trie.insert("app");
 trie.search("app");     // 返回 true
 说明:
 
 你可以假设所有的输入都是由小写字母 a-z 构成的。
 保证所有输入均为非空字符串。
 
 作者：力扣 (LeetCode)
 链接：https://leetcode-cn.com/leetbook/read/top-interview-questions/xaeate/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

/*
 什么是前缀树？
 前缀树也叫做字典树。通常用于词汇的统计或匹配。
 前缀树的特性：
    * 根节点不包含字符，除根节点外的每个子节点都包含一个字符；
    * 从根节点到某一节点，路径上经过的字符连接起来，就是该节点对应的字符串；
    * 每个单词的公共前缀作为一个字符节点保存。所以这样就压缩了很多内存空间。
 前缀树的搜索复杂度是h，也就是直接跟树的高度一致。
 前缀树节点具有的成员：
    * 子节点数组，存放子节点
    * R 表示子节点的数量
    * bool值，表示是否是尾节点
 
 关于前缀树的官方说明：https://leetcode-cn.com/problems/implement-trie-prefix-tree/solution/shi-xian-trie-qian-zhui-shu-by-leetcode/
 
 */



class Trie {
    // 从数据结构可知，每个结点是一个26位字母组成的数组。
    // 前缀树节点
    class TrieNode {
        //存放子节点, 数组大小为26。
        var childs = [TrieNode?](repeating: nil, count: 26)
        var isEnd = false
        
        init() {
            
        }
        
        // 根据字符获取对应字符节点
        func get(_ character: Character) -> TrieNode? {
            if let cv = character.asciiValue {
                let index = Int(cv - Character("a").asciiValue!)
                if index < childs.count {
                    return childs[index]
                }
            }
            return nil
        }

        // 根据字符插入字符节点
        func put(_ character: Character, _ node: TrieNode) {
            if let cv = character.asciiValue {
                let index = Int(cv - Character("a").asciiValue!)
                if index < childs.count {
                    childs[index] = node
                }
            }
        }
    }
    
    var root = TrieNode()
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        let words: [Character] = Array(word)
        var node = root
        for i in 0..<words.count {
            let char = words[i]
            var subNode = node.get(char)
            if subNode == nil {
                subNode = TrieNode()
                node.put(char, subNode!)
            }
            node = subNode!
        }
        node.isEnd = true
    }
    
    func searchPrefix(_ word: String) -> TrieNode? {
        let words: [Character] = Array(word)
        var node = root
        for i in 0..<words.count {
            let char = words[i]
            let subNode = node.get(char)
            if subNode == nil {
                return nil
            }else{
                node = subNode!
            }
        }
        return node
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        let node = searchPrefix(word)
        return node != nil && node!.isEnd
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        return searchPrefix(prefix) != nil
    }
}
