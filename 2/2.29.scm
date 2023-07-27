#lang sicp
(load ".\\sicp.scm")

(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))

;; a)
(define (left-branch m) (car m))
(define (right-branch m) (list-ref m 1))
(define (branch-length b) (car b))
(define (branch-structure b) (list-ref b 1))

;; b)
(define (total-weight items)
    (cond ((null? items) 0)
          ; 说明是活动体moblie
          ((pair? (left-branch items)) (+ (total-weight (left-branch items))
                                          (total-weight (right-branch items))))
          ; 分支branch
          (else (if (pair? (branch-structure items))
                    (total-weight (branch-structure items))
                    (branch-structure items)))))

;; c)
(define (check-balance items)
  ;; 返回nil表示不平衡
  (define (iter items)
    (cond ((null? items) 0)
          ((pair? (left-branch items)) (let ((left-weight (iter (left-branch items)))
                                             (right-weight (iter (right-branch 
                                         ;; 
                                         (if (and (not (null? left-weight))
                                                  (not (null? right-weight))
                                                  (= left-weight right-weight))
                                             (+ left-weight right-weight)
                                             nil)))
          (else (if (pair? (branch-structure items))
                     (iter (branch-structure items))
                     (branch-structure items)))))
  (not (null? (iter items))))

;; d)
;; 把读list的方法改为读cons即可，反正是二叉树

;; -----------------------------
(define x (make-mobile (make-branch 4 10)
                       (make-branch 5 (make-mobile (make-mobile 4 5)
                                                   (make-mobile 3 5)))))

;;(right-branch x)
(display (total-weight x))
(newline)
(display (check-balance x))
(newline)
