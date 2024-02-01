#lang sicp
(load ".\\sicp.scm")

(define a
  (cons-stream 1 '(2)))
(stream-display a 10 )
;;(stream-display
(define b
 (stream-map (lambda (x) (+ x 1)) '(a)))
 ;;10)


(force b)

(stream-first b )
