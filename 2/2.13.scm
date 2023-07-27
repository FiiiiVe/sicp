#lang sicp
(load ".\\sicp.scm")

;; 区间(c1-c1p1, c1+c1p1) (c2-c2p2, c2+c2p2)
;; 假设全正，乘积((c1-c1p1)(c2-c2p2), (c1+c1p1)(c2+c2p2))
;; (c1c2-(p1+p2-p1p2)c1c2, c1c2+(p1+p2+p1p2)c1c2)
;; 由于误差很小，所以p1p2忽略不计
;; 无误差情况下乘积为c1c2，故误差p=p1+p2
