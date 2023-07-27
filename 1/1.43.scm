#lang sicp
(load "F:\\workspace\\sicp\\sicp.scm")
(define (repeated f n)
  (define (inner final_f ind)
    (if (= ind 0)
        final_f
        (inner (lambda (x) (f (final_f x))) (- ind 1))))
  (inner (lambda (x) x) n))
((repeated square 2) 5)

;; 利用compose
(define (repeated-compose f n)
  (define (inner final_f ind)
    (if (< ind n)
        (compose f (inner final_f (+ ind 1)))
        final_f))
  (inner (lambda (x) x) 0))
((repeated-compose square 2) 5)
