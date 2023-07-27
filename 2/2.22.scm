#lang sicp
(load ".\\sicp.scm")

;; 解释为什么程序会打印顺序反过来
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        ;; 这里reverse就好
        answer
        (iter (cdr things)
              ;; 1-nil, 4-1-nil, 9-4-1-nil
              (cons (square (car things))
                    answer))))
  (iter items nil))
(display (square-list (list 1 2 3 4)))
(newline)


(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              ;;  ↓ -1 ,   ↓   -4
              ;; nil      ↓ -1
              ;;         nil
              (cons answer
                    (square (car things))))))
  (iter items nil))
(display (square-list2 (list 1 2 3 4)))
(newline)
