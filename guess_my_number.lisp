
(defparameter *small* 1)

(defparameter *big* 100)

(defparameter *guesses* 0)

;; Select the number between the two possible extremes
(defun guess-my-number ()
  (setf *guesses* (1+ *guesses*))
  (ash (+ *small* *big*) -1))

;; Guess was too high, set upper limit to 1 lower than the last guess
(defun smaller ()
  (setf *big* (1- (guess-my-number)))
  (guess-my-number))

;;  Guess was too low.  Set lower limit to 1 higher than last guess
(defun bigger ()
  (setf *small* (1+ (guess-my-number)))
  (guess-my-number))

;; Guessed the right number.  Print statistics
(defun correct ()
  (format T "Guessed: ~a in ~a tries" (guess-my-number) *guesses*))

;; Start a new game.  Initialize everything and make first guess.
(defun start-over ()
  (defparameter *guesses* 0)
  (defparameter *small* 1)
  (defparameter *big* 100)
  (guess-my-number))
