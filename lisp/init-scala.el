(require-package 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;;(require-package 'sbt-mode)
;;(defun compile-sbt-project ()
;;  "Compile the sbt project."
;;  (sbt-command "test:compile")
;;  )
;;(add-hook 'scala-mode-hook
;;          (lambda ()
;;            (add-hook 'after-save-hook 'compile-sbt-project)))

(provide 'init-scala)

