;; SICP Practice: 2-25
(define a '(1 3 (5 7) 9))
(define (get-a a)
  (cadar (cddr a)))

(define b '((7)))
(define (get-b b)
  (caar b))

(define c '(1 (2 (3 (4 (5 (6 7)))))))
(define (get-c c)
  (cadr (cadr (cadr (cadr (cadr (cadr c)))))))

(begin
  (display (get-a a))
  (newline)
  (display (get-b b))
  (newline)
  (display (get-c c))
  (newline))
