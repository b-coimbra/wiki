;; non-constant global variables
(defparameter *small* 1)
(defparameter *big* 100)

(defun guess-my-number ()
  (ash (+ *small* *big*) -1)) ; ash shifts the bit by -1

(defun start-over () ; resets the value of *small* and *big*
  (defparameter *small* 1)
  (defparameter *big* 100)
  (guess-my-number))

(defun smaller ()
  (setf *big* (1- (guess-my-number))) ; setf changes the value of the global variable *big*
  (guess-my-number))

(defun bigger ()
  (setf *small* (1+ (guess-my-number)))
  (guess-my-number))

