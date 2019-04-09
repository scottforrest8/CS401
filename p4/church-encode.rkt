
#lang racket		  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  	
;		  
; Project 4 -- A church compiler -- Scheme -> Lambda		  
;  	
; The goal of this project is to write a functional compiler that transforms  	
; code in an input language (a significant subset of Scheme, roughly) into		  
; equivalent code in the lambda calculus. Details below.  	
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
 

(provide church-encode)  	


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


;; Your task is to compile the input language:		  
;  	
; e ::= (letrec ([x (lambda (x ...) e)]) e)
;     | (let ([x e] ...) e) 
;     | (lambda (x ...) e)
;     | (e e ...) 
;     | x 
;     | (and e e) | (or e e)		  
;     | (if e e e)
;     | (prim e) | (prim e e)  	
;     | datum  	
; datum ::= nat | (quote ()) | #t | #f 
; nat ::= < satisfies natural? >  	
; x ::= < satisfies symbol? >		  
; prim ::= < is a primitive operation in: >		  
(define prims '(+ * - = add1 sub1 cons car cdr null? not zero?))  	
 
;; To the lambda calculus, output language:  	
;
; e ::= (lambda (x) e)  	
;     | (e e) 
;     | x 
;

;; Only 501 students are required to support '=, '-, and 'sub1 

;; The input language should behave as it does evaluated by Racket,
;; however, you do not need to handle non-booleans being treated as #t
;; at guard expressions, or at and/or expressions. 

;; The grammar above does not include variadic lambdas or apply.		  

;; No test will produce a negative number, input '(- 1 3) is undefined. 

;; Implementing your church encodings and these primitive operations, 
;; you are free to look up standard church encodings online  	
;; (e.g., on wikipedia), as long as you understand them, but are not
;; allowed to use an existing church-encoder or to get help in writing  	
;; your church compiler itself. 


(define (prim? prim)
  (if (member prim prims) #t #f))  	


; Note how churchify is called from church-encode below.		  
; To make output less verbose, intead of inserting a church encoding,		  
; e.g., for 'car, at each occurance of a constant or prim-op,  	
; it's recommended you bind them to a variable prefixed with 'church:,  	
; e.g., 'church:car, and then use this function to generate that name
; from the name of the primitive operation.
; (churchify-prim 'car) => 'church:car		  
(define (churchify-prim prim)
  (string->symbol (string-append "church:" (symbol->string prim)))) 

;FOUND TONS OF HELPFUL INFO IN THIS BOOK
;http://www.macs.hw.ac.uk/~greg/books/gjm.lambook88.ps

; This is your main compiler transformation rewriting exp -> exp  	
(define (churchify e)
; (printf "~n e: ") (print `(,e)) (printf "________________________")
  (match e
         ; Tagged expressions
         [`(letrec ([,f (lambda (,args ...) ,e0)]) ,e1)
          (churchify `(let ([,f (Y-comb (lambda (,f) (lambda ,args ,e0)))]) ,e1))]
         
          ; A common idiom will be to make a tail call.
          ; In this case, if xs is '(a b), the recursive call
          ; to churchify should perform the needed currying.
          ; Watch out for forming infinite loops!
          [`(let ([,xs ,e0s] ...) ,e1)
            (churchify `((lambda ,xs ,e1) . ,e0s))]
        
        ;Slide: 14
         [`(lambda () ,e0)
          `(lambda (_) ,(churchify e0))]
         [`(lambda (,x) ,e0)
          `(lambda (,x) ,(churchify e0))]
         [`(lambda (,x . ,rest) ,e0)
          `(lambda (,x) ,(churchify `(lambda ,rest ,e0)))]
         
         ;; TODO: are there more match cases to add? and or ifthenelse prim

         ;simple conditional
         [`(and ,e0 ,e1)
            ; (printf "~n ANDe0: ") (print e0)
            ; (printf "~n ANDe1: ") (print e1) (printf "~n")
            (churchify `(if ,e0 (if ,e1 #t #f) #f))]
          ;simple conditional
         [`(or ,e0 ,e1)
            ; (printf "~n ORe0: ") (print e0)
            ; (printf "~n ORe1: ") (print e1) (printf "~n")
            (churchify `(if ,e0 #t (if ,e1 #t #f)))]

        ;Slides: 17-22
         [`(if ,e0 ,e1 ,e2)
            ; (printf "~n IFe0: ") (print e0)
            ; (printf "~n IFe1: ") (print e1)
            ; (printf "~n IFe2: ") (print e2) (printf "~n")
            (churchify `(,e0 (lambda () ,e1) (lambda () ,e2)))]

        ;Combines prim with the rest of the arguments
         [`(,(? prim? prim) . ,args)
            ; (printf "~n Prim: ") (print prim )
            ; (printf "~n ,args: ") (print args ) (printf "~n")
            (churchify `(,(churchify-prim prim) . ,args))]
                    ;call churchify-prim to add "church: in front to continue with eval"
                    ;Example: (+ . (2 3))
         ; Variables
         [(? symbol? x) x]

         ; Datums		  
         [(? natural? nat)
            ; (printf "~n Nat: ") (print nat ) (printf "~n")
            ;helper function if 0 return 'x' else subtract one
            (define (nathelper nat)
              (if (= 0 nat) 'x `(f ,(nathelper (- nat 1)))))
            (churchify `(lambda (f) (lambda (x) ,(nathelper nat))))] 
         [''() ;Slide: 35
            (churchify `(lambda (when-cons when-null) (when-null)))]
         [#t  ;simple true statment
            (churchify `(lambda (t f) (t)))]
         [#f  ;simple false statment
            (churchify `(lambda (t f) (f)))]

         ; Untagged application (has to go last)
         [`(,fun) ;function with null args
          (churchify `(,fun (lambda (_) _)))]
         [`(,fun ,arg)
          `(,(churchify fun) ,(churchify arg))]
         [`(,fun ,arg . ,rest)	
           (churchify `((,fun ,arg) . ,rest))]))


;; This is the top-level church encoder 
;; You might find it convenient to define your church:prim functions here, 
;; as illustrated, but this also means testing at the REPL will be easier
;; by calling churchify directly and seeing that its output looks correct.

;Used slides for Y-comb, null?, cons
;Car, Cdr: https://www.cs.drexel.edu/~jjohnson/2016-17/spring/cs550/lectures/5.html
(define (church-encode expr)
  (define Y-comb `((lambda (u) (u u)) (lambda (y) (lambda (f) (f (lambda (x) (((y y) f) x)))))))
  (define church:null? `(lambda (p) (p (lambda (a b) #f) (lambda () #t))))
  (define church:cons `(lambda (a b) (lambda (when-cons when-null) (when-cons a b))))
  (define church:car `(lambda (p) (p (lambda (a b) a) (lambda () (lambda (u) u)))))  	
  (define church:cdr `(lambda (p) (p (lambda (a b) b) (lambda () (lambda (u) u)))))

  ; Because these are all passed through churchify, we do not need to curry  	
  (define church:add1 `(lambda (n) (lambda (f x) (f ((n f) x)))))

  ;https://stackoverflow.com/questions/8790249/lambda-calculus-predecessor-function-reduction-steps
  ;used this for sub1 aka "predecessor"
  (define church:sub1 `(lambda (n) (lambda (f) (lambda (x) (((n (lambda (g) (lambda (h) (h (g f))))) (lambda (u) x))(lambda (u) u)))))) ;grad
  (define church:zero? `(lambda(n) ((n (lambda(x) #f)) #t)))
  (define church:+ `(lambda (m n) (lambda (f x) ((n f) ((m f) x)))))
  (define church:- `(lambda (m n) ((n ,church:sub1) m))) ;grad
  (define church:* `(lambda (m n) (lambda (f x) ((m (n f)) x))))
  
  (define church:= `(lambda (m n) (and (,church:zero? (,church:- m n)) (,church:zero? (,church:- n m))))) ;grad
  (define church:not `(lambda (bool) (if bool #f #t)))
  (churchify  	
   `(let ([Y-comb ,Y-comb]
          [church:null? ,church:null?]  	
          [church:cons ,church:cons]
          [church:car ,church:car] 
          [church:cdr ,church:cdr]  	
          [church:add1 ,church:add1]
          [church:sub1 ,church:sub1]
          [church:+ ,church:+]  	
          [church:- ,church:-]
          [church:* ,church:*]
          [church:zero? ,church:zero?]		  
          [church:= ,church:=]	  
          [church:not ,church:not])
      ,expr)))