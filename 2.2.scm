#lang sicp
(load "F:\\workspace\\sicp\\sicp.scm")

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display (","))
  (display (y-point p))
  (display (")")))
;; 点
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))
;; 线段
(define (make-segment a b) (cons a b))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (midpoint-segment s)
  (let ((x (average (x-point (start-segment s))
                    (x-point (end-segment s))))
        (y (average (y-point (start-segment s))
                    (y-point (end-segment s)))))
    (make-point x y)))

(midpoint-segment (make-segment (make-point 1.0 3.0)
                                (make-point 2.0 4.0)))
