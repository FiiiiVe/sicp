#lang sicp
(load ".\\sicp.scm")

(define (up-slpit painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-slpit painter (- n 1))))
        (below painter (beside smaller smaller)))))
