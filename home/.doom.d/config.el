;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(let ((default-directory "~/.doom.d/"))
  (setq private-config-file
        (expand-file-name "private.el.gpg"))
  (epa-decrypt-file private-config-file "private.el")
  (load-file "private.el")
  (delete-file "private.el"))

(setq user-full-name my/username)
(setq user-mail-address my/user-mail-address)
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;;(setq user-full-name "Felix Koch"
;;      user-mail-address "Felix1Koch@gmail.com")

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq doom-font (font-spec :family "3270Medium Nerd Font Mono" :size 18)
      doom-variable-pitch-font (font-spec :family "3270Medium Nerd Font Mono" :size 18)
      )

(setq doom-theme 'doom-outrun-electric)

;;(load-theme 'tron-legacy t)

(custom-set-faces
  '(default ((t (:background "#0a0f14")))))

;; (custom-set-faces!
;;   '(doom-modeline-buffer-modified :foreground "blue"))

(setq doom-neotree-enable-variable-pitch nil)

(nyan-mode +1)

(setq racer-rust-src-path "~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src")

(setq org-agenda-files (quote ("~/org/brain/todo.org")))

(setq org-roam-directory "/tmp/brain")
(require 'company-org-roam)
(use-package company-org-roam
  :when (featurep! :completion company)
  :after org-roam
  :config
  (set-company-backend! 'org-mode '(company-org-roam company-yasnippet company-dabbrev)))

(setq org-capture-templates
      '(("r" "reply" entry (file+headline "~/org/brain/todo.org" "Mails to reply to")
         "* TODO [#A] %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n%a\n")))

(use-package highlight-indent-guides
  :hook (prog-mode . highlight-indent-guides-mode))

(after! highlight-indent-guides
  (setq highlight-indent-guides-method 'character))


(after! highlight-indent-guides
  (setq highlight-indent-guides-responsive t))

(after! highlight-indent-guides
  (setq highlight-indent-guides-character ?\┆))

(after! highlight-indent-guides
  (setq highlight-indent-guides-auto-enabled 'top)
  (set-face-attribute 'highlight-indent-guides-odd-face nil :inherit 'highlight-indentation-odd-face)
  (set-face-attribute 'highlight-indent-guides-even-face nil :inherit 'highlight-indentation-even-face)
  (set-face-foreground 'highlight-indent-guides-character-face (doom-color 'base5)))

(setq doom-scratch-buffer-major-mode t)

(after! mu4e
  (setq mu4e-use-fancy-chars t)
  (setq mu4e-headers-has-child-prefix '("+" . "◼")
        mu4e-headers-empty-parent-prefix '("-" ."◽")
        mu4e-headers-first-child-prefix '("\\" . "↳")
        mu4e-headers-duplicate-prefix '("=" . "⚌")
        mu4e-headers-default-prefix '("|" . "┃")
        mu4e-headers-draft-mark '("D" . "📝 ")
        mu4e-headers-flagged-mark '("F" . "🏴 ")
        mu4e-headers-new-mark '("N" . "★ ")
        mu4e-headers-passed-mark '("P" . "→ ")
        mu4e-headers-replied-mark '("R" . "← ")
        mu4e-headers-seen-mark '("S" . "✓ ")
        mu4e-headers-trashed-mark '("T" . "✗ ")
        mu4e-headers-attach-mark '("a" . "📎 ")
        mu4e-headers-encrypted-mark '("x" . "🔐 ")
        mu4e-headers-signed-mark '("s" . "🔏 ")
        mu4e-headers-unread-mark '("u" . "✉ ")))

(setq hs-special-modes-alist
      (append
           '((prog-mode "{{{" "}}}" "\"")
             (yaml-mode "\\s-*\\_<\\(?:[^:]+\\)\\_>"
                        ""
                        "#"
                        +hideshow-forward-block-by-indent nil)
             (ruby-mode "class\\|d\\(?:ef\\|o\\)\\|module\\|[[{]"
                        "end\\|[]}]"
                        "#\\|=begin"
                        ruby-forward-sexp)
             (enh-ruby-mode "class\\|d\\(?:ef\\|o\\)\\|module\\|[[{]"
                            "end\\|[]}]"
                            "#\\|=begin"
                            enh-ruby-forward-sexp nil))
           hs-special-modes-alist
           '((t))))

(setq +doom-dashboard-banner-file (expand-file-name "banners/doom.png" doom-private-dir))

(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-github t)
