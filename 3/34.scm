#lang sicp
(load ".\\sicp.scm")

;; 修改a的值会触发两次 multiplier，a*a*a

;; 上面是错误的！！！

;; 一个connector的constraint是去重的，所以乘法是没问题的
;; 反而set b之后会因为，两个a都没被赋值，所以无法计算根号
