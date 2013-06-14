;; SICP Practice: 2-22.scm
;; 输出的结果与需要的相反
;; 原因是：
(define (square-list items)
  (define (iter answer things)
    (if (null? things)
	answer
	(iter (cons ((lambda (x) (* x x)) (car things))
		    answer)
	      (cdr things))))
  (iter '() items))

(begin
  (display (square-list (list 1 2 3 4)))
  (newline))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
