#lang sicp
(load ".\\sicp.scm")

;; 这样写很复杂啊，没有所谓的未排序的一半，不知道怎么能在list中插入一个元素,append太慢了
(define (adjoin-set-order x set)
  (define (inner ans set)
    (cond ((null? set) (append ans (list x)))
          ((equal? x (car set)) (append ans set))
          ((< x (car set)) (append (append ans (list x)) set))
          (else (inner (append ans (list (car set))) (cdr set)))))
  (inner '() set))

(adjoin-set-order 3 '(1 2 4 5))

(define a (adjoin-set-order 6 '(1 2 4 5)) )
a
