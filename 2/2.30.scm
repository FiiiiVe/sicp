#lang sicp
(load ".\\sicp.scm")

(define (square-tree items)
  (cond ((null? items) nil)
        ((not (pair? items)) (square items))
        (else (cons (square-tree (car items))
                    (square-tree (cdr items))))))
(square-tree (list 1
                   (list 2 (list 3 4) 5)
                   (list 6 7)))

(define (square-tree2 items)
  (map (lambda (x) (cond ((pair? x) (square-tree2 x))
                         (else (square x))))
       items))
(square-tree2 (list 1
                    (list 2 (list 3 4) 5)
                    (list 6 7)))
