(define-module (bashax packages stumpwm)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  ;; so we can inherit from stumpwm-contrib
  #:use-module (gnu packages wm))

(define-public sbcl-stumpwm-battery-portable
  (package
   (inherit stumpwm-contrib)
   (name "sbcl-stumpwm-kbd-layouts")
   (arguments
    '(#:asd-system-name
      "battery-portable"
      #:tests? #f
      #:phases
      (modify-phases %standard-phases
                     (add-after 'unpack 'chdir (lambda _ (chdir "modeline/battery-portable") #t)))))
   (home-page
    "https://github.com/stumpwm/stumpwm-contrib/tree/master/modeline/battery-portable")
   (synopsis "Battery information for StumpWM")
   (description "Battery information for StumpWM")
   (license license:gpl3+)))
