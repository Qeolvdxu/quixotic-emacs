;;; quixotic-theme.el --- UNOFFICAL Quixotic Theme

;; Official Quixotic URL: https://github.com/QuixoticCS

;; A dark neon color theme available for a number of editors.

;; Code licensed under the GPL license

;; Maintainer: Hayden Estes
;; Version: 0.1
;; Package-Requires: ((emacs "24.3"))

;;; Code:
(deftheme quixotic)


;;;; Configuration options:

(defgroup quixotic nil
  "Quixotic theme options.

The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom quixotic-enlarge-headings t
  "Use different font sizes for some headings and titles."
  :type 'boolean
  :group 'quixotic)

(defcustom quixotic-height-title-1 1.3
  "Font size 100%."
  :type 'number
  :group 'quixotic)

(defcustom quixotic-height-title-2 1.1
  "Font size 110%."
  :type 'number
  :group 'quixotic)

(defcustom quixotic-height-title-3 1.0
  "Font size 130%."
  :type 'number
  :group 'quixotic)

(defcustom quixotic-height-doc-title 1.44
  "Font size 144%."
  :type 'number
  :group 'quixotic)

(defcustom quixotic-alternate-mode-line-and-minibuffer nil
  "Use less bold and pink in the minibuffer."
  :type 'boolean
  :group 'quixotic)

(defvar quixotic-use-24-bit-colors-on-256-colors-terms nil
  "Use true colors even on terminals announcing less capabilities.

Beware the use of this variable.  Using it may lead to unwanted
behavior, the most common one being an ugly blue background on
terminals, which don't understand 24 bit colors.  To avoid this
blue background, when using this variable, one can try to add the
following lines in their config file after having load the
Quixotic theme:

    (unless (display-graphic-p)
      (set-face-background 'default \"black\" nil))

There is a lot of discussion behind the 256 colors theme (see URL
`https://github.com/quixotic/emacs/pull/57').  Please take time to
read it before opening a new issue about your will.")


;;;; Theme definition:

;; Assigment form: VARIABLE COLOR [256-COLOR [TTY-COLOR]]
(let ((colors '(;; Upstream theme color
                (quixotic-bg      "#101313" "unspecified-bg" "unspecified-bg") ; official background
                (quixotic-fg      "#d7d7d7" "#ffffff" "brightwhite") ; official foreground
                (quixotic-current "#2E1A47" "#303030" "brightblack") ; official current-line/selection
                (quixotic-comment "#008ce3" "#5f5faf" "blue")        ; official comment
                (quixotic-cyan    "#3dddd8" "#87d7ff" "brightcyan")  ; official cyan
                (quixotic-green   "#2ac68e" "#5fff87" "green")       ; official green
                (quixotic-orange  "#ffaf5f" "#ffaf5f" "brightred")   ; official orange
                (quixotic-pink    "#ff87d7" "#ff87d7" "magenta")     ; official pink
                (quixotic-purple  "#a07dde" "#af87ff" "brightmagenta") ; official purple
                (quixotic-red     "#f85858" "#ff8787" "red")         ; official red
                (quixotic-yellow  "#ffff87" "#ffff87" "yellow")      ; official yellow
                ;; Other colors
                (bg2             "#262d2d" "#121212" "brightblack")
                (bg3             "#3b4747" "#262626" "brightblack")
                (bg4             "#516060" "#444444" "brightblack")
                (fg2             "#e3e3e3" "#e4e4e4" "brightwhite")
                (fg3             "#ccccc7" "#c6c6c6" "white")
                (fg4             "#b6b6b2" "#b2b2b2" "white")
                (other-blue      "#0189cc" "#0087ff" "brightblue")))
      (faces '(;; default / basic faces
               (cursor :background ,fg3)
               (default :background ,quixotic-bg :foreground ,quixotic-fg)
               (default-italic :slant italic)
               (error :foreground ,quixotic-red)
               (ffap :foreground ,fg4)
               (fringe :background ,quixotic-bg :foreground ,fg4)
               (header-line :inherit 'mode-line)
               (highlight :foreground ,fg3 :background ,bg3)
               (hl-line :background ,quixotic-current :extend t)
               (info-quoted-name :foreground ,quixotic-orange)
               (info-string :foreground ,quixotic-yellow)
               (lazy-highlight :foreground ,fg2 :background ,bg2)
               (link :foreground ,quixotic-cyan :underline t)
               (linum :slant italic :foreground ,bg4 :background ,quixotic-bg)
               (line-number :slant italic :foreground ,bg4 :background ,quixotic-bg)
               (match :background ,quixotic-yellow :foreground ,quixotic-bg)
               (menu :background ,quixotic-current :inverse-video nil
                     ,@(if quixotic-alternate-mode-line-and-minibuffer
                           (list :foreground fg3)
                         (list :foreground quixotic-fg)))
               (minibuffer-prompt
                ,@(if quixotic-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground quixotic-fg)
                    (list :weight 'bold :foreground quixotic-red)))
               (mode-line :background ,quixotic-current
                          :box ,quixotic-current :inverse-video nil
                          ,@(if quixotic-alternate-mode-line-and-minibuffer
                                (list :foreground fg3)
                              (list :foreground quixotic-fg)))
               (mode-line-inactive
                :background ,quixotic-bg :inverse-video nil
                ,@(if quixotic-alternate-mode-line-and-minibuffer
                      (list :foreground quixotic-comment :box quixotic-bg)
                    (list :foreground fg4 :box bg2)))
               (read-multiple-choice-face :inherit completions-first-difference)
               (region :inherit match :extend t)
               (shadow :foreground ,quixotic-comment)
               (success :foreground ,quixotic-green)
               (tooltip :foreground ,quixotic-fg :background ,quixotic-current)
               (trailing-whitespace :background ,quixotic-orange)
               (vertical-border :foreground ,bg2)
               (warning :foreground ,quixotic-orange)
               ;; syntax / font-lock
               (font-lock-builtin-face :foreground ,quixotic-cyan :slant italic)
               (font-lock-comment-face :inherit shadow)
               (font-lock-comment-delimiter-face :inherit shadow)
               (font-lock-constant-face :foreground ,quixotic-purple)
               (font-lock-doc-face :foreground ,quixotic-comment)
               (font-lock-function-name-face :foreground ,quixotic-green :weight bold)
               (font-lock-keyword-face :foreground ,quixotic-pink :weight bold)
               (font-lock-negation-char-face :foreground ,quixotic-cyan)
               (font-lock-preprocessor-face :foreground ,quixotic-orange)
               (font-lock-reference-face :inherit font-lock-constant-face) ;; obsolete
               (font-lock-regexp-grouping-backslash :foreground ,quixotic-cyan)
               (font-lock-regexp-grouping-construct :foreground ,quixotic-purple)
               (font-lock-string-face :foreground ,quixotic-yellow)
               (font-lock-type-face :inherit font-lock-builtin-face)
               (font-lock-variable-name-face :foreground ,quixotic-fg :weight bold)
               (font-lock-warning-face :inherit warning :background ,bg2)
               ;; auto-complete
               (ac-completion-face :underline t :foreground ,quixotic-pink)
               ;; company
               (company-echo-common :foreground ,quixotic-bg :background ,quixotic-fg)
               (company-preview :background ,quixotic-current :foreground ,other-blue)
               (company-preview-common :inherit company-preview
                                       :foreground ,quixotic-pink)
               (company-preview-search :inherit company-preview
                                       :foreground ,quixotic-green)
               (company-scrollbar-bg :background ,quixotic-comment)
               (company-scrollbar-fg :foreground ,other-blue)
               (company-tooltip :inherit tooltip)
               (company-tooltip-search :foreground ,quixotic-green
                                       :underline t)
               (company-tooltip-search-selection :background ,quixotic-green
                                                 :foreground ,quixotic-bg)
               (company-tooltip-selection :inherit match)
               (company-tooltip-mouse :background ,quixotic-bg)
               (company-tooltip-common :foreground ,quixotic-pink :weight bold)
               ;;(company-tooltip-common-selection :inherit company-tooltip-common)
               (company-tooltip-annotation :foreground ,quixotic-cyan)
               ;;(company-tooltip-annotation-selection :inherit company-tooltip-annotation)
               ;; completions (minibuffer.el)
               (completions-annotations :inherit font-lock-comment-face)
               (completions-common-part :foreground ,quixotic-green)
               (completions-first-difference :foreground ,quixotic-pink :weight bold)
               ;; diff-hl
               (diff-hl-change :foreground ,quixotic-orange :background ,quixotic-orange)
               (diff-hl-delete :foreground ,quixotic-red :background ,quixotic-red)
               (diff-hl-insert :foreground ,quixotic-green :background ,quixotic-green)
               ;; dired
               (dired-directory :foreground ,quixotic-green :weight normal)
               (dired-flagged :foreground ,quixotic-pink)
               (dired-header :foreground ,fg3 :background ,quixotic-bg)
               (dired-ignored :inherit shadow)
               (dired-mark :foreground ,quixotic-fg :weight bold)
               (dired-marked :foreground ,quixotic-orange :weight bold)
               (dired-perm-write :foreground ,fg3 :underline t)
               (dired-symlink :foreground ,quixotic-yellow :weight normal :slant italic)
               (dired-warning :foreground ,quixotic-orange :underline t)
               (diredp-compressed-file-name :foreground ,fg3)
               (diredp-compressed-file-suffix :foreground ,fg4)
               (diredp-date-time :foreground ,quixotic-fg)
               (diredp-deletion-file-name :foreground ,quixotic-pink :background ,quixotic-current)
               (diredp-deletion :foreground ,quixotic-pink :weight bold)
               (diredp-dir-heading :foreground ,fg2 :background ,bg4)
               (diredp-dir-name :inherit dired-directory)
               (diredp-dir-priv :inherit dired-directory)
               (diredp-executable-tag :foreground ,quixotic-orange)
               (diredp-file-name :foreground ,quixotic-fg)
               (diredp-file-suffix :foreground ,fg4)
               (diredp-flag-mark-line :foreground ,fg2 :slant italic :background ,quixotic-current)
               (diredp-flag-mark :foreground ,fg2 :weight bold :background ,quixotic-current)
               (diredp-ignored-file-name :foreground ,quixotic-fg)
               (diredp-mode-line-flagged :foreground ,quixotic-orange)
               (diredp-mode-line-marked :foreground ,quixotic-orange)
               (diredp-no-priv :foreground ,quixotic-fg)
               (diredp-number :foreground ,quixotic-cyan)
               (diredp-other-priv :foreground ,quixotic-orange)
               (diredp-rare-priv :foreground ,quixotic-orange)
               (diredp-read-priv :foreground ,quixotic-purple)
               (diredp-write-priv :foreground ,quixotic-pink)
               (diredp-exec-priv :foreground ,quixotic-yellow)
               (diredp-symlink :foreground ,quixotic-orange)
               (diredp-link-priv :foreground ,quixotic-orange)
               (diredp-autofile-name :foreground ,quixotic-yellow)
               (diredp-tagged-autofile-name :foreground ,quixotic-yellow)
               ;; eldoc-box
               (eldoc-box-border :background ,quixotic-current)
               (eldoc-box-body :background ,quixotic-current)
               ;; elfeed
               (elfeed-search-date-face :foreground ,quixotic-comment)
               (elfeed-search-title-face :foreground ,quixotic-fg)
               (elfeed-search-unread-title-face :foreground ,quixotic-pink :weight bold)
               (elfeed-search-feed-face :foreground ,quixotic-fg :weight bold)
               (elfeed-search-tag-face :foreground ,quixotic-green)
               (elfeed-search-last-update-face :weight bold)
               (elfeed-search-unread-count-face :foreground ,quixotic-pink)
               (elfeed-search-filter-face :foreground ,quixotic-green :weight bold)
               ;;(elfeed-log-date-face :inherit font-lock-type-face)
               (elfeed-log-error-level-face :foreground ,quixotic-red)
               (elfeed-log-warn-level-face :foreground ,quixotic-orange)
               (elfeed-log-info-level-face :foreground ,quixotic-cyan)
               (elfeed-log-debug-level-face :foreground ,quixotic-comment)
               ;; elpher
               (elpher-gemini-heading1 :inherit bold :foreground ,quixotic-pink
                                       ,@(when quixotic-enlarge-headings
                                           (list :height quixotic-height-title-1)))
               (elpher-gemini-heading2 :inherit bold :foreground ,quixotic-purple
                                       ,@(when quixotic-enlarge-headings
                                           (list :height quixotic-height-title-2)))
               (elpher-gemini-heading3 :weight normal :foreground ,quixotic-green
                                       ,@(when quixotic-enlarge-headings
                                           (list :height quixotic-height-title-3)))
               (elpher-gemini-preformatted :inherit fixed-pitch
                                           :foreground ,quixotic-orange)
               ;; enh-ruby
               (enh-ruby-heredoc-delimiter-face :foreground ,quixotic-yellow)
               (enh-ruby-op-face :foreground ,quixotic-pink)
               (enh-ruby-regexp-delimiter-face :foreground ,quixotic-yellow)
               (enh-ruby-string-delimiter-face :foreground ,quixotic-yellow)
               ;; flyspell
               (flyspell-duplicate :underline (:style wave :color ,quixotic-orange))
               (flyspell-incorrect :underline (:style wave :color ,quixotic-red))
               ;; font-latex
               (font-latex-bold-face :foreground ,quixotic-purple)
               (font-latex-italic-face :foreground ,quixotic-pink :slant italic)
               (font-latex-match-reference-keywords :foreground ,quixotic-cyan)
               (font-latex-match-variable-keywords :foreground ,quixotic-fg)
               (font-latex-string-face :foreground ,quixotic-yellow)
               ;; gemini
               (gemini-heading-face-1 :inherit bold :foreground ,quixotic-pink
                                      ,@(when quixotic-enlarge-headings
                                          (list :height quixotic-height-title-1)))
               (gemini-heading-face-2 :inherit bold :foreground ,quixotic-purple
                                      ,@(when quixotic-enlarge-headings
                                          (list :height quixotic-height-title-2)))
               (gemini-heading-face-3 :weight normal :foreground ,quixotic-green
                                      ,@(when quixotic-enlarge-headings
                                          (list :height quixotic-height-title-3)))
               (gemini-heading-face-rest :weight normal :foreground ,quixotic-yellow)
               (gemini-quote-face :foreground ,quixotic-purple)
               ;; go-test
               (go-test--ok-face :inherit success)
               (go-test--error-face :inherit error)
               (go-test--warning-face :inherit warning)
               (go-test--pointer-face :foreground ,quixotic-pink)
               (go-test--standard-face :foreground ,quixotic-cyan)
               ;; gnus-group
               (gnus-group-mail-1 :foreground ,quixotic-pink :weight bold)
               (gnus-group-mail-1-empty :inherit gnus-group-mail-1 :weight normal)
               (gnus-group-mail-2 :foreground ,quixotic-cyan :weight bold)
               (gnus-group-mail-2-empty :inherit gnus-group-mail-2 :weight normal)
               (gnus-group-mail-3 :foreground ,quixotic-comment :weight bold)
               (gnus-group-mail-3-empty :inherit gnus-group-mail-3 :weight normal)
               (gnus-group-mail-low :foreground ,quixotic-current :weight bold)
               (gnus-group-mail-low-empty :inherit gnus-group-mail-low :weight normal)
               (gnus-group-news-1 :foreground ,quixotic-pink :weight bold)
               (gnus-group-news-1-empty :inherit gnus-group-news-1 :weight normal)
               (gnus-group-news-2 :foreground ,quixotic-cyan :weight bold)
               (gnus-group-news-2-empty :inherit gnus-group-news-2 :weight normal)
               (gnus-group-news-3 :foreground ,quixotic-comment :weight bold)
               (gnus-group-news-3-empty :inherit gnus-group-news-3 :weight normal)
               (gnus-group-news-4 :inherit gnus-group-news-low)
               (gnus-group-news-4-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-5 :inherit gnus-group-news-low)
               (gnus-group-news-5-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-6 :inherit gnus-group-news-low)
               (gnus-group-news-6-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-low :foreground ,quixotic-current :weight bold)
               (gnus-group-news-low-empty :inherit gnus-group-news-low :weight normal)
               (gnus-header-content :foreground ,quixotic-purple)
               (gnus-header-from :foreground ,quixotic-fg)
               (gnus-header-name :foreground ,quixotic-green)
               (gnus-header-subject :foreground ,quixotic-pink :weight bold)
               (gnus-summary-markup-face :foreground ,quixotic-cyan)
               (gnus-summary-high-unread :foreground ,quixotic-pink :weight bold)
               (gnus-summary-high-read :inherit gnus-summary-high-unread :weight normal)
               (gnus-summary-high-ancient :inherit gnus-summary-high-read)
               (gnus-summary-high-ticked :inherit gnus-summary-high-read :underline t)
               (gnus-summary-normal-unread :foreground ,other-blue :weight bold)
               (gnus-summary-normal-read :foreground ,quixotic-comment :weight normal)
               (gnus-summary-normal-ancient :inherit gnus-summary-normal-read :weight light)
               (gnus-summary-normal-ticked :foreground ,quixotic-pink :weight bold)
               (gnus-summary-low-unread :foreground ,quixotic-comment :weight bold)
               (gnus-summary-low-read :inherit gnus-summary-low-unread :weight normal)
               (gnus-summary-low-ancient :inherit gnus-summary-low-read)
               (gnus-summary-low-ticked :inherit gnus-summary-low-read :underline t)
               (gnus-summary-selected :inverse-video t)
               ;; haskell-mode
               (haskell-operator-face :foreground ,quixotic-pink)
               (haskell-constructor-face :foreground ,quixotic-purple)
               ;; helm
               (helm-bookmark-w3m :foreground ,quixotic-purple)
               (helm-buffer-not-saved :foreground ,quixotic-purple :background ,quixotic-bg)
               (helm-buffer-process :foreground ,quixotic-orange :background ,quixotic-bg)
               (helm-buffer-saved-out :foreground ,quixotic-fg :background ,quixotic-bg)
               (helm-buffer-size :foreground ,quixotic-fg :background ,quixotic-bg)
               (helm-candidate-number :foreground ,quixotic-bg :background ,quixotic-fg)
               (helm-ff-directory :foreground ,quixotic-green :background ,quixotic-bg :weight bold)
               (helm-ff-dotted-directory :foreground ,quixotic-green :background ,quixotic-bg :weight normal)
               (helm-ff-executable :foreground ,other-blue :background ,quixotic-bg :weight normal)
               (helm-ff-file :foreground ,quixotic-fg :background ,quixotic-bg :weight normal)
               (helm-ff-invalid-symlink :foreground ,quixotic-pink :background ,quixotic-bg :weight bold)
               (helm-ff-prefix :foreground ,quixotic-bg :background ,quixotic-pink :weight normal)
               (helm-ff-symlink :foreground ,quixotic-pink :background ,quixotic-bg :weight bold)
               (helm-grep-cmd-line :foreground ,quixotic-fg :background ,quixotic-bg)
               (helm-grep-file :foreground ,quixotic-fg :background ,quixotic-bg)
               (helm-grep-finish :foreground ,fg2 :background ,quixotic-bg)
               (helm-grep-lineno :foreground ,quixotic-fg :background ,quixotic-bg)
               (helm-grep-match :inherit match)
               (helm-grep-running :foreground ,quixotic-green :background ,quixotic-bg)
               (helm-header :foreground ,fg2 :background ,quixotic-bg :underline nil :box nil)
               (helm-moccur-buffer :foreground ,quixotic-green :background ,quixotic-bg)
               (helm-selection :background ,bg2 :underline nil)
               (helm-selection-line :background ,bg2)
               (helm-separator :foreground ,quixotic-purple :background ,quixotic-bg)
               (helm-source-go-package-godoc-description :foreground ,quixotic-yellow)
               (helm-source-header :foreground ,quixotic-pink :background ,quixotic-bg :underline nil :weight bold)
               (helm-time-zone-current :foreground ,quixotic-orange :background ,quixotic-bg)
               (helm-time-zone-home :foreground ,quixotic-purple :background ,quixotic-bg)
               (helm-visible-mark :foreground ,quixotic-bg :background ,bg3)
               ;; highlight-indentation minor mode
               (highlight-indentation-face :background ,bg2)
               ;; icicle
               (icicle-whitespace-highlight :background ,quixotic-fg)
               (icicle-special-candidate :foreground ,fg2)
               (icicle-extra-candidate :foreground ,fg2)
               (icicle-search-main-regexp-others :foreground ,quixotic-fg)
               (icicle-search-current-input :foreground ,quixotic-pink)
               (icicle-search-context-level-8 :foreground ,quixotic-orange)
               (icicle-search-context-level-7 :foreground ,quixotic-orange)
               (icicle-search-context-level-6 :foreground ,quixotic-orange)
               (icicle-search-context-level-5 :foreground ,quixotic-orange)
               (icicle-search-context-level-4 :foreground ,quixotic-orange)
               (icicle-search-context-level-3 :foreground ,quixotic-orange)
               (icicle-search-context-level-2 :foreground ,quixotic-orange)
               (icicle-search-context-level-1 :foreground ,quixotic-orange)
               (icicle-search-main-regexp-current :foreground ,quixotic-fg)
               (icicle-saved-candidate :foreground ,quixotic-fg)
               (icicle-proxy-candidate :foreground ,quixotic-fg)
               (icicle-mustmatch-completion :foreground ,quixotic-purple)
               (icicle-multi-command-completion :foreground ,fg2 :background ,bg2)
               (icicle-msg-emphasis :foreground ,quixotic-green)
               (icicle-mode-line-help :foreground ,fg4)
               (icicle-match-highlight-minibuffer :foreground ,quixotic-orange)
               (icicle-match-highlight-Completions :foreground ,quixotic-green)
               (icicle-key-complete-menu-local :foreground ,quixotic-fg)
               (icicle-key-complete-menu :foreground ,quixotic-fg)
               (icicle-input-completion-fail-lax :foreground ,quixotic-pink)
               (icicle-input-completion-fail :foreground ,quixotic-pink)
               (icicle-historical-candidate-other :foreground ,quixotic-fg)
               (icicle-historical-candidate :foreground ,quixotic-fg)
               (icicle-current-candidate-highlight :foreground ,quixotic-orange :background ,bg3)
               (icicle-Completions-instruction-2 :foreground ,fg4)
               (icicle-Completions-instruction-1 :foreground ,fg4)
               (icicle-completion :foreground ,quixotic-fg)
               (icicle-complete-input :foreground ,quixotic-orange)
               (icicle-common-match-highlight-Completions :foreground ,quixotic-purple)
               (icicle-candidate-part :foreground ,quixotic-fg)
               (icicle-annotation :foreground ,fg4)
               ;; icomplete
               (icompletep-determined :foreground ,quixotic-orange)
               ;; ido
               (ido-first-match
                ,@(if quixotic-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground quixotic-green)
                    (list :weight 'bold :foreground quixotic-pink)))
               (ido-only-match :foreground ,quixotic-orange)
               (ido-subdir :foreground ,quixotic-yellow)
               (ido-virtual :foreground ,quixotic-cyan)
               (ido-incomplete-regexp :inherit font-lock-warning-face)
               (ido-indicator :foreground ,quixotic-fg :background ,quixotic-pink)
               ;; ivy
               (ivy-current-match
                ,@(if quixotic-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :background quixotic-current :foreground quixotic-green)
                    (list :weight 'bold :background quixotic-current :foreground quixotic-pink)))
               ;; Highlights the background of the match.
               (ivy-minibuffer-match-face-1 :background ,quixotic-current)
               ;; Highlights the first matched group.
               (ivy-minibuffer-match-face-2 :background ,quixotic-green
                                            :foreground ,quixotic-bg)
               ;; Highlights the second matched group.
               (ivy-minibuffer-match-face-3 :background ,quixotic-yellow
                                            :foreground ,quixotic-bg)
               ;; Highlights the third matched group.
               (ivy-minibuffer-match-face-4 :background ,quixotic-pink
                                            :foreground ,quixotic-bg)
               (ivy-confirm-face :foreground ,quixotic-orange)
               (ivy-match-required-face :foreground ,quixotic-red)
               (ivy-subdir :foreground ,quixotic-yellow)
               (ivy-remote :foreground ,quixotic-pink)
               (ivy-virtual :foreground ,quixotic-cyan)
               ;; isearch
               (isearch :inherit match :weight bold)
               (isearch-fail :foreground ,quixotic-bg :background ,quixotic-orange)
               ;; jde-java
               (jde-java-font-lock-constant-face :foreground ,quixotic-cyan)
               (jde-java-font-lock-modifier-face :foreground ,quixotic-pink)
               (jde-java-font-lock-number-face :foreground ,quixotic-fg)
               (jde-java-font-lock-package-face :foreground ,quixotic-fg)
               (jde-java-font-lock-private-face :foreground ,quixotic-pink)
               (jde-java-font-lock-public-face :foreground ,quixotic-pink)
               ;; js2-mode
               (js2-external-variable :foreground ,quixotic-purple)
               (js2-function-param :foreground ,quixotic-cyan)
               (js2-jsdoc-html-tag-delimiter :foreground ,quixotic-yellow)
               (js2-jsdoc-html-tag-name :foreground ,other-blue)
               (js2-jsdoc-value :foreground ,quixotic-yellow)
               (js2-private-function-call :foreground ,quixotic-cyan)
               (js2-private-member :foreground ,fg3)
               ;; js3-mode
               (js3-error-face :underline ,quixotic-orange)
               (js3-external-variable-face :foreground ,quixotic-fg)
               (js3-function-param-face :foreground ,quixotic-pink)
               (js3-instance-member-face :foreground ,quixotic-cyan)
               (js3-jsdoc-tag-face :foreground ,quixotic-pink)
               (js3-warning-face :underline ,quixotic-pink)
               ;; lsp
               (lsp-ui-peek-peek :background ,quixotic-bg)
               (lsp-ui-peek-list :background ,bg2)
               (lsp-ui-peek-filename :foreground ,quixotic-pink :weight bold)
               (lsp-ui-peek-line-number :foreground ,quixotic-fg)
               (lsp-ui-peek-highlight :inherit highlight :distant-foreground ,quixotic-bg)
               (lsp-ui-peek-header :background ,bg3 :foreground ,fg3, :weight bold)
               (lsp-ui-peek-footer :inherit lsp-ui-peek-header)
               (lsp-ui-peek-selection :inherit match)
               (lsp-ui-sideline-symbol :foreground ,fg4 :box (:line-width -1 :color ,fg4) :height 0.99)
               (lsp-ui-sideline-current-symbol :foreground ,quixotic-fg :weight ultra-bold
                                               :box (:line-width -1 :color quixotic-fg) :height 0.99)
               (lsp-ui-sideline-code-action :foreground ,quixotic-yellow)
               (lsp-ui-sideline-symbol-info :slant italic :height 0.99)
               (lsp-ui-doc-background :background ,quixotic-bg)
               (lsp-ui-doc-header :foreground ,quixotic-bg :background ,quixotic-cyan)
               ;; magit
               (magit-branch-local :foreground ,quixotic-cyan)
               (magit-branch-remote :foreground ,quixotic-green)
               (magit-tag :foreground ,quixotic-orange)
               (magit-section-heading :foreground ,quixotic-pink :weight bold)
               (magit-section-highlight :background ,bg3 :extend t)
               (magit-diff-context-highlight :background ,bg3
                                             :foreground ,fg3
                                             :extend t)
               (magit-diff-revision-summary :foreground ,quixotic-orange
                                            :background ,quixotic-bg
                                            :weight bold)
               (magit-diff-revision-summary-highlight :foreground ,quixotic-orange
                                                      :background ,bg3
                                                      :weight bold
                                                      :extend t)
               ;; the four following lines are just a patch of the
               ;; upstream color to add the extend keyword.
               (magit-diff-added :background "#335533"
                                 :foreground "#ddffdd"
                                 :extend t)
               (magit-diff-added-highlight :background "#336633"
                                           :foreground "#cceecc"
                                           :extend t)
               (magit-diff-removed :background "#553333"
                                   :foreground "#ffdddd"
                                   :extend t)
               (magit-diff-removed-highlight :background "#663333"
                                             :foreground "#eecccc"
                                             :extend t)
               (magit-diff-file-heading :foreground ,quixotic-fg)
               (magit-diff-file-heading-highlight :inherit magit-section-highlight)
               (magit-diffstat-added :foreground ,quixotic-green)
               (magit-diffstat-removed :foreground ,quixotic-red)
               (magit-hash :foreground ,fg2)
               (magit-hunk-heading :background ,bg3)
               (magit-hunk-heading-highlight :background ,bg3)
               (magit-item-highlight :background ,bg3)
               (magit-log-author :foreground ,fg3)
               (magit-process-ng :foreground ,quixotic-orange :weight bold)
               (magit-process-ok :foreground ,quixotic-green :weight bold)
               ;; markdown
               (markdown-blockquote-face :foreground ,quixotic-yellow
                                         :slant italic)
               (markdown-code-face :foreground ,quixotic-orange)
               (markdown-footnote-face :foreground ,other-blue)
               (markdown-header-face :weight normal)
               (markdown-header-face-1
                :inherit bold :foreground ,quixotic-pink
                ,@(when quixotic-enlarge-headings
                    (list :height quixotic-height-title-1)))
               (markdown-header-face-2
                :inherit bold :foreground ,quixotic-purple
                ,@(when quixotic-enlarge-headings
                    (list :height quixotic-height-title-2)))
               (markdown-header-face-3
                :foreground ,quixotic-green
                ,@(when quixotic-enlarge-headings
                    (list :height quixotic-height-title-3)))
               (markdown-header-face-4 :foreground ,quixotic-yellow)
               (markdown-header-face-5 :foreground ,quixotic-cyan)
               (markdown-header-face-6 :foreground ,quixotic-orange)
               (markdown-header-face-7 :foreground ,other-blue)
               (markdown-header-face-8 :foreground ,quixotic-fg)
               (markdown-inline-code-face :foreground ,quixotic-green)
               (markdown-plain-url-face :inherit link)
               (markdown-pre-face :foreground ,quixotic-orange)
               (markdown-table-face :foreground ,quixotic-purple)
               (markdown-list-face :foreground ,quixotic-cyan)
               (markdown-language-keyword-face :foreground ,quixotic-comment)
               ;; message
               (message-header-to :foreground ,quixotic-fg :weight bold)
               (message-header-cc :foreground ,quixotic-fg :bold bold)
               (message-header-subject :foreground ,quixotic-orange)
               (message-header-newsgroups :foreground ,quixotic-purple)
               (message-header-other :foreground ,quixotic-purple)
               (message-header-name :foreground ,quixotic-green)
               (message-header-xheader :foreground ,quixotic-cyan)
               (message-separator :foreground ,quixotic-cyan :slant italic)
               (message-cited-text :foreground ,quixotic-purple)
               (message-cited-text-1 :foreground ,quixotic-purple)
               (message-cited-text-2 :foreground ,quixotic-orange)
               (message-cited-text-3 :foreground ,quixotic-comment)
               (message-cited-text-4 :foreground ,fg2)
               (message-mml :foreground ,quixotic-green :weight normal)
               ;; mini-modeline
               (mini-modeline-mode-line :inherit mode-line :height 0.1 :box nil)
               ;; mu4e
               (mu4e-unread-face :foreground ,quixotic-pink :weight normal)
               (mu4e-view-url-number-face :foreground ,quixotic-purple)
               (mu4e-highlight-face :background ,quixotic-bg
                                    :foreground ,quixotic-yellow
                                    :extend t)
               (mu4e-header-highlight-face :background ,quixotic-current
                                           :foreground ,quixotic-fg
                                           :underline nil :weight bold
                                           :extend t)
               (mu4e-header-key-face :inherit message-mml)
               (mu4e-header-marks-face :foreground ,quixotic-purple)
               (mu4e-cited-1-face :foreground ,quixotic-purple)
               (mu4e-cited-2-face :foreground ,quixotic-orange)
               (mu4e-cited-3-face :foreground ,quixotic-comment)
               (mu4e-cited-4-face :foreground ,fg2)
               (mu4e-cited-5-face :foreground ,fg3)
               ;; neotree
               (neo-banner-face :foreground ,quixotic-orange :weight bold)
               ;;(neo-button-face :underline nil)
               (neo-dir-link-face :foreground ,quixotic-purple)
               (neo-expand-btn-face :foreground ,quixotic-fg)
               (neo-file-link-face :foreground ,quixotic-cyan)
               (neo-header-face :background ,quixotic-bg
                                :foreground ,quixotic-fg
                                :weight bold)
               (neo-root-dir-face :foreground ,quixotic-purple :weight bold)
               (neo-vc-added-face :foreground ,quixotic-orange)
               (neo-vc-conflict-face :foreground ,quixotic-red)
               (neo-vc-default-face :inherit neo-file-link-face)
               (neo-vc-edited-face :foreground ,quixotic-orange)
               (neo-vc-ignored-face :foreground ,quixotic-comment)
               (neo-vc-missing-face :foreground ,quixotic-red)
               (neo-vc-needs-merge-face :foreground ,quixotic-red
                                        :weight bold)
               ;;(neo-vc-needs-update-face :underline t)
               ;;(neo-vc-removed-face :strike-through t)
               (neo-vc-unlocked-changes-face :foreground ,quixotic-red)
               ;;(neo-vc-unregistered-face nil)
               (neo-vc-up-to-date-face :foreground ,quixotic-green)
               (neo-vc-user-face :foreground ,quixotic-purple)
               ;; org
               (org-agenda-date :foreground ,quixotic-cyan :underline nil)
               (org-agenda-dimmed-todo-face :foreground ,quixotic-comment)
               (org-agenda-done :foreground ,quixotic-green)
               (org-agenda-structure :foreground ,quixotic-purple)
               (org-block :foreground ,quixotic-orange)
               (org-code :foreground ,quixotic-green)
               (org-column :background ,bg4)
               (org-column-title :inherit org-column :weight bold :underline t)
               (org-date :foreground ,quixotic-cyan :underline t)
               (org-document-info :foreground ,other-blue)
               (org-document-info-keyword :foreground ,quixotic-comment)
               (org-document-title :weight bold :foreground ,quixotic-orange
                                   ,@(when quixotic-enlarge-headings
                                       (list :height quixotic-height-doc-title)))
               (org-done :foreground ,quixotic-green)
               (org-ellipsis :foreground ,quixotic-comment)
               (org-footnote :foreground ,other-blue)
               (org-formula :foreground ,quixotic-pink)
               (org-headline-done :foreground ,quixotic-comment
                                  :weight normal :strike-through t)
               (org-hide :foreground ,quixotic-bg :background ,quixotic-bg)
               (org-level-1 :inherit bold :foreground ,quixotic-pink
                            ,@(when quixotic-enlarge-headings
                                (list :height quixotic-height-title-1)))
               (org-level-2 :inherit bold :foreground ,quixotic-purple
                            ,@(when quixotic-enlarge-headings
                                (list :height quixotic-height-title-2)))
               (org-level-3 :weight normal :foreground ,quixotic-green
                            ,@(when quixotic-enlarge-headings
                                (list :height quixotic-height-title-3)))
               (org-level-4 :weight normal :foreground ,quixotic-yellow)
               (org-level-5 :weight normal :foreground ,quixotic-cyan)
               (org-level-6 :weight normal :foreground ,quixotic-orange)
               (org-level-7 :weight normal :foreground ,other-blue)
               (org-level-8 :weight normal :foreground ,quixotic-fg)
               (org-link :foreground ,quixotic-cyan :underline t)
               (org-priority :foreground ,quixotic-cyan)
               (org-quote :foreground ,quixotic-yellow :slant italic)
               (org-scheduled :foreground ,quixotic-green)
               (org-scheduled-previously :foreground ,quixotic-yellow)
               (org-scheduled-today :foreground ,quixotic-green)
               (org-sexp-date :foreground ,fg4)
               (org-special-keyword :foreground ,quixotic-yellow)
               (org-table :foreground ,quixotic-purple)
               (org-tag :foreground ,quixotic-pink :weight bold :background ,bg2)
               (org-todo :foreground ,quixotic-orange :weight bold :background ,bg2)
               (org-upcoming-deadline :foreground ,quixotic-yellow)
               (org-verbatim :inherit org-quote)
               (org-warning :weight bold :foreground ,quixotic-pink)
               ;; outline
               (outline-1 :foreground ,quixotic-pink)
               (outline-2 :foreground ,quixotic-purple)
               (outline-3 :foreground ,quixotic-green)
               (outline-4 :foreground ,quixotic-yellow)
               (outline-5 :foreground ,quixotic-cyan)
               (outline-6 :foreground ,quixotic-orange)
               ;; perspective
               (persp-selected-face :weight bold :foreground ,quixotic-pink)
               ;; powerline
               (powerline-active1 :background ,quixotic-bg :foreground ,quixotic-pink)
               (powerline-active2 :background ,quixotic-bg :foreground ,quixotic-pink)
               (powerline-inactive1 :background ,bg2 :foreground ,quixotic-purple)
               (powerline-inactive2 :background ,bg2 :foreground ,quixotic-purple)
               (powerline-evil-base-face :foreground ,bg2)
               (powerline-evil-emacs-face :inherit powerline-evil-base-face :background ,quixotic-yellow)
               (powerline-evil-insert-face :inherit powerline-evil-base-face :background ,quixotic-cyan)
               (powerline-evil-motion-face :inherit powerline-evil-base-face :background ,quixotic-purple)
               (powerline-evil-normal-face :inherit powerline-evil-base-face :background ,quixotic-green)
               (powerline-evil-operator-face :inherit powerline-evil-base-face :background ,quixotic-pink)
               (powerline-evil-replace-face :inherit powerline-evil-base-face :background ,quixotic-red)
               (powerline-evil-visual-face :inherit powerline-evil-base-face :background ,quixotic-orange)
               ;; rainbow-delimiters
               (rainbow-delimiters-depth-1-face :foreground ,quixotic-fg)
               (rainbow-delimiters-depth-2-face :foreground ,quixotic-cyan)
               (rainbow-delimiters-depth-3-face :foreground ,quixotic-purple)
               (rainbow-delimiters-depth-4-face :foreground ,quixotic-pink)
               (rainbow-delimiters-depth-5-face :foreground ,quixotic-orange)
               (rainbow-delimiters-depth-6-face :foreground ,quixotic-green)
               (rainbow-delimiters-depth-7-face :foreground ,quixotic-yellow)
               (rainbow-delimiters-depth-8-face :foreground ,other-blue)
               (rainbow-delimiters-unmatched-face :foreground ,quixotic-orange)
               ;; rpm-spec
               (rpm-spec-dir-face :foreground ,quixotic-green)
               (rpm-spec-doc-face :foreground ,quixotic-pink)
               (rpm-spec-ghost-face :foreground ,quixotic-purple)
               (rpm-spec-macro-face :foreground ,quixotic-yellow)
               (rpm-spec-obsolete-tag-face :inherit font-lock-warning-face)
               (rpm-spec-package-face :foreground ,quixotic-purple)
               (rpm-spec-section-face :foreground ,quixotic-yellow)
               (rpm-spec-tag-face :foreground ,quixotic-cyan)
               (rpm-spec-var-face :foreground ,quixotic-orange)
               ;; rst (reStructuredText)
               (rst-level-1 :foreground ,quixotic-pink :weight bold)
               (rst-level-2 :foreground ,quixotic-purple :weight bold)
               (rst-level-3 :foreground ,quixotic-green)
               (rst-level-4 :foreground ,quixotic-yellow)
               (rst-level-5 :foreground ,quixotic-cyan)
               (rst-level-6 :foreground ,quixotic-orange)
               (rst-level-7 :foreground ,other-blue)
               (rst-level-8 :foreground ,quixotic-fg)
               ;; selectrum-mode
               (selectrum-current-candidate :weight bold)
               (selectrum-primary-highlight :foreground ,quixotic-pink)
               (selectrum-secondary-highlight :foreground ,quixotic-green)
               ;; show-paren
               (show-paren-match-face :background unspecified
                                      :foreground ,quixotic-cyan
                                      :weight bold)
               (show-paren-match :background unspecified
                                 :foreground ,quixotic-cyan
                                 :weight bold)
               (show-paren-match-expression :inherit match)
               (show-paren-mismatch :inherit font-lock-warning-face)
               ;; slime
               (slime-repl-inputed-output-face :foreground ,quixotic-purple)
               ;; spam
               (spam :inherit gnus-summary-normal-read :foreground ,quixotic-orange
                     :strike-through t :slant oblique)
               ;; speedbar (and sr-speedbar)
               (speedbar-button-face :foreground ,quixotic-green)
               (speedbar-file-face :foreground ,quixotic-cyan)
               (speedbar-directory-face :foreground ,quixotic-purple)
               (speedbar-tag-face :foreground ,quixotic-yellow)
               (speedbar-selected-face :foreground ,quixotic-pink)
               (speedbar-highlight-face :inherit match)
               (speedbar-separator-face :background ,quixotic-bg
                                        :foreground ,quixotic-fg
                                        :weight bold)
               ;; tab-bar & tab-line (since Emacs 27.1)
               (tab-bar :foreground ,quixotic-purple :background ,quixotic-current
                        :inherit variable-pitch)
               (tab-bar-tab :foreground ,quixotic-pink :background ,quixotic-bg
                            :box (:line-width 2 :color ,quixotic-bg :style nil))
               (tab-bar-tab-inactive :foreground ,quixotic-purple :background ,bg2
                                     :box (:line-width 2 :color ,bg2 :style nil))
               (tab-line :foreground ,quixotic-purple :background ,quixotic-current
                         :height 0.9 :inherit variable-pitch)
               (tab-line-tab :foreground ,quixotic-pink :background ,quixotic-bg
                             :box (:line-width 2 :color ,quixotic-bg :style nil))
               (tab-line-tab-inactive :foreground ,quixotic-purple :background ,bg2
                                      :box (:line-width 2 :color ,bg2 :style nil))
               (tab-line-tab-current :inherit tab-line-tab)
               (tab-line-close-highlight :foreground ,quixotic-red)
               ;; telephone-line
               (telephone-line-accent-active :background ,quixotic-bg :foreground ,quixotic-pink)
               (telephone-line-accent-inactive :background ,bg2 :foreground ,quixotic-purple)
               (telephone-line-unimportant :background ,quixotic-bg :foreground ,quixotic-comment)
               ;; term
               (term :foreground ,quixotic-fg :background ,quixotic-bg)
               (term-color-black :foreground ,quixotic-bg :background ,quixotic-comment)
               (term-color-blue :foreground ,quixotic-purple :background ,quixotic-purple)
               (term-color-cyan :foreground ,quixotic-cyan :background ,quixotic-cyan)
               (term-color-green :foreground ,quixotic-green :background ,quixotic-green)
               (term-color-magenta :foreground ,quixotic-pink :background ,quixotic-pink)
               (term-color-red :foreground ,quixotic-red :background ,quixotic-red)
               (term-color-white :foreground ,quixotic-fg :background ,quixotic-fg)
               (term-color-yellow :foreground ,quixotic-yellow :background ,quixotic-yellow)
               ;; tree-sitter
               (tree-sitter-hl-face:attribute :inherit font-lock-constant-face)
               (tree-sitter-hl-face:comment :inherit font-lock-comment-face)
               (tree-sitter-hl-face:constant :inherit font-lock-constant-face)
               (tree-sitter-hl-face:constant.builtin :inherit font-lock-builtin-face)
               (tree-sitter-hl-face:constructor :inherit font-lock-constant-face)
               (tree-sitter-hl-face:escape :foreground ,quixotic-pink)
               (tree-sitter-hl-face:function :inherit font-lock-function-name-face)
               (tree-sitter-hl-face:function.builtin :inherit font-lock-builtin-face)
               (tree-sitter-hl-face:function.call :inherit font-lock-function-name-face
                                                  :weight normal)
               (tree-sitter-hl-face:function.macro :inherit font-lock-preprocessor-face)
               (tree-sitter-hl-face:function.special :inherit font-lock-preprocessor-face)
               (tree-sitter-hl-face:keyword :inherit font-lock-keyword-face)
               (tree-sitter-hl-face:punctuation :foreground ,quixotic-pink)
               (tree-sitter-hl-face:punctuation.bracket :foreground ,quixotic-fg)
               (tree-sitter-hl-face:punctuation.delimiter :foreground ,quixotic-fg)
               (tree-sitter-hl-face:punctuation.special :foreground ,quixotic-pink)
               (tree-sitter-hl-face:string :inherit font-lock-string-face)
               (tree-sitter-hl-face:string.special :foreground ,quixotic-red)
               (tree-sitter-hl-face:tag :inherit font-lock-keyword-face)
               (tree-sitter-hl-face:type :inherit font-lock-type-face)
               (tree-sitter-hl-face:type.parameter :foreground ,quixotic-pink)
               (tree-sitter-hl-face:variable :inherit font-lock-variable-name-face)
               (tree-sitter-hl-face:variable.parameter :inherit tree-sitter-hl-face:variable
                                                       :weight normal)
               ;; undo-tree
               (undo-tree-visualizer-current-face :foreground ,quixotic-orange)
               (undo-tree-visualizer-default-face :foreground ,fg2)
               (undo-tree-visualizer-register-face :foreground ,quixotic-purple)
               (undo-tree-visualizer-unmodified-face :foreground ,quixotic-fg)
               ;; web-mode
               (web-mode-builtin-face :inherit font-lock-builtin-face)
               (web-mode-comment-face :inherit font-lock-comment-face)
               (web-mode-constant-face :inherit font-lock-constant-face)
               (web-mode-css-property-name-face :inherit font-lock-constant-face)
               (web-mode-doctype-face :inherit font-lock-comment-face)
               (web-mode-function-name-face :inherit font-lock-function-name-face)
               (web-mode-html-attr-name-face :foreground ,quixotic-purple)
               (web-mode-html-attr-value-face :foreground ,quixotic-green)
               (web-mode-html-tag-face :foreground ,quixotic-pink :weight bold)
               (web-mode-keyword-face :foreground ,quixotic-pink)
               (web-mode-string-face :foreground ,quixotic-yellow)
               (web-mode-type-face :inherit font-lock-type-face)
               (web-mode-warning-face :inherit font-lock-warning-face)
               ;; which-func
               (which-func :inherit font-lock-function-name-face)
               ;; which-key
               (which-key-key-face :inherit font-lock-builtin-face)
               (which-key-command-description-face :inherit default)
               (which-key-separator-face :inherit font-lock-comment-delimiter-face)
               (which-key-local-map-description-face :foreground ,quixotic-green)
               ;; whitespace
               (whitespace-big-indent :background ,quixotic-red :foreground ,quixotic-red)
               (whitespace-empty :background ,quixotic-orange :foreground ,quixotic-red)
               (whitespace-hspace :background ,bg3 :foreground ,quixotic-comment)
               (whitespace-indentation :background ,quixotic-orange :foreground ,quixotic-red)
               (whitespace-line :background ,quixotic-bg :foreground ,quixotic-pink)
               (whitespace-newline :foreground ,quixotic-comment)
               (whitespace-space :background ,quixotic-bg :foreground ,quixotic-comment)
               (whitespace-space-after-tab :background ,quixotic-orange :foreground ,quixotic-red)
               (whitespace-space-before-tab :background ,quixotic-orange :foreground ,quixotic-red)
               (whitespace-tab :background ,bg2 :foreground ,quixotic-comment)
               (whitespace-trailing :inherit trailing-whitespace)
               ;; yard-mode
               (yard-tag-face :inherit font-lock-builtin-face)
               (yard-directive-face :inherit font-lock-builtin-face))))

  (apply #'custom-theme-set-faces
         'quixotic
         (let ((expand-with-func
                (lambda (func spec)
                  (let (reduced-color-list)
                    (dolist (col colors reduced-color-list)
                      (push (list (car col) (funcall func col))
                            reduced-color-list))
                    (eval `(let ,reduced-color-list
                             (backquote ,spec))))))
               whole-theme)
           (pcase-dolist (`(,face . ,spec) faces)
             (push `(,face
                     ((((min-colors 16777216)) ; fully graphical envs
                       ,(funcall expand-with-func 'cadr spec))
                      (((min-colors 256))      ; terminal withs 256 colors
                       ,(if quixotic-use-24-bit-colors-on-256-colors-terms
                            (funcall expand-with-func 'cadr spec)
                          (funcall expand-with-func 'caddr spec)))
                      (t                       ; should be only tty-like envs
                       ,(funcall expand-with-func 'cadddr spec))))
                   whole-theme))
           whole-theme))

  (apply #'custom-theme-set-variables
         'quixotic
         (let ((get-func
                (pcase (display-color-cells)
                  ((pred (<= 16777216)) 'car) ; fully graphical envs
                  ((pred (<= 256)) 'cadr)     ; terminal withs 256 colors
                  (_ 'caddr))))               ; should be only tty-like envs
           `((ansi-color-names-vector
              [,(funcall get-func (alist-get 'quixotic-bg colors))
               ,(funcall get-func (alist-get 'quixotic-red colors))
               ,(funcall get-func (alist-get 'quixotic-green colors))
               ,(funcall get-func (alist-get 'quixotic-yellow colors))
               ,(funcall get-func (alist-get 'quixotic-comment colors))
               ,(funcall get-func (alist-get 'quixotic-purple colors))
               ,(funcall get-func (alist-get 'quixotic-cyan colors))
               ,(funcall get-func (alist-get 'quixotic-fg colors))])))))


;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'quixotic)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

;;; quixotic-theme.el ends here
