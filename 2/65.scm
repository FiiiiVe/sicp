#lang sicp
(load ".\\sicp.scm")


(define (union-set-tree tree1 tree2)
  (begin
    (let ((list1 (tree->list-2 tree1))
          (list2 (tree->list-2 tree2)))
      (list->tree (union-set list1 list2)))))

;; intersection同理
