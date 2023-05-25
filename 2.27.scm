#lang sicp
(load ".\\sicp.scm")

;; 翻转树
(define (deep-reverse items)
  (define (iter item ans)
          ;; 这一层结束
    (cond ((null? item) ans)
          ;; 叶子节点，不需要递归
          ((not (pair? item)) item)
          ;; 非叶子节点，继续翻转本层，同时递归翻转的item子树
          (else (iter (cdr item)
                      (cons (iter (car item) nil) ans)))))
  (iter items nil))

(display (deep-reverse (list (list 1 2) (list 3 4))))
(newline)
(display (deep-reverse (list 0 (list 1 2) (list 3 4 5))))
