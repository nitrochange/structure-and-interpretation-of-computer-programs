#lang racket
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (make-interval a b) (cons a b))
;2.7
(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))
;check 2.7
(define zero-one (make-interval 0 1))
(define one-two (make-interval 1 2))

(upper-bound zero-one)
(add-interval zero-one one-two)
(mul-interval zero-one one-two)
;2.8
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))
;check 2.8
(sub-interval one-two zero-one)

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

;2.12

(define (make-center-percent s w)
  (make-interval (- s (* w (/ s 100))) (+ s (* w (/ s 100)))))
(define (percent x)
  (* 100 (/ (width x) (center x))))
(define test-interval (make-center-percent 100 10))
(percent test-interval)

