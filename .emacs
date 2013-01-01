(global-set-key "\C-l" `goto-line)
(global-set-key "\C-q" `beginning-of-line)

;; Paren experiment
(setq skeleton-pair t)
(defvar my-skeleton-pair-alist
  '((?\) . ?\()
    (?\] . ?\[)
    (?} . ?{)
    (?' . ?')
    (?" . ?")))

(defun my-skeleton-pair-end (arg)
  "Skip the char if it is an ending, otherwise insert it."
  (interactive "*p")
  (let ((char last-command-char))
    (if (and (assq char my-skeleton-pair-alist)
             (eq char (following-char)))
        (forward-char)
      (self-insert-command (prefix-numeric-value arg)))))

(dolist (pair my-skeleton-pair-alist)
  (global-set-key (char-to-string (car pair)) 'my-skeleton-pair-end)
  ;; If the char for begin and end is the same, use the original skeleton
  (global-set-key (char-to-string (cdr pair)) 'skeleton-pair-insert-maybe))

(defadvice backward-delete-char-untabify (before my-skeleton-backspace activate)
  "When deleting the beginning of a pair, and the ending is next char, delete it too."
  (let ((pair (assq (following-char) my-skeleton-pair-alist)))
    (and pair
         (eq (preceding-char) (cdr pair))
         (delete-char 1))))

;;; bind RET to py-newline-and-indent
(add-hook 'python-mode-hook '(lambda () 
     (define-key python-mode-map "\C-m" 'newline-and-indent)))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default py-indent-offset 4)
