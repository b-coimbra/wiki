;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     emacs-lisp
     git
     ;; github
     markdown
     (shell :variables
            shell-default-position 'right)
     syntax-checking
     version-control
     (haskell :variables
              haskell-enable-ghc-mod-support t)
     ruby
     javascript
     emacs-lisp
     html
     ;; spell-checking
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
    gruvbox-theme
    darktooth-theme
    ;nord-theme
    gotham-theme
    kaolin-themes
    visual-regexp
    racket-mode
    rust-mode
    org-brain
    swiper
    counsel
    ranger
    drag-stuff
    try
    pdf-tools
    workgroups2
   )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(
      enh-ruby-mode
      flyspell
      tern
      scss-mode
      anaconda-mode
      company-anaconda
      osx-dictionary
      osx-trash
      chruby
      cmm-mode
      coffee-mode
      edn
      htmlize
      insert-shebang
      launchctl
      log4e
      logito
      packed
      parent-mode
      pbcopy
      pcache
      peg
      reveal-in-osx-finder
      exec-path-from-shell
      macrostep
      eval-sexp-fu
      ruby-test-mode
      projectile-rails
      gh-md
      git-gutter
      git-gutter+
      git-gutter-fringe+
      orgit
      evil-magit
      uuidgen
      helm-make
      helm-hoogle
      helm-projectile
      helm-swoop
      helm-themes
      helm-core
      helm-css-scss
      helm-c-yasnippet
      helm-descbinds
      helm-ag
      helm-company
      helm-mode-manager
      helm-flx
      helm-gitignore
      ace-jump-helm-line
      helm
      rubocop
      skewer-mode
      simple-httpd
      seq
      rspec-mode
      rbenv
      rake
      request
      pug-mode
      persp-mode
      pcre2el
      packed
      minitest
      livid-mode
      intero
      inf-ruby
      hlint-refactor
      halm-mode
      fuzzy
      fringe-helper
      f
      epl
      define-word
   )
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update nil
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Fantasque Sans Mono"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."
)

