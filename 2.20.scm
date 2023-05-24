#lang sicp
(load ".\\sicp.scm")
(define (same-parity x . y)
  (define (even-list list)
    (if (null? list) nil
        (if (even? (car list))
            (cons (car list) (even-list (cdr list)))
            (even-list (cdr list)))))
  (define (odd-list list)
    (if (null? list) nil
        (if (odd? (car list))
            (cons (car list) (odd-list (cdr list)))
            (odd-list (cdr list)))))
  (if (even? x)
      (cons x (even-list y))
      (cons x (odd-list y))))


(display (same-parity 1 2 3 4 5 6 7))
(newline)
(display (same-parity 2 3 4 5 6 7))
