;; SICP Practice: 3-3
(define (make-account balance password)
  (define (withdraw amount)
	(if (>= balance amount)
		(begin (set! balance (- balance amount))
			   balance)
		"Insufficient funds"))
  (define (deposit m)
	(set! balance (+ balance m))
	balance)
  (define (dispatch p m)
	(if (eq? password p)
		(cond ((eq? m 'withdraw) withdraw)
			  ((eq? m 'deposit) deposit)
			  (else (error "Unknown request -- MAKE-ACCOUNT"
						   m)))
		(lambda (num) "Incorrect password")))
  dispatch)

(define acc (make-account 100 'secret-password))

(begin
  (display ((acc 'secret-password 'withdraw) 40))
  (newline)
  (display ((acc 'some-other-password 'deposit) 50))
  (newline))
