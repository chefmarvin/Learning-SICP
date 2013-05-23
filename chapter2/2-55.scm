;; SICP Practice: 2-55
(begin
  ;; ''abracadabra 是一个 list
  (display (list? ''abracadabra))
  (newline)
  ;; 这个 list 的第一个元素是 quote
  (display (car ''abracadabra))
  (newline)
  ;; 这个 list 的第二个元素是 (abracadabra)
  (display (cdr ''abracadabra))
  (newline)

  ;; 看来 quote 的操作就是一个 cdr 一个 list 的过程
  ;; 这个 list 是由 quote 和 quote 要 apply 的参数组成的
  (display (quote abracadabra))
  (newline)
  (display (quote (quote abracadabra)))
  (newline)
  (display (quote (quote (quote abracadabra))))
  (newline))
