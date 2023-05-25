;;; doom-spaceduck-theme.el --- inspired by gko's plain theme for VSCode -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: February 4, 2021 (#558)
;; Author: das-s <https://github.com/das-s>
;; Maintaner:ateEmailce: https://github.com/gko/plain/
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-spaceduck-theme nil
  "Options for the `doom-spaceduck' theme."
  :group 'doom-themes)

(defcustom doom-plain-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-spaceduck-theme
  :type 'boolean)

(defcustom doom-plain-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-spaceduck-theme
  :type '(or integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-spaceduck
  "Theme inspired by gko's plain dark."

  ;; name        default   256       16
  ((bg         '("#0f111b" nil       nil ))
   (bg-alt     (doom-lighten bg 0.05))
   (base0      '("#818596" nil nil ))
   (base1      '("#000000" nil nil ))
   (base2      '("#000000" nil nil ))
   (base3      '("#000000" nil nil ))
   (base4      '("#000000" nil nil ))
   (base5      '("#000000" nil nil ))
   (base6      '("#000000" nil nil ))
   (base7      '("#c1c3cc" nil nil ))
   (base8      '("#1b1c36" nil nil ))
   (fg         '("#ecf0c1" nil nil ))
   (fg-alt     '("#ecf0c1" nil nil ))
   (selection     '("#1b1c36" nil nil ))

   (grey       fg)
   (red        '("#e33400" nil "red"          ))
   (orange     '("#e39400" nil "brightred"    ))
   (green      '("#5ccc96" nil "green"        ))
   (yellow     '("#f2ce00" nil "yellow"       ))
   (magenta    '("#ce6f8f" nil "magenta"      ))
   (dark-purple    '("#30365F" nil "purple"      ))
   (purple       '("#b3a1e6" nil "purple"   ))
   (purple2       '("#7a5ccc" nil "purple"   ))
   (cyan       '("#00a3cc" nil "brightcyan"   ))
   (selection '("#1b1c36" nil "grey"))


   ;; TODO
   (blue       cyan)
   (dark-blue  (doom-darken cyan 0.1))
   (violet   purple2)
   (dark-cyan     '("#bd93f9" "#bb99ff" "brightmagenta"))
   (teal green)

   ;; face categories -- required for all themes
   (highlight      cyan)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      selection)
   (builtin        green)
   (comments       purple2)
   (doc-comments   purple)
   (constants      yellow)
   (functions      green)
   (keywords       purple)
   (methods        magenta)
   (operators      purple2)
   (type           magenta)
   (strings        yellow)
   (variables      cyan)
   (numbers        purple2)
   (region         `(,(car base3) ,@(cdr base1)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-plain-brighter-modeline)
   (-modeline-pad
    (when doom-plain-padded-modeline
      (if (integerp doom-plain-padded-modeline) doom-plain-padded-modeline 4)))

   (modeline-bg
    (if -modeline-bright
        (doom-darken fg 0.475)
      `(,(doom-darken (car bg-alt) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken blue 0.45)
      `(,(doom-darken (car bg-alt) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   (doom-darken bg-alt 0.25))
   (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1)))
   (modeline-fg     nil)
   (modeline-fg-alt (doom-lighten modeline-bg-inactive 0.3)))


  ;;;; Base theme face overrides
  (((font-lock-constant-face &override)      :slant 'italic)
   ((font-lock-comment-face &override)       :slant 'italic)
   ((font-lock-function-name-face &override) :slant 'italic)
   ((font-lock-type-face &override)          :slant 'italic)
   (hl-line :background base8)
   ((line-number &override) :foreground base3)
   ((line-number-current-line &override) :foreground base2)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if -modeline-bright base8 highlight))
   ;;;; doom-modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground purple2)
   (css-property             :foreground purple2)
   (css-selector             :foreground green)
   ;;;; js2-mode
   (js2-external-variable :foreground purple2)
   (js2-function-param :foreground yellow)
   (js2-jsdoc-html-tag-delimiter :foreground yellow)
   (js2-jsdoc-html-tag-name :foreground dark-blue)
   (js2-jsdoc-value :foreground yellow)
   (js2-private-function-call :foreground yellow)
   (js2-private-member :foreground base7)
   ;;;; rjsx-mode
   (rjsx-tag :foreground orange)
   (rjsx-attr :foreground green :slant 'italic :weight 'medium)
   ;;;; lsp-mode
   (lsp-headerline-breadcrumb-symbols-face :foreground keywords :weight 'bold)
   ;;;; outline <built-in>
   (outline-1 :slant 'italic :foreground fg-alt)
   (outline-2 :inherit 'outline-1 :foreground base2)
   (outline-3 :inherit 'outline-2)
   (outline-4 :inherit 'outline-3)
   (outline-5 :inherit 'outline-4)
   (outline-6 :inherit 'outline-5)
   (outline-7 :inherit 'outline-6)
   (outline-8 :inherit 'outline-7)
   ;;;; org <built-in>
   (org-block-begin-line :foreground base2 :background base3)
   (org-block-end-line :foreground base2 :background base3)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))))

;;; doom-spaceduck-theme.el ends here
