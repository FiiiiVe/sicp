#lang sicp
(load "F:\\workspace\\sicp\\sicp.scm")
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))



;; 周长
(define (perimeter rect)
  (* 2 (+ (len rect) (wid rect))))
;; 面积
(define (area rect)
  (* (len rect) (wid rect)))

(define (make-rectangle length width) (cons length width))
(define (len r) (car r))
(define (wid r) (cdr r))


(display (perimeter (make-rectangle 3 5)))
(newline)
(display (area (make-rectangle 3 5)))
(newline)

;; p1是矩形左下角的坐标，p2是右上角
(define (make-rectangle2 p1 p2)
  (let ((length (- (x-point p2) (x-point p1)))
        (width (- (y-point p2) (y-point p1))))
    (cons length width)))

(define rect2 (make-rectangle2 (make-point 1 4)
                               (make-point 2 8)))
(display (perimeter rect2))
(newline)
(display (area rect2))


