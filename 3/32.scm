#lang sicp
(load ".\\sicp.scm")

;; segment中的任务queue存储的过程是，将output的值更新为new-value
;; new-value在放到任务queue之前就计算出来了，不是call-each的时候才计算的
;; 所以如果不是FIFO则可能会结果错误，结果是FIFO计算的，当然应该FIFO运行
