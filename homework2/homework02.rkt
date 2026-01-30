;;
;; FILE:     homework02.rkt
;; AUTHOR:   Dominick Olhava
;; DATE:     2026/01/28
;; COMMENT:  Provides templates for your solutions, plus a few tests.
;;
;; MODIFIED: 2026/01/28
;; CHANGE: Start of homework 2
;;

#lang racket
(require rackunit)      ; enables you to use rackunit tests

;; -------------------
;; -----   [1]   -----
;; -------------------

;; lambda produces a 'function' value that is assigned to the name: 'discriminant'
(define discriminant
  (lambda (a b c)
    (- (expt b 2) (* 4 a c))))

(check-equal? (discriminant 1 4 4) 0)
(check-equal? (discriminant 1 5 6) 1)


;; -------------------
;; -----   [2]   -----
;; -------------------

(define total-grade
  (lambda (homework quizzes final)
    (+ (* 0.25 homework) (* 0.45 quizzes) (* 0.30 final))))

(check-= (total-grade  90  80  90)  85.5 0.01)
(check-= (total-grade  60  50  40)  49.5 0.01)
(check-= (total-grade 100 100 100) 100.0 0.01)


;; -------------------
;; -----   [3]   -----
;; -------------------

;; First Try
;;(define ring-area
;;  (lambda (inner outer)
;;    (- (* pi (expt outer 2)) (* pi (expt inner 2)))))

;; Modularized
(define circle-area
  (lambda (radius)
    (* pi (expt radius 2))))

(define ring-area
  (lambda (inner outer)
    (- (circle-area outer) (circle-area inner))))

(check-= (ring-area 1 2)  9.42     0.01)
(check-= (ring-area 2 2)  0        0.01)
(check-= (ring-area 5 48) 7159.689 0.01)


;; -------------------
;; -----   [4]   -----
;; -------------------

(define candy-temperature
  (lambda (temp elevation)
    (- temp (/ (exact->inexact elevation) 500.0) )))

(check-= (candy-temperature 244 5280)   233.44    0.00001)
(check-= (candy-temperature 302 977.69) 300.04462 0.00001)
(check-= (candy-temperature 302 -1401)  304.802   0.00001)


;; -------------------
;; -----   [5]   -----
;; -------------------

(define in-range?
  (lambda (actual desired epsilon)
    (and (< actual (+ desired epsilon)) (> actual (- desired epsilon)))))

(check-true  (in-range? 4.95 5.0 0.1))
(check-false (in-range? 4.95 5.0 0.01))    ;; not anymore!
(check-true  (in-range? 5.0 4.95 0.1))     ;; works both ways
(check-false (in-range? 5.0 5.95 0.1))
(check-true  (in-range? 5.5 5.95 0.5))


;; -----   end   -----



