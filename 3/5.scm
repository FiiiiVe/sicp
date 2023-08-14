#lang sicp
(load ".\\sicp.scm")


(define r 1700)
(define x 2030)
(define y 1880)

;; pi*r^2  /  (2*r)^2 = pi/4
(define (estimate-pi trials)
  (* (monte-carlo trials circle-test) 4.0))

(define (circle-test)
  (let ((ran-x (random-in-range (- x r) (+ x r)))
        (ran-y (random-in-range (- y r) (+ y r))))
    (<= (+ (square (- ran-x x)) (square (- ran-y y)))
        (square r))))


;; (circle-test)
(display (estimate-pi 100000))

