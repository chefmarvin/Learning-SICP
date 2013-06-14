;; check return value
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))
(begin
  (display (test 0 (p)))
  (newline))
