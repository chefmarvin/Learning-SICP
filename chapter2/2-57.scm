;; SICP Practice: 2-57
;; 符号求导中加入处理任意项的和乘积
(define (variable? e)    ;; e 是变量吗？
  (symbol? e))

(define (=number? exp num)    ;; exp 和 num 是相同的数字吗？
  (and (number? exp) (= exp num)))

(define (same-variable? v1 v2)    ;; v1 和 v2 是同一个变量吗？
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (sum? e)    ;; e 是和式吗？
  (and (pair? e) (eq? (car e) '+)))

(define (addend e)    ;; e 的被加数
  (cadr e))

(define (augend e)    ;; e 的加数
  (if (= 3 (length e))
	  (caddr e)
	  (cddr e)))

(define (make-sum a1 a2)    ;; 构造起 a1 与 a2 的和式
  (if (or (= (length a2) 1) (number? a2))
	  (cond ((=number? a1 0) (car a2))
			  ((=number? (car a2) 0) a1)
			  ((and (number? a1) (number? (car a2))) (+ a1 (car a2)))
			  (else (list '+ a1 (car a2))))
	  (list '+ a1 (make-sum (car a2) (cdr a2)))))

;; (define (make-sum a1 a2)
;;   (cond ((and (not (pair? a1)) (not (pair? a2)))
;; 		 (cond ((=number? a1 0) a2)
;; 			   ((=number? a2 0) a1)
;; 			   ((and (number? a1) (number? a2)) (+ a1 a2))
;; 			   (else (list '+ a1 a2))))
;; 		((and (not (pair? a1)) (pair? a2))
;; 		 1)
;; 		((and (not (pair? a2)) (pair? a1))
;; 		 2)
;; 		(else
;; 		 3)))

(define (product? e)    ;; e 是乘式
  (and (pair? e) (eq? (car e) '*)))

(define (multiplier e)    ;; e 的被乘数
  (cadr e))

(define (multiplicand e)    ;; e 的乘数
  (if (= 3 (length e))
	  (caddr e)
	  (cddr e)))

(define (make-product m1 m2)    ;; 构造起 m1 与 m2 的乘式
  (if (not (pair? m2))    ;; (= (length m2) 1)
	  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
			((=number? m1 1) m2)
			((=number? m2 1) m1)
			((and (number? m1) (number? m2)) (* m1 m2))
			(else (list '* m1 m2)))
	  (list '* m1 (make-product (car m2) (cdr m2)))))

(define (exponentiation? e)    ;; e 是乘幂式吗？
  (and (pair? e) (eq? (car e) '**)))

(define (base e)    ;; e 的底
  (cadr e))

(define (exponent e)    ;; e 的指数
  (caddr e))

(define (make-exponentiation s1 s2)    ;; 构造起 s1 与 s2 的乘幂式
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
					   (deriv (base exp)
							  var)))
		(else (error "unknown expression type -- DERIV exp" exp))))

(begin
  (display (deriv '(+ x 3) 'x))
  (newline)
  (display (deriv '(* x y) 'x))
  (newline)
  (display (deriv '(* (* x y) (+ x 3)) 'x))
  (newline)
  (display (deriv '(+ (** x 3) (* 2 x)) 'x))
  (newline)
  ;; new test case
  (display (deriv '(* x y (+ x 3)) 'x))
  (newline))
