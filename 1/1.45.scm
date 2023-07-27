#lang sicp
(load "F:\\workspace\\sicp\\sicp.scm")

;; 做实验验证n次方根需要多少次平均阻尼
;; 3次方根-1次阻尼, 4次方根-2次阻尼, log(2)n次
;; log(2)n向下取整,有点low...先用着
(define (log base n)
  (define (inner i)
    (let ((val (fast-expt base i)))
      (display val)
      (newline)
      (cond ((= val n) i)
            ((> val n) (- i 1))
            (else (inner (+ i 1))))))
  (inner 0))
(define (n-th-root n x)
  (fixed-point
   ((repeated average-damp (log 2 n))
    (lambda (y) (/ x (fast-expt y (- n 1))))
   )
   1.0))

;;(log 2 8)
(n-th-root 8 (fast-expt 2 8))
;;(fixed-point ((repeated average-damp 4) (lambda (y) (/ 1000.0 (fast-expt y 15)))) 1.0)

;;(n-th-root 3 1000)
;;(n-th-root 3 10000)
;;(n-th-root 5 100000)

;;(n-th-root 6 1000000)

;;(n-th-root 24 100000000)
