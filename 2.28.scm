#lang sicp
(load ".\\sicp.scm")

(define (fringe items)
  (define (iter item ans)
    (cond ((null? item) ans)
          ((not (pair? item)) (append ans (list item)))
          (else (iter (cdr item)
                      (iter (car item) ans)))))
  (iter items '()))

(define x (list (list 1 2) (list 3 4)))
(display (fringe x))
(newline)
(display (fringe (list x (list 5 6) 7)))
