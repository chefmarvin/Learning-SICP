;; SICP Practice: 2-57
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 数据构造层
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (variable? e)
  (symbol? e))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (sum? e)
  (and (pair? e) (eq? (car e) '+)))

(define (product? e)
  (and (pair? e) (eq? (car e) '*)))

(define (exponentiation? e)
  (and (pair? e) (eq? (car e) '**)))

(define (addend e)
  (cadr e))

;; (define (augend e)
;;   (define (transform exp)
;; 	exp)
;;   (let ((exp (cddr e))
;; 		(term (caddr e)))
;; 	(cond ((and (= 1 (length exp))
;; 				(or (number? (car exp))
;; 					(symbol? (car exp))))
;; 		   term)
;; 		  (() )
;; 		  (() )
;; 		  (() )
;; 		  (() )
;; 		  (else (transform exp)))))

(define (augend e)
  (define (transform exp)
    (cond (() )
	  (() )
	  (() )
	  (() )
	  (else ())))
  (transform e))

(define (multiplier e)
  (cadr e))

(define (multiplicand e)
  (define (transform exp)
    exp)
  (let ((exp (cddr e))
	(term (caddr e)))
    (if (or (number? exp) (symbol? exp))
	term
	(transform exp))))

(define (base e)
  (cadr e))

(define (exponent e)
  (caddr e))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
	((=number? a2 0) a1)
	((and (number? a1) (number? a2)) (+ a1 a2))
	(else (list '+ a1 a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	((=number? m1 1) m2)
	((=number? m2 1) m1)
	((and (number? m1) (number? m2)) (* m1 m2))
	(else (list '* m1 m2))))

(define (make-exponentiation s1 s2)
  (define (exp a b)
    (define (exp-iter a b counter)
      (if (= counter b)
	  a
	  (* a (exp-iter a b (+ counter 1)))))
    (exp-iter a b 1))
  (cond ((=number? s1 0) 0)
	((=number? s1 1) 1)
	((=number? s2 0) 1)
	((=number? s2 1) s1)
	((and (number? s1) (number? s2)) (exp s1 s2))
	(else (list '** s1 s2))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 数据选择层
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp)
	 (if (same-variable? exp var)
	     1
	     0))
	((sum? exp)
	 (make-sum (deriv (addend exp) var)
		   (deriv (augend exp) var)))
	((product? exp)
	 (make-sum (make-product (multiplier exp)
				 (deriv (multiplicand exp) var))
		   (make-product (deriv (multiplier exp) var)
				 (multiplicand exp))))
	((exponentiation? exp)
	 (make-product (make-product (exponent exp)
				     (make-exponentiation (base exp)
							  (make-sum (exponent exp)
								    -1)))
		       (deriv (base exp) var)))
	(else (error "unknown expression type -- DERIV exp" exp))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 使用层
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(begin
  (display (deriv '(+ x 3) 'x)) (newline)
  (display (deriv '(* x y) 'x)) (newline)
  (display (deriv '(+ (** x 3) (* 2 x)) 'x)) (newline)
  ;; 以下两个返回值相同
  ;; 应当为 (+ (* x y) (* y (+ x 3)))
  (display (deriv '(* x y (+ x 3)) 'x)) (newline)
  (display (deriv '(* (* x y) (+ x 3)) 'x)) (newline))

