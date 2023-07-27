#lang sicp
(load ".\\sicp.scm")

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))
(display (reverse (list 1 2 3 4 5)))
(newline)

(define (reverse2 sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))
(display (reverse2 (list 1 2 3 4 5)))
