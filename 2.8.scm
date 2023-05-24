#lang sicp
(load ".\\sicp.scm")

;; 同理写在sicp中，见"sub-interval"
;; x,j区间的差应该是x-j，也就是lowerX-upperY,UpperX-lowerY
;; ---------------
;; 但其实这样是错误的。。。
;; 参考2.9，答案应该是lowerX-lowerY, upperX-upperY
