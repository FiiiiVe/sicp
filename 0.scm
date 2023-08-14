#lang sicp
(load ".\\sicp.scm")


(define r 3)
(define x 5)
(define y 7)

;; pi*r^2  /  (2*r)^2 = pi/4
(define (estimate-pi trials)
  (* (monte-carlo trials circle-test) 4))

(define (circle-test)
  (let ((ran-x (random-in-range (- x r) (+ x r)))
        (ran-y (random-in-range (- y r) (+ y r))))
    (<= (+ (square (- ran-x x)) (square (- ran-y y)))
        (square r))))

(display (estimate-pi 100))
