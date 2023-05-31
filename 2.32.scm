#lang sicp
(load ".\\sicp.scm")

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cond ((null? x) (list (car s)))
                                            (else (append x (list (car s))))))
                          rest)))))

(subsets (list 1 2 3))
