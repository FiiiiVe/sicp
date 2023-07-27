#lang sicp
(load ".\\sicp.scm")

(define (equal? a b)
  (let ((is_a_pair? (pair? a))
        (is_b_pair? (pair? b)))
    (cond ((and (not is_b_pair?) (not is_a_pair?)) (eq? a b))
          ((and is_a_pair? is_b_pair?) (and (eq? (car a) (car b)) (equal? (cdr a) (cdr b))))
          (else #f))))

(equal? '(this is a list) '(this is a list))
;; #t
(equal? '(this is a list) '(this (is a) list))
;; f
