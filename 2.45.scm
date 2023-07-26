#lang sicp
(load ".\\sicp.scm")



;; 我感觉有问题up和right不一样，down才和right是一样的
;; 姑且按down和right写

(define (split firAct secAct)
  (define (inner painter n)
    (if (= n 0)
        painter
        (let ((smaller (inner painter (- n 1))))
          (firAct painter (secAct smaller smaller)))))
  inner)


(define right-split (split beside below))
(define down-split (split below beside))
(right-split wave 4)
