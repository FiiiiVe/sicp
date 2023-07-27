#lang sicp
(load ".\\sicp.scm")

(list 'a 'b 'c)
;; x ('a 'b 'c)
;; √ (a b c)

(list (list 'george))
;; ((george))

(cdr '((x1 x2) (y1 y2)))
;; (y1 y2)

(cadr '((x1 x2) (y1 y2)))
;; y1 

(pair? (car '(a short list)))
;; 如果a是一个数值的话，当然是#f 

(memq 'red '((red shoes) (blue socks)))
;; x ()
;; √ #f

(memq 'red '(red shoes blue socks))
;; 不知道为什么a和'a相等，gpt说是看的是内存地址，一个变量只有一个地址
;; 那'a不应该是地址的值吗，可能eq a直接就去看地址值了
;; √ #t
