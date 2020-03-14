(defparameter *small* 1)

(defparameter *big* 100)

(defparameter *guesses* 0)

(defun guess-my-number ()
  (setf *guesses* (1+ *guesses*))
  (ash (+ *small* *big*) -1))

(defun smaller ()
  (setf *big* (1- (guess-my-number)))
  (guess-my-number))

(defun bigger ()
  (setf *small* (1+ (guess-my-number)))
  (guess-my-number))

(defun correct ()
  (format T "Guessed: ~a in ~a tries" (guess-my-number) *guesses*))

(defun start-over ()
  (defparameter *guesses* 0)
  (defparameter *small* 1)
  (defparameter *big* 100)
  (guess-my-number))
