#lang sicp
(load "F:\\workspace\\sicp\\sicp.scm")
(define tolerance 0.0001)
(define (fixed-point-new f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess count)
    (display count)
    (newline)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          guess
          (try next (+ count 1)))))
  (try first-guess 1))
;;无阻尼31次
(fixed-point-new (lambda (x) (/ (log 1000) (log x))) 100)
;;有阻尼13次
(fixed-point-new (lambda (x) (/ (log (* 1000 x)) (log (+ x 1)))) 100)
