(funcall #'(lambda (x y)
             (if (>= x y)
                 (format t "~a is greater than ~a!~%" x y))) 10 5)

(defun fib(n)
  (cond
    ((= n 1) 0)
    ((= n 2) 1)
    ((+ (fib (- n 1)) (fib (- n 2))))))

(format t "~d~%" (fib 10))
