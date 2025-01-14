(require-package 'tuareg)
(require-package 'utop)

(add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
(setq auto-mode-alist
      (append '(("\\.ml[ily]?$" . tuareg-mode)
                ("\\.topml$" . tuareg-mode))
              auto-mode-alist))
(autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
(add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)
(setq merlin-use-auto-complete-mode t)
(setq merlin-error-after-save nil)

;; -- merlin setup ---------------------------------------
(require-package 'merlin)

(setq opam-share (substring (shell-command-to-string "opam config var share") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))

;; Enable Merlin for ML buffers
(add-hook 'tuareg-mode-hook 'merlin-mode)

;; So you can do it on a mac, where `C-<up>` and `C-<down>` are used
;; by spaces.
;;(define-key merlin-mode-map
;;  (kbd "C-c <up>") 'merlin-type-enclosing-go-up)
;;(define-key merlin-mode-map
;;  (kbd "C-c <down>") 'merlin-type-enclosing-go-down)
;;(set-face-background 'merlin-type-face "#88FF44")

;; -- enable auto-complete -------------------------------
;; Not required, but useful along with merlin-mode
(require-package 'auto-complete)
(add-hook 'tuareg-mode-hook 'auto-complete-mode)


;; ocp-indent
(setq opam-share (substring (shell-command-to-string "opam config var share") 0 -1))
;;(load-file (concat opam-share "/typerex/ocp-indent/ocp-indent.el"))
(require-package 'ocp-indent)

(provide 'init-ocaml)
