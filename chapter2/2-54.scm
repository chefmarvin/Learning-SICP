;; SICP Practice: 2-54
(define (equal? list-a list-b)
  (cond ((= 0 (length list-b)) (= 0 (length list-a)) #t)
	((not (eq? (car list-a) (car list-b))) #f)
	(else (equal? (cdr list-a) (cdr list-b)))))

(begin
  (display (equal? '(1 2 3) '(1 2 3)))
  (newline)
  (display (equal? '(1 2 3) '(1 2 4)))
  (newline))
