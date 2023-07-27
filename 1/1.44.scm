#lang sicp
(load "F:\\workspace\\sicp\\sicp.scm")
;; 利用compose
(define (smooth f)
  (define dx 0.00001)
  (lambda (x)
    (let ((a (f (- x dx)))
          (b (f x))
          (c (f (+ x dx))))
      (average a (average b c)))))
(define (smooth-n f)
  (repeated smooth 10) f)
