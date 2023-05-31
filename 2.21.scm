#lang sicp
(load ".\\sicp.scm")

(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items))
            (square-list (cdr items)))))
(square-list (list 1 2 3 4))

(define (square-list2 items)
  (map (lambda (x) (square x))
       items))
(square-list2 (list 1 2 3 4))
