;; SICP Practice: 2-17
(define (last-pair sample)
  (if (null? (cdr sample))
      sample
      (last-pair (cdr sample))))

(begin
  (display (last-pair '(1 2 3 4)))
  (newline))
