#lang racket
;implementation of rational numbers calculus
;data abstraction will help us to construct abstraction barriers
;and make program more flexible
;closure(замыкание) - possibility to construct complex objects from another complex objects
;also will be covered symbolic differentiation, sets and coding information

;let us assume that we already implement several procedures
;(make-rat <n> <d>) creates n / d
;(numer x) where x = n / d => n
;(denom x) --//- => d

;realisation 1
(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))

;print
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))


;math
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
             (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
              (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (numer y) (denom x))))

(define (equal-rate? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

;how to check
(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))
; 1/2 + 1/3 = 5/6
(print-rat (add-rat one-half one-third))