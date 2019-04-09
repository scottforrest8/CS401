#lang racket  	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  	
;  	
; Lab 6 -- A control and environment (CE) interpreter		  
;  	
; The goal of this lab is to write a directly recursive interpreter 
; for a simple language (including lambda calculus and some boolean expressions)  	
; where the program state is modeled by a control expression and an environment  	
; mapping variables in scope to their values. Details below.
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		  

(provide interp-CE)
		  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  	
;  	
; Honor pledge (please write your name.)  	
;
; I **Scott Forrest** have completed this code myself, without  	
; unauthorized assistance, and have followed the academic honor code.		  
;
; Edit the code below to complete your solution.  	
;  	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

; Define interp-CE, a direct recursive (big-step) interpreter for the language:  	
;;;  e ::= (lambda (x) e)
;;;      | (e e)
;;;      | x
;;;      | (if b e e)
;;;      | (and e e)
;;;      | (or e e)
;;;      | (not e)
;;;      | b
;;;  x ::= < any variable satisfying symbol? > 
;;;  b ::= #t | #f

; (A subset of Scheme/Racket that should be interpreted as Scheme/Racket.)		  
; You can use (error ...) to handle errors, but will only be tested on
; on correct inputs. And/Or must properly short-circuit as in Scheme.
; Boolean-returning programs should yield a boolean. Closure-returning 
; programs should yield a representation of an explicit closure: 
; `(closure (lambda (,x) ,body) ,env) that pairs a syntactic lambda with an
; environment encoded as an immutable hash. You may want to use (hash),
; (hash-ref ...), (hash-set ...), (hash-has-key? ...), etc.  	

; For example: 
;;; (interp-CE `((lambda (x) x) (lambda (y) y)) (hash)) 
; should yield a value equal? to: 
;;; `(closure (lambda (y) y) ,(hash))

(define (interp-CE cexp env)
  ; (printf "~n cexp env ~n") (pretty-print `(,cexp ,env))
  ; (printf "~n~n cexp: ") (print cexp) (printf "~n env: ") (print env) (printf "~n")
  (match cexp
         [`(not ,e0)
              #f
              #t)]

         [(? boolean? b) b]

         [`(lambda (,x) ,body)
          `(closure ,cexp ,env)]

         [`(,fun ,arg)
          (match (interp-CE fun env)
                 [`(closure (lambda (,fx) ,fbody) ,fenv)
                  (interp-CE fbody (hash-set fenv fx (interp-CE arg env)))])]
                  ;then this                            this goes first
         [(? symbol? x)
          (hash-ref env x
            (lambda () (error (format "Unbound variable: ~a" x))))]

         [`(if ,guard ,then ,else)
          (if (interp-CE guard env)
              (interp-CE then env)
              (interp-CE else env))]

         [`(and ,e0 ,e1) 
          (if (interp-CE e0 env)
              (interp-CE e1 env)
              #f)]

         [`(or ,e0 ,e1) 
          (if (interp-CE e0 env)
              #t
              (interp-CE e1 env))]
              
         [else (error (format "Exp not recognized: ~a" cexp))]))


; (printf "~n cexp ~n")
  ; (print cexp)
  ; (printf "~n env ~n")
  ; (print env)

  ; #lang racket
  ; (define ht (make-hash))

  ; (hash-set! ht 'z 1)
  ; ht
  ; '#hash((z.1))
  ; (hash-ref ht 'z)
  ; 1
  ; (hash-keys ht)
  ; listofkeys
