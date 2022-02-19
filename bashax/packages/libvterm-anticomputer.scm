;; use my own fork of libvterm for emacs-vterm support
(define-module (bashax packages libvterm-anticomputer)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config))

(define-public libvterm-anticomputer
  (package
   (name "libvterm-anticomputer")
   (version "0.1.3")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/anticomputer/libvterm")
           (commit "65dbda3ed214f036ee799d18b2e693a833a0e591")))
     (sha256
      (base32
       "0r6yimzbkgrsi9aaxwvxahai2lzgjd1ysblr6m6by5w459853q3n"))))
   (build-system gnu-build-system)
   (arguments
    `(#:make-flags
      (list "CC=gcc" "CFLAGS=-fPIC"
            (string-append "PREFIX=" (assoc-ref %outputs "out")))
      #:test-target "test"
      #:phases
      (modify-phases %standard-phases
                     (delete 'configure))))
   (native-inputs
    (list libtool perl))
   (home-page "https://github.com/anticomputer/libvterm")
   (synopsis "VT220/xterm/ECMA-48 terminal emulator library")
   (description "Libvterm is an abstract C99 library which implements a VT220
or xterm-like terminal emulator.  It doesn't use any particular graphics
toolkit or output system, instead it invokes callback function pointers that
its embedding program should provide it to draw on its behalf.  It avoids
calling @code{malloc} during normal running state, allowing it to be used in
embedded kernel situations.")
   (license license:expat)))
