#lang sicp
(load ".\\sicp.scm")

(define (div-interval x y)
  (define (cross-0? a)
    (and (<= (lower-bound a) 0)
         (>= (upper-bound a) 0)))
  (if (cross-0? y)
      (error "除数横跨0")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

(div-interval (make-interval 2 3)
              (make-interval -1 2))
