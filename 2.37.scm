#lang sicp
(load ".\\sicp.scm")

(define v1 (list 1 2 3 4))
(define v2 (list 5 6 7 8))
(define m1 (list (list 1 2 3) (list 4 5 6)))


;; 向量点积 ∑i vi*wi
(define (dot-product v w)
  (accumulate + 0 (map * v w)))
(display (dot-product v1 v2))
(newline)

;; 向量*矩阵 返回向量t，其中ti=∑j mij*vj
(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))
(display-n (matrix-*-vector m1 (list 1 2 3)))


;; 转置矩阵， 返回矩阵n，其中nij=mji
(define (transpose mat)
  (accumulate-n cons nil mat))
(display-matrix m1)
(display-matrix (transpose m1))

;; 矩阵*矩阵，返回矩阵p，其中pij=∑k mik*nkj
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (define (iter v n)
      (if (null? n)
          nil
          (cons (dot-product v (car n))
                (iter v (cdr n)))))
    (map (lambda (v) (iter v cols)) m)))
;; 其实(map (lambda (v) (matrix-*-vector cols v)) m)即可
(display-matrix (matrix-*-matrix m1 (transpose m1)))
