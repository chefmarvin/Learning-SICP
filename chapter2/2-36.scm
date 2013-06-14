;; SICP Practice: 2-36
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

;; seqs 是序列的序列
;; 假定其中每个序列的元素个数都相同
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
	    (accumulate-n op init (map cdr seqs)))))

(begin
  ;; 结果应该是 '(22 26 30)
  (define s '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))
  (display (accumulate-n + 0 s))
  (newline))
