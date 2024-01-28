#lang sicp
(load ".\\sicp.scm")

(define (triple S T U)
  (stream-filter (lambda (pair)
                   (= (square (caddr pair)) (+ (square (cadr pair)) (square (car pair)))))
                 (pairs-3 S T U)))

(define (pairs-3 r s t)
   (cons-stream
    (list (stream-car r) (stream-car s) (stream-car t))
    (interleave
     (stream-map (lambda (x) (cons (stream-car r) x))
                 (stream-cdr (pairs s t)))
     (pairs-3 (stream-cdr r) (steram-cdr s) (steram-cdr t))))
