#lang sicp
(load ".\\sicp.scm")
(define (reverse list)
  (if (null? list)
      nil
      (if (null? (cdr list))
          list
          (cons (reverse (cdr list)) (car list)))))

(reverse nil)
(reverse (list 1 4 9 16 25))
