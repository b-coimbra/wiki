(setq *print-case* :capitalize)

(defvar *name* (read))

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