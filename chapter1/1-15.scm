;; 当(sin 12.15)时，p被调用的次数
(define counter 0)

(define (sine angle)
  (define (cube x)
    (* x x x))
  (define (p x)
    (set! counter (+ counter 1))
    (- (* 3 x)
	   (* 4 ((lambda (x)
			   (* x x x))
			 x))))
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(begin
  (display (sine 12.15))
  (newline)
  (display counter)
  (newline))
