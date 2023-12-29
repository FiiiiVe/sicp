#lang sicp
(load ".\\sicp.scm")

(define (or-gate a b output)
  (let ((c1 (make-wire))
        (c2 (make-wire))
        (c3 (make-wire)))
    (inverter a c1)
    (inverter b c2)
    (and-gate c1 c2 c3)
    (inverter c3 output)
    'ok))
