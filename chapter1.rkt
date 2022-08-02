#lang racket
;simple functions
(+ 1 2)
(define radius 10)
(define circumference (* 2 pi radius))
(define (square x) (* x x))
(define (sum-of-squares x y) (+ (square x) (square y)))
;if conditions and predicates
;(> x 0) - predicate example
(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(define (abs2 x)
  (cond ((< x 0) (- x))
        (else x)))

(define (abs3 x)
  (if (< x 0)
      (- x)
      x))

(define (>= x y)
  (or (> x y) (= x y)))
;problem 1.2
;(/ (+ 5 (+ 4 (- 2 (- 3 (+ 6(/ 4 5)))))) (* 3 (* (- 6 2)(- 2 7))))
;problem 1.3
(define (sum-of-maxsquares x y z)
  (if (> x y)
      (if (> y z)
          (+ (* x x) (* y y))
          (+ (* x x) (* z z)))
      (if (> x z)
          (+ (* x x) (* y y))
          (+ (* y y) (* z z)))))
;problem 1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
;problem 1.5
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))
;sqrt
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

