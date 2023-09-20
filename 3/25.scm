#lang sicp
(load ".\\sicp.scm")




(define (make-table)
  (let ((local-table (list 'table)))
    (define (assoc key records)
      (cond ((null? records) #f)
            ((equal? key (caar records)) (car records))
            (else (assoc key (cdr records)))))
    (define (read-value record)
      (if (null? record)
          (error "read null value")
          (cdr record)))
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
              (cond ((not record-or-next-subtable)
                     ;; -- check
                     (error "read null record or table: ~a" key))
                    ((is-table? record-or-next-subtable)
                     ;; lookup table --check
                     (iter (cdr keys) record-or-next-subtable))
                    ((not (null? (cdr keys)))
                     ;; -- check
                     (error "should read table, but now find record, at key: ~a" key))
                    ;; lookup record -- check
                    (else (cdr record-or-next-subtable)))
              )))
      (iter key-list local-table))
    (define (insert! key-list value)
      (define (iter keys current-subtable)
        (if (null? keys)
            ;; only first call happen
            ;; or wrong call which want to
            ;; insert value to a table instead of record
            (error "insert null keys error")
            (let ((key (car keys))
                  (record-or-next-subtable
                   (assoc (car keys) (cdr current-subtable))))
              ;; next layer not exist, insert record or table
              (if (null? (cdr keys))
                  ;; shoud insert/update record
                  (cond ((not record-or-next-subtable)
                         ;; insert -- check
                         (set-cdr! current-subtable (cons (cons key value)
                                                          (cdr current-subtable))))
                        ((is-table? record-or-next-subtable)
                         ;; -- check
                         (error "should find record, but find table, key:~a" key))
                        (else
                         ;; update -- check
                         (set-cdr! record-or-next-subtable value)
                         ))
                  ;; should iter next layer
                  (cond ((not record-or-next-subtable)
                         ;; insert&iter next layer -- check
                         (begin
                           (set-cdr! current-subtable
                                     (cons (list key) (cdr current-subtable)))
                           (iter (cdr keys) (cadr current-subtable)))
                         )
                        ((is-table? record-or-next-subtable)
                         ;; iter next layer -- check
                         (iter (cdr keys) record-or-next-subtable))
                        (else
                         ;; -- check
                         (error "should find table, but find record, key:~a" key)))))))
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
;; test insert table to record
;; ((t 'insert-proc) (list 'a 'b 'd 'e) 'e-value)

;; test find record at table
;; (display ((t 'lookup-proc) (list 'a 'b 'd 'e)))(newline)

;; test read non-exist key
;; (display ((t 'lookup-proc) (list 'a 'b 'cccc)))(newline)

;; insert record to table
;; ((t 'insert-proc) (list 'a 'b) 'b-value)

