#lang sicp
(load ".\\sicp.scm")

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence)
  (accumulate op initial sequence))


;; 3/2
(display (fold-right / 1 (list 1 2 3)))(newline)
;; 1/6
(display (fold-left / 1 (list 1 2 3)))(newline)
;; (1 2 3) ×      (1 (2 (3 ()))) √ 
(display (fold-right list nil (list 1 2 3)))(newline)
;; (((() 1) 2) 3)
(display (fold-left list nil (list 1 2 3)))


;; 如果需要fold-right和fold-left生成同样的结果，op应该满足交换律，如加法，乘法
