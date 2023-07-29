#lang sicp
(load ".\\sicp.scm")

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))
(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          (result-list))))))
  (copy-to-list tree '()))


;; a) 1是中序遍历，2是中序遍历
;; b) 2中每个节点一次cons，每个节点两次copy-to-list
;;    1中每个进店一次cons，每个节点两次tree->list，每个节点一次append
;;    append换算成cons，假设是平衡树，共n层，第n层需要append 2^n 次，每次append调用1次cons，第（n-1）层需要append 2^(n-1) 次， 每次append调用2^0次cons，第1层需要调用append 1 次，每次append需要调用2^(n-1)次，共调用cons 2^n*1 + 2^(n-1)*2^0 + ... + 2^0*2^(n-1),共n*2^n
;;    而相比1，n层只需要2^n[每个节点一次]所以步数不一样
