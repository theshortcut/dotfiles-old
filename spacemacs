;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in the home directory.

;; Variables

(defconst dotspacemacs-version "1.01"
  "The version of this file.")

(setq-default dotspacemacs-configuration-layer-path '("~/.spacemacs-layers/"))

(setq-default dotspacemacs-configuration-layers '(clayferris))

(defvar dotspacemacs-fullscreen-at-startup t
  "If non nil the frame is maximized when Emacs starts up.")

(defvar dotspacemacs-default-package-repository 'melpa-stable
  "The default package repository used if no explicit repository has been
specified with an installed package."
)

(defvar dotspacemacs-excluded-packages '()
  "A list of packages and/or extensions that will not be install and loaded.")

;; Functions

(defun dotspacemacs/init ()
  "User initialization for Spacemacs. This function is called at the very
 startup."
  (set-frame-font "Input Mono Condensed-16" nil t)
)

(defun dotspacemacs/config ()
  "This is were you can ultimately override default Spacemacs configuration.
This function is called at the very end of Spacemacs initialization."
  (load-theme 'solarized-dark t)
  (setq-default projectile-enable-caching nil)
  (define-key evil-normal-state-map "J" 'evil-join)
)

;; Custom variables

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ispell-requires 4)
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(coffee-tab-width 2)
 '(ring-bell-function (quote ignore) t)
 '(safe-local-variable-values
   (quote
    ((js-indent-level . 2)
     (textmate-gf-exclude . "(/|^)(\\.+[^/]+|fixtures|node_modules|tmp|log|classes|build)($|/)|(\\.xcodeproj|\\.nib|\\.framework|\\.app|\\.pbproj|\\.pbxproj|\\.xcode|\\.xcodeproj|\\.bundle|\\.pyc)(/|$)")
     (textmate-gf-exclude . "(/|^)(\\.+[^/]+|fixtures|tmp|log|classes|build|target)($|/)|(\\.xcodeproj|\\.nib|\\.framework|\\.app|\\.pbproj|\\.pbxproj|\\.xcode|\\.xcodeproj|\\.bundle|\\.pyc)(/|$)")
     (textmate-project-roots ".dir-locals.el")))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 (if (not window-system) '(default ((t (:background "nil"))))))

(defun my-scss-mode-hook ()
  "Hooks for SASS mode."
  (setq-default scss-compile-at-save nil)
  ;; (setq-default scss-output-directory "/dev/shm")
  ;; (flymake-mode-on)
)
(add-hook 'scss-mode-hook 'my-scss-mode-hook)
