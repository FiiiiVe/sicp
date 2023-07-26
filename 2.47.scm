#lang sicp
(load ".\\sicp.scm")

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

;; 没有很明白要我做什么。。。好像是要做3个选择函数，把3个参数摘出来
(define (get-origin f) (car f))
(define (get-edge1 f) (cadr f))
(define (get-edge2 f) (cddr f))
