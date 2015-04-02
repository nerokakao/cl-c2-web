(in-package #:cl-c2-web)


(restas:define-route home-page ("/")
  (cl-c2-web.view:main))


