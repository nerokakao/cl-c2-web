(in-package #:cl-c2-web)

(defun read-file (path)
  (with-open-file (s path)
    (do ((l (read-line s) (read-line s nil 'eof))
	 (str nil))
	((eq l 'eof) str)
      (setf str (concatenate 'string str l)))))
