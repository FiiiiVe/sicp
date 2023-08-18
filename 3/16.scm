#lang sicp
(load ".\\sicp.scm")

(define (count-pairs x)
;;  (display x)(newline)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))


;; |a|-|--> |b|-|--> |C|-|--> nil
(display
 (count-pairs '(1 2 3)))
;; 3


#|
      |,nil
      ↓
     |,|
     ↓ ↓
    |1|-|--> nil
|#
(define x '(1))
(define y (cons x x))
(display
 (count-pairs (list y)))
;; 4

#|
   |,|
    ↓
   |,|
   ↓ ↓
  |1|-|--> nil
|#
(define x '(1))
(define y (cons x x))
(define z (cons y y))
(display
 (count-pairs z))
;; 7



(define x '(1))
(set-cdr! x x)
;; (count-pairs x)
;; never returns
