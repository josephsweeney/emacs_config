;; Path stuff
(getenv "PATH")
 (setenv "PATH"
(concat
 "/Library/TeX/texbin/:/usr/local/bin/" ":"

 (getenv "PATH")))

;; Packages
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(markdown-enable-math t)
 '(ns-pop-up-frames t)
 '(ns-use-fullscreen-animation t)
 '(package-selected-packages
   (quote
    (org-edna dash-at-point jsx-mode fzf sml-mode glsl-mode auto-complete php-mode pandoc-mode gitignore-mode use-package smooth-scroll go-mode exec-path-from-shell latex-preview-pane drag-stuff magit markdown-mode auctex ivy evil)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2e3436" :foreground "#eeeeec" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Monaco")))))

 ;; Evil mode for when you wanna use vim
(require 'evil)
(evil-mode 1)
(setq evil-default-state 'emacs
      evil-insert-state-modes nil
      evil-motion-state-modes nil)

 ;; Ivy mode for convenient search of commands and files
(ivy-mode 1)

;; AUCTeX stuff
;(setq TeX-auto-save t)
;(setq TeX-parse-self t)
;(setq TeX-save-query nil)
;(setq TeX-PDF-mode t)


(setq redisplay-dont-pause t)


;; Backup file settings
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; to move lines
(drag-stuff-global-mode 1)
(drag-stuff-define-keys)

;; Add line numbers
;; (setq linum-mode t)


(use-package smooth-scroll
  :config
  ;; (smooth-scroll-mode 1)
  (setq smooth-scroll/vscroll-step-size 5)
  )




;; C switch statement indentation
(c-set-offset 'case-label '+)


;; Dash
(add-to-list 'load-path "/path/to/dash-at-point")
(autoload 'dash-at-point "dash-at-point"
          "Search the word at point with Dash." t nil)
(global-set-key "\C-cd" 'dash-at-point)


;; flyspell click
(eval-after-load "flyspell"
    '(progn
       (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
       (define-key flyspell-mouse-map [mouse-3] #'undefined)))

(setq ring-bell-function
      (lambda ()
        (let ((orig-fg (face-foreground 'mode-line)))
          (set-face-foreground 'mode-line "#F2804F")
          (run-with-idle-timer 0.1 nil
                               (lambda (fg) (set-face-foreground 'mode-line fg))
                               orig-fg))))

(add-to-list 'default-frame-alist '(height . 52))
(add-to-list 'default-frame-alist '(width . 164))
