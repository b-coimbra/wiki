(: fizzbuzz (fixnum (list-of (list fixnum symbol)) -> boolean))
(define (fizzbuzz limit conds)
  (letrec ((itr (lambda (n)
                  (if (> n limit)
                      #t
                      (begin (let ((unfizzed? (foldl (lambda (acc x)
                                                       (if (= 0 (modulo n (car x)))
                                                           (begin (display (cadr x))
                                                                  #f)
                                                           acc))
                                                     #t
                                                     conds)))
                               (if unfizzed?
                                   (display n)))
                             (newline)
                             (itr (fx+ 1 n)))))))
    (itr 1)))
