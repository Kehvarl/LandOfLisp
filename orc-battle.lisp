;; Player information
(defparameter *player-health* nil)
(defparameter *player-agility* nil)
(defparameter *player-strength* nil)

;; Monster information
(defparameter *monsters* nil)
(defparameter *monster-builders* nil)
(defparameter *monster-num* 12)

(defun orc-battle ()
  (init-monsters)
  (init-player)
  (game-loop)
  (when (player-dead-p)
    (princ "You have been killed. Game Over."))
  (when (monsters-dead-p)
    (princ "Congratulations!  You have vanquished all your foes.")))


