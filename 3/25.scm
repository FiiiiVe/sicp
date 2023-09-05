#lang sicp
(load ".\\sicp.scm")




(define (make-table)
  (let ((local-table (list 'table)))
    (define (assoc key records)
      (cond ((null? records) #f)
            ((equal? key (caar records)) (car records))
            (else (assoc key (cdr records)))))
    (define (is-table? l)
      (or (null? (cdr l)) (pair? (cdr l))))
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
                  (if (is-table? record-or-next-subtable)
                      ;; lookup table--check
                      (iter (cdr keys) record-or-next-subtable)
                      ;; lookup record---check
                      (cdr record-or-next-subtable)
                      )
                  (if (null? (cdr keys))
                      (error "no value exist")
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
                            ;; insert record--check
                            (set-cdr! current-subtable (cons (cons key value)
                                                             (cdr current-subtable)))
                            ;; insert table--check
                            (begin 
                              (set-cdr! current-subtable
                                        (cons (list key) (cdr current-subtable)))
                              (iter (cdr keys) (cadr current-subtable)))
                            ))
                       ;; next layer exist, update record or iter next table
                       (else
                        (if (is-table? record-or-next-subtable)
                            ;; iter next table--check
                            (iter (cdr keys) record-or-next-subtable)
                            ;; update record--check
                            ;; todo check is record or table
                            (set-cdr! record-or-next-subtable value)
                            )))))))
      (iter key-list local-table))
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc) insert!)
            (else (error "unknown operation -- table" m))))
    dispatch))

(define t (make-table))
;; test insert-lookup

(set! t (make-table))
((t 'insert-proc) (list 'a 'b 'c) 'c-value)
((t 'insert-proc) (list 'a 'b 'd) 'd-value)
(display ((t 'lookup-proc) (list 'a 'b 'c)))(newline)
(display ((t 'lookup-proc) (list 'a 'b 'd)))(newline)
((t 'insert-proc) (list 'a 'b 'd) 'd2-value)
(display ((t 'lookup-proc) (list 'a 'b 'd)))(newline)

;; remain problem
((t 'insert-proc) (list 'a 'b 'd 'e) 'e-value)
(display ((t 'lookup-proc) (list 'a 'b 'd 'e)))(newline)
