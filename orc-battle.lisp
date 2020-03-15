;; Player information
(defparameter *player-health* nil)
(defparameter *player-agility* nil)
(defparameter *player-strength* nil)

;; Monster information
(defparameter *monsters* nil)
(defparameter *monster-builders* nil)
(defparameter *monster-num* 12)

(defun init-player()
  (setf *player-health* 20)
  (setf *player-agility* 30)
  (setf *player-strength* 30))

(defun player-dead-p ()
  (<= *player-health* 0))

(defun show-player ()
  (fresh-line)
  (princ "You are a valiant knight with a health of ")
  (princ *player-health*)
  (princ ", an agility of ")
  (princ *player-agility*)
  (princ ", and a strength of ")
  (princ *player-strength*))

(defun player-attack ()
  (fresh-line)
  (princ "Attack style: [s]tab [d]ouble swing [r]oundhouse:")
  (case (read)
    (s (monster-hit (pick-monster)
                    (+ 2 (randval (ash *player-strength* -1)))))
    (d (let ((x (randval (truncate (/ *player-strength* 6)))))
         (princ "Your double swing has a strength of")
         (print x)
         (fresh-line)
         (monster-hit (pick-monster) x)
         (unless (monsters-dead-p)
           (monster-hit (pick-monster) x))))
    (otherwise (dotimes (x (1+ randval (truncate (/ *player-strength* 3))))
                 (unless (monsters-dead-p)
                   (monster-hit (random-monster) 1))))))


(defun orc-battle ()
  (init-monsters)
  (init-player)
  (game-loop)
  (when (player-dead-p)
    (princ "You have been killed. Game Over."))
  (when (monsters-dead-p)
    (princ "Congratulations!  You have vanquished all your foes.")))


(defun game-loop ()
  (unless (or (platyer-dead-p) (monsters-dead-p))
    (show-player)
    (dotimes (k (1+ (truncate (/ (max 0 *player-agility*) 15 ))))
      (unless (monsters-dead-p)
        (show-monsters)
        (player-attack)))
    (fresh-line)
    (map 'list
         (lambda(m)
           (or (monster-dead-p m) (monster-attack m)))
         *monsters*)
    (game-loop)))
