(setq *print-case* :capitalize)

;; constant global variable
(defvar *name* (read))
;; (defparameter *name* (read)) is a global variable

(defun say-hi(name)
    (format t "Hello ~a! ~%" name))

(say-hi *name*)

;;

(defvar *num* 3)

(format t "~d ~%" (eq *num* 3))

;;

(defvar *age* 18)

(if (= *age* 18)
    (format t "You can vote!")
    (format t "You can't vote :("))

(if (or (<= *age* 14) (>= 70))
    (format t "No need to work!")
    (format t "Must work"))

;;

(defvar *num* 2)
(defvar *num-1* 2)

(if (= *num* 2)
	(progn
		(setf *num-1* (* *num-1* 2)))
	(format t "Not equal 2~%"))

(format t "num ~d ~%" *num-1*)

;;

(defvar *age* 15)

(defun get-age(age)
	(case age
		(5   (print "Children"))
		(10  (print "litte kid"))
		(otherwise (print "teen"))))

(get-age *age*)

(terpri)

;; local variable
(let ((a 5)
      ( b 6))
  (+ a b))

;; local function, can be used to declare multiple local functions at once (just like let)
(flet ((f (n)
         (+ n 10))
       (g (n)
         (- n 3)))
  (g (f 5)))

(eq 'abc 'ABC) ; returns true, lisp is case-insensitive

(princ "lorem ipsum") ; display string


(cons 'abc 'def) ; links the two symbols together

(car '(a b c)) ; gets the first slot of a cell (head)

(cdr '(a b c)) ; gets the tail of the list

(defun list-length (list)
  (if list
      (1+ (list-length (cdr list)))
      0))

(list-length '(a b c d)) ; => 4

