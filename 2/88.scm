#lang sicp
(load ".\\sicp.scm")

(define (minus-poly p1 p2)
  (if (same-variable? p1 p2)
      (make-poly (variable p1)
                 (minus-terms (term-list p1)
                              (term-list p2)))
      (error "xxxx")))
(define (negative-term-list term-list)
  (cond ((empty-termlist? term-list) term-list)
        (else
         (let ((first (first-term term-list))
               (rest (rest-term term-list)))
           (adjoin-term
            (nagative-term first)
            (nagative-term-list rest))))))

;; add in poly
(define (nagative-term term)
  (make-term (order term)
             (nagative (coeff term))))
(put 'negative '(term) nagative)

;; add in scheme-number,ration,real,complex
(define (nagative-xxx xxx) (minus 0 xxx))
(put 'negative '(xxx) nagative-xxx)

(define (negative a)
  (apply-generic 'nagative a))


;; 过于愚蠢。。。。。。。。。。人家题目提示你做个negative不只是让你判空的时候用的。。。。。。。。。。。a-b = a+(-b), shit 
(define (minus-terms l1 l2)
  (cond ((empty-termlist? l2) l1)
        ((empty-termlist? l1) (negative l2))
        (else
         (let ((t1 (first-term l1))
               (t2 (first-term l2)))
           (cond ((> (order t1) (order t2))
                  (adjoin-term
                   t1
                   (minus-terms (rest-terms l1) l2)))
                 ((< (order t1) (order t2))
                  (adjoin-term
                   t2
                   (minus-terms l1 (rest-terms l1))))
                 (else
                  (adjoin-term
                   (make-term
                    (order t1)
                    (minus (coeff t1) (coeff t2)))
                   (minus-terms
                    (rest-terms l1)
                    (rest-terms l2)))))))))
