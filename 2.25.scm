#lang sicp
(load ".\\sicp.scm")
(define list1 (list 1 3 (list 5 7) 9))
(define list2 (list (list 7)))
(define list3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(display list1)
(newline)
(display list2)
(newline)
(display list3)
(newline)

;; 取出7
(display
 (car (cdr (car (cdr (cdr list1)))))
 
 )
(newline)
(display (list-ref (list-ref list1 2) 1))
(newline)


(display
 (car (car list2))
 )
(newline)

(display (list-ref (list-ref (list-ref (list-ref (list-ref (list-ref list3 1) 1) 1) 1) 1) 1))
