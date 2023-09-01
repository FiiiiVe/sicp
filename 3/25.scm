#lang sicp
(load ".\\sicp.scm")



(define (make-table)
  (let ((local-table (list 'table)))
    (define (assoc key records)
      (cond ((null? records) #f)
            ((equal? key (caar records)) (car records))
            (else (assoc key (cdr records)))))
    (define (lookup key-list)
      (define (iter keys current-table)
        (if (null? keys)
            ;; only first call happen
            ;; or wrong call which want to lookup value from a table
            (error "lookup null keys error")
            (let ((key (car keys))
                  (record-or-next-subtable
                   (assoc (car keys) (cdr current-table))))
              (if record-or-next-subtable
                  (if (pair? record-or-next-subtable)
                             ;; lookup record
                             (cdr record-or-next-subtable)
                             (iter (cdr keys) record-or-next-subtable))
                  (if (null? (cdr keys))
                      false
                      (error "remain keys not found"))))))
      (iter key-list local-table))
    (define (insert! key-list value)
      (define (iter keys current-subtable)
        (cond ((null? keys)
               ;; only first call happen
               ;; or wrong call which want to
               ;; insert value to a table instead of record
               (error "insert null keys error"))
              (else
               (let ((key (car keys))
                     (record-or-next-subtable
                      (assoc (car keys) (cdr current-subtable))))
                 ;; next layer not exist, insert record or table
                 (cond ((not record-or-next-subtable)
                        (if (null? (cdr keys))
                            ;; insert record
                            (set-cdr! current-subtable (cons (cons key value)
                                                             (cdr current-subtable)))
                            ;; insert table
                            (set-cdr! current-subtable
                                      (cons (list key) (cdr current-subtable)))
                            ))
                       ;; next layer exist, update record or iter next table
                       (else
                        (if (pair? record-or-next-subtable)
                            ;; update record
                            (set-cdr! record-or-next-subtable value)
                             ;; iter next table
                            (iter (cdr keys) record-or-next-subtable))))))))
      (iter key-list local-table))
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc) insert!)
            (else (error "unknown operation -- table" m))))
    dispatch))

(define a (list 't))
(set-cdr! a (list (cons 'a 'a-v)))
(display a)(newline)
(display (cadr a))
(define t (make-table))
((t 'insert-proc) (list 'a) 'a-value)
((t 'insert-proc) (list 'a) 'aa-value)
((t 'lookup-proc) (list 'a))

