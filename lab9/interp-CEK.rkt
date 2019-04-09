#lang racket  	


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		  
; 
; Lab 9 -- A control, environment, (k)ontinuation (CEK) interpreter  	
;  	
; The goal of this lab is to extend your interpreter from Lab 6 to include let,  	
; call/cc, an explicitly represented stack, and first-class continuations. Details below. 
;  	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 


(provide interp-CEK) 


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


; Define interp-CEK, a tail recursive (small-step) interpreter for the language: 
;;;  e ::= (lambda (x) e)		  
;;;      | (e e)
;;;      | x 
;;;      | (let ([x e]) e)            ;; <-- only these two forms are
;;;      | (call/cc (lambda (x) e))   ;; <-- new compared with Lab 6  	
;;;      | (if e e e) 
;;;      | (and e e)
;;;      | (or e e)
;;;      | (not e)		  
;;;      | b 
;;;  x ::= < any variable satisfying symbol? >  	
;;;  b ::= #t | #f  	

; You can use (error ...) to handle errors, but will only be tested on		  
; on correct inputs. The language should work as described in Lab 6, except 
; with added (call/cc ...) and (let ...) forms intended to work as 
; in Scheme/Racket. In order to implement call/cc properly, your interpreter		  
; must implement a stack (as opposed to using Racket's stack by making the 
; interpreter directly recursive) yourself and then allow whole stacks to be		  
; used as first-class values, captured by the call/cc form. Because your		  
; interpreter implements its own stack, it does not use Racket's stack,		  
; and so every call to interp-CEK must be in tail position!
; Use the symbol 'halt for an initial, empty stack. When a value is returned 
; to the 'halt continuation, that value is finally returned from interp-CEK.  	
; For first-class continuations, use a tagged `(kont ,k) form where k is the  	
; stack, just as in the CE interpreter you used a tagged `(closure ,lam ,env)	
; form for representing closures.		  

; Two examples: 
;;; (interp-CEK `(call/cc (lambda (k) (and (k #t) #f))) (hash) 'halt)		  
; should yield a value equal? to #t, and 
;;; (interp-CEK `(call/cc (lambda (k0) ((call/cc (lambda (k1) (k0 k1))) #f))) (hash) 'halt) 
; should yield a value equal? to `(kont (ar #f ,(hash 'k0 '(kont halt)) halt))  	
 

(define (interp-CEK cexp env kont)
  (define (return kont v) 
    (match kont 
        
        [`(andk ,e0 ,env ,k)
          (if v
            (interp-CEK e0 env k)
            (return k v))]

        [`(ork ,e1 ,env ,k)
          (if v 
            (return k v)
            (interp-CEK e1 env k))]

        [`(letk ,x ,e1 ,env+ ,k)
          (interp-CEK e1 (hash-set env+ x v) k)]
        
        [`(ifk ,e0 ,e1 ,env ,k)
          (if v
            (interp-CEK e0 env k)
            (interp-CEK e1 env k))]
        
        ['halt v]

        [`(notk ,e0 ,env ,k)
          (if v
            (return k #f)
            (return k #t))]

        [`(ar ,arg ,env+ ,k)
          (interp-CEK arg env+ `(fn ,v ,k))]
        [`(fn (closure (lambda (,x) ,body) ,env+) ,k)
          (interp-CEK body (hash-set env+ x v) k)]
        [`(fn (kont ,k) ,_)
          (return k v)]
          ))	  
  (match cexp
    [`(call/cc (lambda (,x) ,e0))
      (interp-CEK e0 (hash-set env x `(kont ,kont)) kont)]	
    
    [`(and ,e0 ,e1)
      (interp-CEK e0 env `(andk ,e1 ,env ,kont))]
    
    [`(or ,e0 ,e1)
      (interp-CEK e0 env `(ork ,e1 ,env ,kont))]

    [`(let ([,x ,e0]) ,e1)
      (interp-CEK e0 env `(letk ,x ,e1 ,env ,kont))]
    
    [`(lambda (,x) ,body)
      (return kont `(closure ,cexp ,env))]

    [(? symbol? x)
      (return kont(hash-ref env x))]
    
    [(? boolean? b)
      (return kont b)]
    
    [`(not ,e0)
      (interp-CEK e0 env `(notk ,e0 ,env ,kont))]
    
    [`(if ,con ,e0 ,e1)
      (interp-CEK con env `(ifk ,e0 ,e1 ,env ,kont))]
    
    [`(,fun ,arg)
      (interp-CEK fun env `(ar ,arg ,env ,kont))]
    
    [else (error (format "Exp not recognized: ~a" cexp))]))
  	



;class code







