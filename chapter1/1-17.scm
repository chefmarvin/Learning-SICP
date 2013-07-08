;; SICP Practice: 1-17
(define (double num)
  (+ num num))

(define (halve num)
  (if (even? num)
	  (/ num 2)
	  (error "Number given is not even.")))

(define (* a b)
  ;; (+ 2 (* 2 5))
  ;; (+ 2 (+ 2 (* 2 4)))
  ;; (+ 2 (+ 2 (+ 2 (* 2 3))))
  ;; (+ 2 (+ 2 (+ 2 (+ 2 (* 2 2)))))
  ;; (+ 2 (+ 2 (+ 2 (+ 2 (+ 2 (* 2 1))))))
  ;; (+ 2 (+ 2 (+ 2 (+ 2 (+ 2 (+ 2 (* 2 0)))))))
  ;; (* 2 0) => 0
  ;; (+ 2 (+ 2 (+ 2 (+ 2 (+ 2 (+ 2 0))))))
  (if (= b 0)
	  0
	  (+ a (* a (- b 1)))))

(define (** a b)
  (cond ((= b 0) 0)
		((even? b) (double (** a (halve b))))
		(else (+ a (** a (- b 1))))))

(begin
  (display (* 2 6))
  (newline)
  (display (** 2 6))
  (newline))
