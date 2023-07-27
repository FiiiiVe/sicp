#lang sicp
(load ".\\sicp.scm")
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))



(define (make-center-percent center percent)
  (make-interval (- center (* (abs center) percent))
                 (+ center (* (abs center) percent))))
(define (percent a)
  (/ (- (upper-bound a) (lower-bound a))
     (* 2 (abs (center a)))))

(define a (make-center-percent -4 0.1))
(print-interval a)
(newline)
(display (percent a))

