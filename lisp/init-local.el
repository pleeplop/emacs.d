(require-package 'flycheck-haskell)
(require-package 'ghci-completion)

(require-package 'shm)
;;;(add-hook 'haskell-mode-hook 'structured-haskell-mode)

;;; GHCi-ng
(setq haskell-process-args-cabal-repl
      '("--ghc-option=-ferror-spans" "--with-ghc=ghci-ng"))
(setq haskell-process-path-ghci "ghci-ng")

(custom-set-variables
 '(haskell-tags-on-save t)
;;; '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-suggest-hoogle-imports t)
 '(flycheck-haskell-ghc-executable "cabal repl")
 '(inferior-haskell-wait-and-jump t)
 '(haskell-process-type 'cabal-repl))

(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)
;;;(add-hook 'haskell-mode-hook
;;;          (lambda () (define-key haskell-mode-map (kbd "M-.") 'haskell-mode-jump-to-def-or-tag)))
;;;(speedbar-add-supported-extension ".hs")
;;;(require 'w3m-haddock)
;;;(add-hook 'w3m-display-hook 'w3m-haddock-display)

(require-package 'ghc)
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(require-package 'company-ghc)
(require 'company)
(add-hook 'haskell-mode-hook 'company-mode)
(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))

;; (setq inferior-lisp-program "/usr/local/Cellar/clisp/2.49/bin/clisp")

(when (maybe-require-package 'skewer-mode)
  (after-load 'skewer-mode
    (add-hook 'css-mode-hook 'skewer-css-mode)
    (add-hook 'html-mode-hook 'skewer-html-mode)))

;; js-comint interpreter
(setenv "NODE_NO_READLINE" "1")

(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

;; (after-load 'js2-mode
;;   (add-hook 'js2-mode-hook 'ac-js2-mode))

(require-package 'nix-mode)
(require 'nix-mode)

(provide 'init-local)
