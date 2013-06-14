;; SICP Practice: 2-57
;; e 是变量吗？
(define (variable? e)
  (symbol? e))

;; exp 和 num 是相同的数字吗？
(define (=number? exp num)
  (and (number? exp) (= exp num)))

;; v1 和 v2 是同一个变量吗？
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

;; e 是和式吗？
(define (sum? e) (and (pair? e) (eq? (car e) '+)))

;; e 的被加数
(define (addend e) (cadr e))

;; e 的加数
(define (augend e)
  (define (transform exp)
    (cond ((sum? exp) exp)
	  ((product? exp) exp)
	  (else (list '+ (car exp) (transform (cddr exp))))))
  (let ((exp (cddr e))
	(term (caddr e)))
    (if (= 1 (length exp))    ;; 后缀的长度是 1
	term
	(transform exp))))

(define (make-sum a1 a2)    ;; 构造起 a1 与 a2 的和式
  (cond ((=number? a1 0) a2)
	((=number? a2 0) a1)
	((and (number? a1) (number? a2)) (+ a1 a2))
	(else (list '+ a1 a2))))

(define (product? e)    ;; e 是乘式
  (and (pair? e) (eq? (car e) '*)))

(define (multiplier e)    ;; e 的被乘数
  (cadr e))

(define (multiplicand e)    ;; e 的乘数
  (if (= 1 (length (cddr e)))
      (caddr e)    ;; * 对应的变量只有2个的话，返回数
      (append '(*) (cddr e))))    ;; * 对应的变量多于2个的话，返列表

(define (make-product m1 m2)    ;; 构造起 m1 与 m2 的乘式
  (if (and (pair? m2)
	   (not (sum? m2))
	   (not (product? m2))
	   (not (eqv? '() (cdr m2))))
      (let ((tmp (cdr m2)))
	(list '* m1 (make-product (car tmp) (cdr tmp))))
      (if (pair? m2)
	  (cond ((or (=number? m1 0) (=number? (car m2) 0)) 0)
		((=number? m1 1) (car m2))
		((=number? (car m2) 1) m1)
		((and (number? m1) (number? (car m2))) (* m1 (car m2)))
		(else (list '* m1 (car m2))))
	  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
		((=number? m1 1) m2)
		((=number? m2 1) m1)
		((and (number? m1) (number? m2)) (* m1 m2))
		(else (list '* m1 m2))))))

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
  (display (deriv '(+ (** x 3) (* 2 x)) 'x))
  (newline)
  ;; 以下两个返回值相同
  ;; 应当为 (+ (* x y) (* y (+ x 3)))
  (display (deriv '(* x y (+ x 3)) 'x))
  (newline)
  (display (deriv '(* (* x y) (+ x 3)) 'x))
  (newline))
