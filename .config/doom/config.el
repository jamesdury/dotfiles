;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "jamesdury"
      user-mail-address "97810962+jamesdury@users.noreply.github.com")

(setq doom-theme 'doom-dracula)
;;      doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 14 :weight 'light)
;;      doom-variable-pitch-font (font-spec :family "DejaVu Sans" :size 13))

(setq display-line-numbers-type t)
;; show 80 char column
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; recurse through org folder
(load-library "find-lisp")
(setq org-agenda-files
   (find-lisp-find-files "~/org" "\.org$"))

(setq org-log-done 'time)

;; hide the filename in the org-agenda view
(require 'org-agenda)
(setq org-agenda-prefix-format '(
  ;; (agenda  . " %i %-12:c%?-12t% s") ;; file name + org-agenda-entry-type
  ;; (agenda  . "  • ")
  (agenda  . "  - ")
  (timeline  . "  % s")
  (todo  . " %i %-12:c")
  (tags  . " %i %-12:c")
  (search . " %i %-12:c")))

(require 'disable-mouse)
(global-disable-mouse-mode)
(mapc #'disable-mouse-in-keymap
  (list evil-motion-state-map
        evil-normal-state-map
        evil-visual-state-map
        evil-insert-state-map))

;; Adding the time to each roam dailies entry
(setq org-roam-dailies-capture-templates
      '(("d" "default" entry "* %<%I:%M %p>\n%?"
         :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))))

;;; :editor evil
;; Focus new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;; Hide the menu for as minimalistic a startup screen as possible.
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

(setq lsp-enable-links nil)

(with-eval-after-load 'evil
    (defalias #'forward-evil-word #'forward-evil-symbol)
    ;; make evil-search-word look for symbol rather than word boundaries
    ;; for working with snake_case words
    (setq-default evil-symbol-word-search t))


(add-hook 'typescript-mode-hook 'deno-fmt-mode)
(add-hook 'js2-mode-hook 'deno-fmt-mode)


(use-package! terraform-mode
  :hook
  (terraform-mode . terraform-format-on-save-mode)
  (terraform-mode . lsp)
  :custom
  (terraform-indent-level 4))

;;; :editor evil
;; Focus new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;; Line numbers are pretty slow all around. The performance boost of disabling
;; them outweighs the utility of always keeping them on.
(setq display-line-numbers-type nil)

(add-hook 'sql-mode-hook 'lsp)
(setq lsp-sqls-workspace-config-path nil)

(setf (alist-get 'unpushed magit-section-initial-visibility-alist) 'show)
(setq magit-log-section-commit-count 50)
