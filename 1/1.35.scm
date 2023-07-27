#lang sicp
(load "F:\\workspace\\sicp\\sicp.scm")
;;证明略
(display (fixed-point (lambda (x) (+ 1 (/ 1 x))) 100))
