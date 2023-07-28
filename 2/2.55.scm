#lang sicp
(load ".\\sicp.scm")

(car ''abab)
;; = (car '(quote abab))
;; = quote


(car (quote (list 'a)) )
