#lang sicp
(load ".\\sicp.scm")

(define (bl frame) (origin frame))
(define (br frame) (add-vect (bl frame) (edge2 frame)))
(define (tl frame) (add-vect (bl frame) (edge1 frame)))
(define (tr frame) (add-vect (tl frame) (edge2 frame)))
;; a）画出指定框架边界
(define (painter-border frame)
  (segments->painter
   (list (make-segment (bl frame) (br frame))
         (make-segment (bl frame) (tl frame))
         (make-segment (tr frame) (br frame))
         (make-segment (tr frame) (tl frame)))))

;; b)通过连接框架两对角画出一个大叉的画家
(define (painter-x frame)
  (segments->painter
   (list (make-segment (bl frame) (tr frame))
         (make-segment (br frame) (tl frame)))))

;; c)通过连接框架各边的中点画出一个菱形的画家
(define (mid v1 v2)
  (make-vect (/ (+ (xcor-vect v1) (xcor-vect v2)) 2)
             (/ (+ (ycor-vect v1) (ycor-vect v2)) 2)))
(define (painter-diamond frame)
  (segments->painter
   (let ((mid-b (mid br bl))
         (mid-l (mid bl tl))
         (mid-t (mid tl tr))
         (mid-r (mid br tr)))
     (list (make-segment mid-b mid-l)
           (make-segment mid-b mid-r)
           (make-segment mid-t mid-l)
           (make-segment mid-t mid-r)))))
;; d)画家wave  ：）
