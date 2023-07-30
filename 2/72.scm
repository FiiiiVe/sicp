#lang sicp
(load ".\\sicp.scm")

#|
如果想对频度像2.71中所描述的那样
最频繁的显而易见是O(1)
最不频繁的计算点在elements-of-set?和encode的递归，element-of-set?作为O(n),
则递归为T(n) = T(n-1) + O(n-1)
根据主定理（或者眼睛看看脑测），复杂度是O(n^2)
|#
