;;;; cl-c2-web.asd

(asdf:defsystem #:cl-c2-web
  :description "Describe cl-c2-web here"
  :author "nerokakao"
  :license nil
  :depends-on (#:restas #:postmodern #:closure-template)
  :serial t
  :components ((:file "package")
	       (:file "utils")
	       (:file "configure")
	       (:file "init")
               (:file "cl-c2-web")
	       (:file "routes")))

