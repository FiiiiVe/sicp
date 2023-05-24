#lang sicp
(load ".\\sicp.scm")

;; 区间(a,b)有3种状态，所以两个区间可以分解为3*3种情况
;; 已知a<b, 3种状态分别为0<a<b, a<=0<=b, a<b<0,称之为状态I，II，III

;; 区间1,2都为状态I
;; 0<a1<b1, 0<a2<b2
;; 显而易见b1b2>b1a2, b1b2>a1b2
;; 又因为b1b2>a1b2, a1b2>a1a2, 所以b1b2>a1a2
;; 所以b1b2是(max p1 p2 p3 p4)，同理a1a2是(min p1 p2 p3 p4)，且乘法不超过两次符合题意，故此情况下区间为(a1a2, b1b2)

;; 区间1为状态I， 区间2为状态II
;; 证明略，乘法区间为(a2b1, b1b2)

;; 区间1为状态I， 区间2为状态III
;; (b1a2, a1b2)

;; 区间1为状态II， 区间2为状态I
;; (a1b2, b1b2)

;; 区间1为状态II， 区间2为状态II
;; (a1b2, a1a2)

;; 区间1为状态II， 区间2为状态III
;; (b1a2, a1a2)

;; 区间1为状态III， 区间2为状态I
;; (a1b2, b1a2)

;; 区间1为状态III， 区间2为状态I
;; (a1b2, a1a2)

;; 区间1状态III， 区间2状态III
;; (b1b2, a1a2)

(define (mul-interval2 x y)
  (define (small-than-0? x)
    (< (upper-bound x) 0))
  (define (cross-0? x)
    (and (<= (lower-bound x) 0)
         (>= (upper-bound x) 0)))
  (define (bigger-than-0? x)
    (> (lower-bound x) 0))
  (let ((a1 (lower-bound x))
        (b1 (upper-bound x))
        (a2 (lower-bound y))
        (b2 (upper-bound y)))
    (cond ((and (bigger-than-0? x)
                (bigger-than-0? y))
           (make-interval (* a1 a2)
                          (* b1 b2)))
          ((and (bigger-than-0? x)
                (cross-0? y))
           (make-interval (* b1 a2)
                          (* b1 b2)))
          ((and (bigger-than-0? x)
                (small-than-0? y))
           (make-interval (* b1 a2)
                          (* a1 b2)))
          ((and (cross-0? x)
                (bigger-than-0? y))
           (make-interval (* a1 b2)
                          (* b1 b2)))
          ((and (cross-0? x)
               (cross-0? y))
           (make-interval (* a1 b2)
                          (* a1 a2)))
          ((and (cross-0? x)
                (small-than-0? y))
           (make-interval (* b1 a2)
                          (* a1 a2)))
          ((and (small-than-0? x)
                (bigger-than-0? y))
           (make-interval (* a2 b2)
                          (* b1 a2)))
          ((and (small-than-0? x)
                (cross-0? y))
           (make-interval (* a1 b2)
                          (* a2 a2)))
          ((and (small-than-0? x)
                (small-than-0? y))
           (make-interval (* b1 b2)
                          (* a1 a2))))))
(define (print-interval v)
  (newline)
  (display "[")
  (display (lower-bound v))
  (display ", ")
  (display (upper-bound v))
  (display "]"))

(define a (make-interval -10 20))
(define b (make-interval 1 5))
(print-interval (mul-interval a b))
(print-interval (mul-interval2 a b))
