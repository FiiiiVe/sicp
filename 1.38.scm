#lang sicp
(load "F:\\workspace\\sicp\\sicp.scm")
;; 1737年，瑞士数学家莱昂哈德欧拉发表了一篇论文De Fractionibus Continuis，文中包含了e-2的一个连分式展开，其中e是自然对数的底。在这一分式中，Ni全都是1，而Di依次为1,2,1,1,4,1,1,6,1,1,8.请写出一个程序，其中使用你在练习1.37中所作的cont-frac过程，并能基于欧拉的展开式求出e的近似值
;;(define fib (/ (- (sqrt 5) 1) 2))
(define (cont-frac fN fD k)
  (define (func N D k val)
    ;; 差值，判断是否逼近φ
    (display val)
    (newline)
    (if (= k 0)
        val
        (let ((next (/ (N k) (+ (D k) val))))
          (func N D (- k 1) next))))
  (define (close-enough? a b)
    (< (abs (- a b)) 0.0001))
  (func fN fD k 0))
(define (fD k)
  (cond ((= k 1) 1)
        ((= k 2) 2)
        ;; (k-2)%3 == 0? 2/3 * (k+1)
        ((= 0 (remainder (- k 2) 3)) (* 2 (/ (+ k 1) 3)))
        (else 1)))
(cont-frac (lambda (i) 1.0) fD 20)
