#lang racket



;CPS Conversion
;atomic expresion is a datum, lambda, number just something simple
;anything that can be determined in a number of steps is atomic
;cant have return point in CPS
;k0 is the current continuation

;treating is as an atomic expression
;(lambda (x) x) -> 
; (lambda (x) x)

; (k1 0 (lambda (k0 x) (k0 0 x)))
                      ;0 is a dummy value


; TODO: ANF CONVERSION

(define (fact n)
  (if (< n 1)
    1
    (* n (fact(- n 1)))))
  ;  ^--------------^-----this is in tail position

(define (fact n)
  (let ([gv (< n1)]) ;replace (< n 1)
  (if gv
    1
    (* n (fact(- n 1))))))


(define (fact n)
  (let ([gv (< n1)])
  (if gv
    1
    (let ([n-1 (- n 1)])  ;replace (- n 1)
      (* n (fact(- n 1)))))))
    
(define (fact n)
  (let ([gv (< n1)])
  (if gv
    1
    (let ([n-1 (- n 1)])
      (let ([rv (fact n-1)])  ;replace (fact (- n 1))
        (* n rv))))))


; TODO: CPS CONVERSION

(define (fact k n)
  (let ([gv (< n1)])
  (if gv
    (k 0 1) ;(cae 0 n)
    (let ([n-1 (- n 1)])
      (let ([rv (fact n-1)])  ; gonna have to convert this because it calls fact
        (* n rv))))))


;now to handle let
(define (fact k n)
  (let ([gv (< n1)])
  (if gv
    (k 0 1) ;(cae 0 n)
    (let ([n-1 (- n 1)])
      ;(let ([rv (fact n-1)])
        (fact (lambda (_ v) (let ([p (* n v)]) (k p))
        n-1))))))



; cae
; (let ([x RHS]) BODY)

(T-e RHS
`(lambda (_ x) ,(T-e BODY cae)) ;use extended continuation instead of BODY
(let ([x RHS]) BODY))


;Application - takes the current continuation and passes to the function you're calling

;let form- creates a new lambda abstraction which takes the place of the old continuation
;exteding it and when it is envoked it saves x the value of RHS and evaluates BODY 
;passing the value of BODY to cae, the original continuation saved in the environment 
;of the new continuation

;return point - envokes the continuation 

;curve - eigth project is extra credit
;TODO: CURVE - EIGTH PROJECT IS EXTRA CREDIT TODO: 

;(gensym, 'k) use this to generate new name for k?


;APPLY THE CONTINUATION ON RETURN VALUES


