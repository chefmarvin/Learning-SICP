;; SICP Practice: 2-19
(define us-coins (list 1 5 10 25 50))
(define uk-coins (list 0.5 1 2 5 10 20 50 100))

(define (count-change coin-type amount)
  (define (list-ref list n)
    (if (= n 0)
	(car list)
	(list-ref (cdr list) (- n 1))))
  (define (first-denomination kinds-of-coins type-of-coins)
    (list-ref type-of-coins (- kinds-of-coins 1)))
  (define (cc amount kinds-of-coins)
    (cond ((= amount 0) 1)
	  ((or (< amount 0) (= kinds-of-coins 0)) 0)
	  (else (+ (cc amount
		       (- kinds-of-coins 1))
		   (cc (- amount
			  (first-denomination kinds-of-coins coin-type))
		       kinds-of-coins)))))
  (cc amount 5))

(begin
  (display (count-change uk-coins 100))
  (newline))
