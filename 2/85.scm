#lang sicp
(load ".\\sicp.scm")

(define (apply-generic op . args)
  ;; ...
  (let ((t1->t2 (get-coercion type1 type2))
        (t2->t1 (get-coercion type2 type1))
        (result ;; cond ... t1->t2 .. t2->t1.. error
         ))
    (let (project-result (project result))
      (if project-result
          project-result
          result))))

(define (project x)
  (apply-generic 'project x))

(define (install-scheme-nummber-package)
  ;; ...
  (put 'project '(scheme-number)
       (error)))

(define (install-ration-package)
  ;; ...
  (put 'project
       '(rational)
       (lambda (x) (round x))))

(define (install-complex-package)
  ;; ...
  (put 'project
       '(complex)
       (lambda (x) (numer x))))

(define (drop x)
  (define (inner-drop y)
    (let ((project-result (project y))
          (raise-result (raise project-result)))
          (cond (project-result
                 
                    )))
  (inner-drop x))
