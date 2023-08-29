#lang sicp
(load ".\\sicp.scm")

(define (make-table)
  (let ((local-table (list *table*)))
    (define (assoc key records)
      (cond ((null? records) #f)
            ((equal? key (caar records)) (car records))
            (else (assoc key (cdr records)))))
    (define (look-up key-list)
      (define (iter keys current-table)
        (if (null? keys)
            ;; only first call happen
            ;; or wrong call which want to lookup value from a table
            (error "lookup null keys error")
            (let ((key (car keys))
                  (record-or-next-subtable
                   (assoc key (cdr current-table))))
              (if record-or-next-subtable
                  (if (pair? (car record-or-next-subtable)
                             ;; lookup record
                             (cdar record-or-next-subtable)
                             (iter (cdr keys) record-or-next-subtable)))
                  (if (null? (cdr keys))
                      false
                      (error "remain keys not found"))))
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
                      (assoc key (cdr current-subtable))))
                 ;; next layer not exist, insert record or table
                 (cond ((not record-or-next-subtable)
                        (if (null? (cdr keys))
                            ;; insert record
                            (set-cdr! current-subtable (cons key value))
                            ;; insert table
                            (set-cdr! current-subtable
                                      (cons (list key) (cdr current-subtable)))
                            ))
                       ;; next layer exist, update record or iter next table
                       (else
                        (if (pair? (car record-or-next-subtable))
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

(define a (list (cons 1 2)))
(cdar a)
