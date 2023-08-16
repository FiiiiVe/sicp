#lang sicp
(load ".\\sicp.scm")


;; 读代码是翻转链表，但是set-cdr!居然不是内置函数嘛。。
;; ????c-c c-a好用，然后c-c c-b就好了？？？
(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))

(mystery (list 'a 'b 'c))
