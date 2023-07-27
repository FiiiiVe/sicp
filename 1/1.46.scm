#lang sicp
(load "F:\\workspace\\sicp\\sicp.scm")

(define (iterative-improve good-enough? improve-guess)
  (define (try guess)
    (let ((next (improve-guess guess)))
      (if (good-enough? guess next)
          guess
          (try next))))
  (lambda (x) (try x)))


(define (fixed-point2 f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 0.0001))
  ((iterative-improve close-enough? f) first-guess))

;;(fixed-point2 (lambda (y) (+ (sin y) (cos y))) 1.0)
;;1.258

(define (sqrt2 x)
  (define (close-enough? guess x)
    (< (abs (- guess x)) 0.0001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve close-enough? improve) 1.0))
;;(sqrt2 2)
;;1.4142

