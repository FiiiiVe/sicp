#lang sicp
(load "F:\\workspace\\sicp\\sicp.scm")
(define fib 0.6180339887)
;; 迭代
(define (cont-frac fN fD k)
  (define (func N D k val)
    ;; 差值，判断是否逼近φ
    (display (abs (- val fib)))
    (newline)
    (if (= k 0)
        val
        (let ((next (/ (N k) (+ (D k) val))))
          (if (close-enough? fib next)
              next
              (func N D (- k 1) next)))))
  (define (close-enough? a b)
    (< (abs (- a b)) 0.0001))
  (func fN fD k 0))
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 20)
;; k>10时，误差小于0.0001，4位精度？
;; 4位精度意味着数值的精确度被限制在小数点后四位
(newline)
;; 递归
;; 为了打印是否逼近，用到了begin，意为多个子表达式顺序执行
;; 如何在精度到达就提前返回呢？也不是不行，但复杂度不会减少（甚至平方），还是要先算完k次之后是否满足，递归没办法
(define (cont-frac-recursion fN fD k)
  (define (close-enough? a b)
    (< (abs (- a b)) 0.0001))
  (if (= k 0)
      0
      (let ((val (/ (fN k) (+ (fD k) (cont-frac-recursion fN fD (- k 1))))))
        (begin
          (display (abs (- val fib)))
          (newline)
          val))))
(cont-frac-recursion (lambda (i) 1.0) (lambda (i) 1.0) 20)