(defun dotspacemacs/user-config ()
  ;; default theme
  (spacemacs/load-theme 'darktooth)

  (set-language-environment "UTF-8")
  (set-default-coding-systems 'utf-8)

  (setenv "PATH" (concat "C:\\msys64\\mingw64\\bin;" (getenv "PATH")))

  (setq default-directory "c:/Users/Bruno/Documents/")

  (pdf-tools-install) ;; enable pdf-tools

  ;; set default font
  ;; (push '(font . "-outline-Fira Mono-normal-normal-normal-mono-13-*-*-*-c-*-iso8859-5") default-frame-alist)
  (push '(font . "-outline-Fantasque Sans Mono-normal-normal-normal-mono-15-*-*-*-c-*-iso8859-5") default-frame-alist)
  ;; (push '(font . "-outline-Menlo-normal-normal-normal-mono-14-*-*-*-c-*-iso10646-1") default-frame-alist)
  ;; (push '(font . "-outline-mononoki-normal-normal-normal-mono-15-*-*-*-c-*-iso10646-1") default-frame-alist)
  ;; (push '(font . "-outline-Consolas-normal-normal-normal-mono-14-*-*-*-c-*-iso8859-5") default-frame-alist)

  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

  ;; dim the color of the separator for dark themes
  (set-face-attribute 'vertical-border
                      nil
                      :foreground "#252529")

  ;; neotree settings
  (global-set-key [f8] 'neotree-toggle)
  (setq neo-theme 'ascii)
  (setq neo-window-fixed-size nil)
  (setq neo-banner-message nil)

  ;; workgroups2 settings
  (workgroups-mode 1)
  (setq wg-prefix-key (kbd "C-c w"))

  (setq doc-view-ghostscript-program "C:/Program Files/gs/gs9.23/bin/gswin64.exe")
  (add-hook 'pdf-view-mode-hook (lambda () (linum-mode -1))) ;; disable linum for pdf mode

  ;; use ranger as the default directory handler
  (ranger-override-dired-mode t)
  (add-hook 'ranger-mode-hook (lambda () (linum-mode -1)))
  ;; (ranger-toggle-literal)
  (evil-global-set-key 'normal (kbd "SPC a r") 'ranger)

  (evil-global-set-key 'normal (kbd "SPC '") 'eshell)

  ;; ERC settings
  (defun irc-maybe ()
    "Connect to IRC."
    (interactive)
    (when (y-or-n-p "IRC? ")
      (erc-tls :server "irc.lainchan.org" :port 6697 :nick "index")))

  (evil-global-set-key 'normal (kbd "SPC a i") 'irc-maybe)

  (erc-autojoin-mode 1)
  (setq erc-autojoin-channels-alist
        `(("lainchan.org" "#lainchan" "#programming")))

  ;; tab keybindings for navigating buffers
  (global-set-key [C-tab] 'next-buffer)
  (global-set-key (kbd "C-<backtab>") 'previous-buffer)

  (setq projectile-enable-caching t)

  ;; basic org-mode key combinations
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (setq org-log-done t)

  (add-hook 'c-mode-hook (lambda () (define-key global-map "\C-cc" 'compile)))

  ;; (require 'helm-bookmark)
  ;; (require 'highlight-indentation)

  (setq projectile-completion-system 'ivy) ;; use ivy for projectile instead of helm

  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (evil-global-set-key 'normal (kbd "SPC SPC") 'counsel-M-x)
  (global-set-key (kbd "C-s") 'swiper) ;; swiper keybinding
  (global-set-key (kbd "C-;") 'avy-goto-char) ;; avy search by char
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)

  (add-hook 'erc-mode-hook (lambda () (linum-mode -1))) ;; disable linum for ERC

  ;; (require 'zone)
  ;; (zone-when-idle 60)

  (setq global-hl-line-mode nil) ; disable line highlighting

  ;(setq spaceline-minor-modes-p nil) ; disable showing minor mode
  ;(setq spaceline-major-mode-p nil) ; disable showing major mode

  (setq dotspacemacs-line-numbers t)
  (global-linum-mode)
  ;; (setq linum-mode t)

  (define-key global-map (kbd "C-c r") 'vr/replace)
  (define-key global-map (kbd "C-c q") 'vr/query-replace)

  (evil-global-set-key 'normal (kbd "SPC T c") 'counsel-load-theme) ;; binding for loading themes quickly

  ;; (require 'multiple-cursors)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

  (global-set-key (kbd "C-c b") 'org-brain-visualize) ; visualize org brain

  ;; js indentation size

  ;; (require 'impatient-mode)
  ;; (add-hook 'html-mode-hook #'impatient-mode)

  ;; mode line time stamp
  (setq display-time-24hr-format t)
  (setq display-time-format "%H:%M")           ; add format
  (setq display-time-interval 1)               ; update every second
  (setq display-time-default-load-average nil) ; don't show load average
  (setq display-time-mail-string "")           ; don't show mail
  (display-time-mode 1)                        ; show time in mode line on startup

  (global-set-key (kbd "C-x p") 'emmet-preview) ; preview emmet expressions on html mode

  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)

  ;; racket-mode symbols
  (add-hook 'racket-mode-hook #'racket-unicode-input-method-enable)

  (setq mouse-avoidance-mode 'animate)

  (setq history-length 100)
  (put 'minibuffer-history 'history-length 50)
  (put 'evil-ex-history 'history-length 50)
  (put 'kill-ring 'history-length 25)

  (savehist-mode -1)

  (setq ediff-window-setup-function 'ediff-setup-windows-default)

  ;; diminish minor mode so it looks nicer
  ;(add-to-list 'spacemacs--diminished-minor-modes '(editorconfig-mode " ⓔ" "EC"))
  (spacemacs|diminish holy-mode)
  (spacemacs|diminish hybrid-mode)
  (spacemacs|diminish which-key-mode)
  (spacemacs|diminish evil-mc-mode)
  (spacemacs|diminish helm-gtags-mode)
  (spacemacs|diminish ggtags-mode)
  (spacemacs|diminish rubocop-mode)
  (spacemacs|diminish drag-stuff-mode)

  ;; powerline statusbar config
  (setq powerline-default-separator 'arrow-fade)
  ;; custom face
  ;; (set-face-attribute 'spacemacs-emacs-face nil
  ;;                     :background "#ff4f6c"
  ;;                     :foreground "#444649")

  ;; disable highlighting for common words
  ;(setq color-identifiers-mode nil)
  ;(global-color-identifiers-mode -1)


  (setq highlight-indentation-mode t)
  ;; highlighting indentation guides
  ;(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  ;(setq highlight-indent-guides-method 'character)

  ;; syntax highlighting for code blocks in org-mode
  (setq org-src-fontify-natively t)

  ;; enable flycheck
  ;; (setq flycheck-mode t)
  ;; (global-flycheck-mode)

  ;; line spacing
  ;(setq-default line-spacing 2)

  ;; shows minimap
  ;(minimap-mode t)

  ;; sublimity mode (smooth scrolling)
  ;(require 'sublimity)
  ;(require 'sublimity-scroll)

  ;(setq sublimity-mode t)
  ;(setq sublimity-scroll-weight 5
  ;      sublimity-scroll-drift-length 10)

  ;; click for multiple cursors
  (global-unset-key (kbd "M-<down-mouse-1>"))
  (global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)

  ;; disable company mode for eshell (to fix pressing Enter twice)
  (spacemacs|disable-company eshell-mode)

  ;; wraps words
  (setq-default word-wrap t)
  (global-visual-line-mode t)

  ;; shift selection for org-mode
  (setq org-support-shift-select t)

  ;; (defun move-line (n)
  ;;   "Move the current line up or down by N lines."
  ;;   (interactive "p")
  ;;   (setq col (current-column))
  ;;   (beginning-of-line) (setq start (point))
  ;;   (end-of-line) (forward-char) (setq end (point))
  ;;   (let ((line-text (delete-and-extract-region start end)))
  ;;     (forward-line n)
  ;;     (insert line-text)
  ;;     ;; restore point to original column in moved line
  ;;     (forward-line -1)
  ;;     (forward-char col)))

  ;; (defun move-line-up (n)
  ;;   "Move the current line up by N lines."
  ;;   (interactive "p")
  ;;   (move-line (if (null n) -1 (- n))))

  ;; (defun move-line-down (n)
  ;;   "Move the current line down by N lines."
  ;;   (interactive "p")
  ;;   (move-line (if (null n) 1 n)))

  ;; (global-set-key (kbd "M-<up>") 'move-line-up)
  ;; (global-set-key (kbd "M-<down>") 'move-line-down)

  (drag-stuff-global-mode 1)
  (drag-stuff-define-keys)

  ;; lambda icon for lisp mode
  (font-lock-add-keywords 'racket-mode
                          '(("(\\(lambda\\)\\>" (0 (prog1 ()
                                                     (compose-region (match-beginning 1)
                                                                     (match-end 1)
                                                                     ?λ))))))

  (setq c-default-style "linux" c-basic-offset 4) ; c-style indentation
  (setq haskell-font-lock-symbols t) ; unicode symbols for haskell
  (global-prettify-symbols-mode 1) ; global unicode symbols
  (global-flycheck-mode -1) ; disable flycheck (it causes lag)
  (setq prettify-symbols-unprettify-at-point t) ; shows what symbols are
  (defconst lisp--prettify-symbols-alist
    '((">=" . ?≥)
      ("lambda" . ?λ)
      ("<=" . ?≤)
      ("or" . ?∨)
      ("and" . ?∧)
      ("not" . ?¬)))

  (defconst haskell-font-lock-symbols-alist
    '(("()" . ?〇)
      ("." . ?•)
      ("\\" . "λ")
      ("not" . "¬")
      ("->" . "→")
      ("<-" . "←")
      ("=>" . "⇒")
      ("==" . "≡")
      (">=" . "≥")
      ("<=" . "≤")
      ("!!" . "‼")
      ("&&" . "∧")
      ("||" . "∨")
      ("sqrt" . "√")
      ("undefined" . "⊥")
      ("pi" . "π")
      ;;("~>" . "⇝") ;; Omega language
      ;; ("~>" "↝") ;; less desirable
      ;; ("-<" . "↢") ;; Paterson's arrow syntax
      ;; ("-<" "⤙") ;; nicer but uncommon
      ;;("::" . "∷")
      ("forall" . "∀")))
  (setq linum-format "%4d ") ; set spacing between line number
  ;;(with-eval-after-load 'linum
  ;;  (linum-relative-toggle)
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  ;; avoid `Variable binding depth exceeds max-specpdl-size` error
  (setq max-specpdl-size 6000)

  ;; use company for auto-complete every mode
  (global-company-mode 1) ;; disable
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)

  ;; for js2-mode default settings
  (setq-default js2-basic-offset 2)
  (setq-default js-indent-level 2)

  ;;  our own super awe ruby coding info
  (setq ruby-insert-encoding-magic-comment nil)

  ;; see via https://github.com/syl20bnr/spacemacs/issues/2032
  (fset 'evil-visual-update-x-selection 'ignore)

  ;; editorconfig-mode enabled
  ;(editorconfig-mode 1)
  ;; for ddskk
  ;; (when (require 'skk nil t)
  ;;   (global-set-key (kbd "C-x j") 'skk-auto-fill-mode)
  ;;   (setq default-input-method "japanese-skk")
  ;;   (require 'skk-study)
  ;;   ;; use skkserve
  ;;   (setq skk-server-host "localhost")
  ;;   (setq skk-server-portnum 1178)
  ;;   )

  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  (setq ns-pop-up-frames nil)

  (spacemacs/set-leader-keys-for-major-mode 'haskell-mode
    "mht"  'ghc-show-type)
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(custom-safe-themes
   (quote
    ("3edbdd0ad45cb8f7c2575c0ad8f6625540283c6e928713c328b0bacf4cfbb60f" "718fb4e505b6134cc0eafb7dad709be5ec1ba7a7e8102617d87d3109f56d9615" "5b388add509c423e4ac275668662486628690e7ffe0050998615fc4c3669c16c" "54e08527b4f4b127ebf7359acbbbecfab55152da01716c4809682eb71937fd33" "7f6796a9b925f727bbe1781dc65f7f23c0aa4d4dc19613aa3cf96e41a96651e4" default)))
 '(evil-want-Y-yank-to-eol t)
 '(package-selected-packages
   (quote
    (company-inf-ruby anaphora workgroups2 pdf-tools arduino-mode try drag-stuff ranger ivy-hydra avk-emacs-themes creamsody-theme sourcerer-theme challenger-deep-theme exotica-theme flatui-dark-theme git-gutter-fringe+ git-gutter+ with-editor emms-player-mpv bongo emms helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag ace-jump-helm-line counsel helm helm-core rubocop zenburn-theme xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights visual-regexp vi-tilde-fringe use-package toc-org tagedit swiper spaceline solarized-theme smeargle slim-mode shell-pop sass-mode rvm rust-mode ruby-tools rspec-mode robe restart-emacs request rbenv rake rainbow-delimiters racket-mode pug-mode projectile popwin persp-mode pcre2el paradox org-plus-contrib org-bullets org-brain open-junk-file nord-theme neotree multi-term move-text monokai-theme mmm-mode minitest markdown-toc magit-gitflow lorem-ipsum livid-mode linum-relative link-hint less-css-mode kaolin-themes json-mode js2-refactor js-doc intero info+ indent-guide hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ haskell-snippets gruvbox-theme gotham-theme google-translate golden-ratio gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe fuzzy flycheck-pos-tip flycheck-haskell flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump diminish diff-hl define-word darktooth-theme company-web company-tern company-statistics company-ghci company-ghc company-cabal column-enforce-mode clean-aindent-mode bundler auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ac-ispell)))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
