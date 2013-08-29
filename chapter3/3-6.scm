;; SICP Practice: 3-6
;; 暂用 fabonacci 数列代替 rand-update
(define (fibonacci n)
  (define (fib-iter a b count)
	(if (= count 0)
		b
		(fib-iter (+ a b)
				   a
				   (- count 1))))
  (fib-iter 1 0 n))

(define new-generate
  (let ((x 1))
	(lambda ()
	  (begin (set! x (+ x 1))
			 (display "fibonacci(") (display x) (display "): ")
			 (fibonacci x)))))

(define rand
  (lambda (msg)
	(let ((x 1))
	  (define generate
		(lambda ()
		  (begin (set! x (+ x 1))
				 (display "fibonacci(") (display x) (display "): ")
				 (fibonacci x))))
	  (define reset 
		(lambda (num)
		  (begin (set! x num)
				 (display "fibonacci(") (display x) (display "): ")
				 (fibonacci x))))
	  (cond ((eq? msg 'generate) (generate))    ;; Dispatch
			((eq? msg 'reset) reset)
			(else (error "Unknown request -- RAND"
						 msg))))))

;; (define rand
;;   (lambda (msg)
;; 	(define generate
;; 	  (lambda ()
;; 		(let ((x 1))
;; 		  (set! x (+ x 1))
;; 		  (fibonacci x))))
;; 	(define (reset num)    ;; TODO
;; 	  (fibonacci num))
;; 	(cond ((eq? msg 'generate) (generate))
;; 		  ((eq? msg 'reset) reset)
;; 		  (else (error "Unknown request -- RAND"
;; 					   msg)))))

(begin
  (define new-value 7)
  (display (new-generate)) (newline)
  (display (new-generate)) (newline)
  (display (new-generate)) (newline)
  (display (new-generate)) (newline)
  (display (new-generate)) (newline)
  (newline)
  (display (rand 'generate)) (newline)
  (display (rand 'generate)) (newline)
  (display (rand 'generate)) (newline)
  (display (rand 'generate)) (newline)
  (display (rand 'generate)) (newline)
  (newline)
  (display ((rand 'reset) new-value)) (newline)
  )
