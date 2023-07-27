#lang sicp
(load ".\\sicp.scm")

证明
如果两个区间是(a1,b1), (a2,b2)
则他们的宽度是wid1=(b1-a1)/2, wid2=(b2-a2)/2

区间之和为(a1+a2, b1+b2)
宽度为(b1+b2-(a1+a2))/2
   = (b1-a1)/2 + (b2-a2)/2
   = wid1 + wid2

区间之差为(a1-a2, b1-b2)
宽度为(b1-b2-(a1-a2))/2
   = (b1-a1)/2 - (b2-a2)/2
   = wid1 - wid2

区间之乘为(min a1*b1 a1*b2 a2*b1 a2*b2,
         max a1*b1 a1*b2 a2*b1 a2*b2)
无法转换为f(wid1, wid2)的函数
除法同理
