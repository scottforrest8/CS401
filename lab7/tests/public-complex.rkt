#lang racket

(require "../interp-CES.rkt")

;return value: '(#t . #hash((0 . (closure (lambda (f) f) #hash())) (1 . (closure (lambda (s) (id (s (lambda (x) #t)))) #hash((id . 0)))) (2 . (closure (lambda (s) (id (s (lambda (x) #t)))) #hash((id . 0)))) (3 . (closure (lambda (x) #t) #hash((id . 0) (s . 2)))) (4 . (closure (lambda (x) #t) #hash((id . 0) (s . 3)))) (5 . #t) (6 . #t)))

; ((λ (x) (x x)) (λ (s) (id (s (λ (x) #t)))))
(if (equal? (car (interp-CES '((lambda (id) ((lambda (x) (x x)) (lambda (s) (id (s (lambda (x) #t)))))) (lambda (f) f)) (hash) (hash)))
            #t)
    (exit 0)
    (exit 1))


