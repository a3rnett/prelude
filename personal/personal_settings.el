(server-start)

(prelude-require-packages '(groovy-mode
                            gradle-mode))

(setq auto-mode-alist (cons '("\\.gradle$" . groovy-mode) auto-mode-alist))

(setq org-startup-indented t)
(setq visual-line-mode t)

(setq epa-file-select-keys nil)
;; Cache the passphrase
(setq epa-file-cache-passphrase-for-symmetric-encryption t)
;; Don't use GPG Agent (& don't ask)
(setenv "GPG_AGENT_INFO" nil)

(setq-default tab-width 2)
(setq-default c-basic-offset 2)

;;(setq-default cursor-type 'bar)
(setq visible-bell 1)

(require 'org-passwords)
(setq org-passwords-file (concat org-directory "/" local-realm "/password.org.gpg"))
(setq org-passwords-random-words-dictionary "~/.emacs.d/personal/resources/words")

(eval-after-load "org-passwords"
  '(progn
     (define-key org-passwords-mode-map
       (kbd "C-c u")
       'org-passwords-copy-username)
     (define-key org-passwords-mode-map
       (kbd "C-c p")
       'org-passwords-copy-password)
     (define-key org-passwords-mode-map
       (kbd "C-c o")
       'org-passwords-open-url)))

(setq enable-recursive-minibuffers t)

(setq org-todo-keywords
      '((sequence "TODO(t)" "IN PROGRESS(p@/!)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))

;;(setq prelude-default-c-basic-offset 2)
;; (defun override-prelude-c-mode-hook ()
;;   (setq c-basic-offset 2))
;; (add-hook 'c-mode-hook 'override-prelude-c-mode-hook)

(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates
      '(("t" "Todo" entry (file+datetree (concat org-directory "/" local-realm "/journal.org.gpg"))
             "* TODO %?\n  %i\n")
        ("j" "Journal" entry (file+datetree (concat org-directory "/" local-realm "/journal.org.gpg"))
             "* %?\nEntered on %U\n  %i\n")
        ("d" "Diary" entry (file+datetree (concat org-directory "/" local-realm "/journal.org.gpg"))
         "* Diary\n** Theme of the day%?\n** Reflections\n** Favorites\n** Next Up\nEntered on %U\n  %i\n")
        ("p" "password" entry (file (concat org-directory "/" local-realm "/password.org.gpg"))
         "* %^{Title}\n  %^{URL}p %^{USERNAME}p %^{PASSWORD}p")
        ("at" "Todo" entry (file+datetree (concat org-directory "/" alternate-realm "/journal.org.gpg"))
         "* TODO %?\n  %i\n")
        ("aj" "Journal" entry (file+datetree (concat org-directory "/" alternate-realm "/journal.org.gpg"))
         "* %?\nEntered on %U\n  %i\n")
        ("ap" "password" entry (file (concat org-directory "/" alternate-realm "/password.org.gpg"))
         "* %^{Title}\n  %^{URL}p %^{USERNAME}p %^{PASSWORD}p")
        ))

(setq company-dabbrev-downcase nil)

(require 'cookie1)
(defun oblique-prompt () "Get an Oblique Prompt."  (interactive)
       (insert (cookie "~/.emacs.d/personal/resources/oblique-prompts.txt" "" "")))
(defun journal-prompt () "Get a Journal Prompt."  (interactive)
       (insert (cookie "~/.emacs.d/personal/resources/journal-prompts.txt" "" "")))
