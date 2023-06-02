#lang sicp
(load ".\\sicp.scm")

(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (x) 1) (enumerate-tree t))))

(count-leaes (list 1 2 (list 3 4) 5))

(define (count-leaes t)
  (accumulate +
              0
              (map (lambda (x) (if (not(pair? x))
                                   1
                                   (count-leaes x))) t)))
(count-leaes (list 1 2 (list 3 4) 5))

