#lang sicp
(load "F:/workspace/sicp/sicp.scm")
(define (tan-cf x k)
  (define (fN ind)
    (if (= 1 ind)
        x
        (square x)))
  (define (fD ind)
    (- (* 2 ind) 1))
  (define (func fN fD index val)
    (if (= index 0)
        val
        (let ((next (/ (fN index) (- (fD index) val))))
          (func fN fD (- index 1) next))))
  (func fN fD k 0.0))
;; 角度->弧度 弧度数 = (角度 * π) / 180
(display (tan-cf (/ (* 35 pi) 180) 20))
