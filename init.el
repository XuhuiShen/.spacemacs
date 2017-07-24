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
   ;; Paths must have a trailing slash (i.e. `/Users/shenxuhui/.mycontribs/')
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
     ;; spacemacs base
     helm
     better-defaults
     osx
     fasd
     docker
     dash
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     (shell :variables
            shell-default-height 30
            shell-default-position 'right)
     (spacemacs-layouts :variables layouts-enable-autosave nil
                        layouts-autosave-delay 300)

     ;; text editing
     markdown
     org

     ;; checkers
     (spell-checking :variables spell-checking-enable-by-default t)
     (syntax-checking :variables syntax-checking-enable-by-default nil
                      syntax-checking-enable-tooltips t)

     ;; completion
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-enable-snippets-in-popup nil)
     (ycmd :variables
           ycmd-server-command '("python" "/Users/shenxuhui/.bin/ycmd/ycmd")
           ycmd-force-semantic-completion t)

     ;; web
     (ruby :variables
           ruby-enable-enh-ruby-mode t
           ruby-version-manager 'rvm
           ruby-test-runner 'rspec)
     ruby-on-rails
     html
     javascript
     python

     ;; orphan languages
     emacs-lisp
     (clojure :variables clojure-enable-fancify-symbols t)
     c-c++
     shell-scripts

     ;; tags
     cscope
     (gtags :disabled-for go)

     ;; +chat
     erc

     ;; source control
     git
     github
     (version-control :variables version-control-diff-tool 'git-gutter+
                      version-control-global-margin t)

     ;; personal layer
     blog
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(wttrin
                                      switch-window
                                      youdao-dictionary
                                      smart-mode-line
                                      smart-mode-line-powerline-theme
                                      keyfreq
                                      2048-game)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(magithub)
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
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'emacs
   hybrid-mode-default-state 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner '001
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   ;; dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-startup-lists '(agenda todos recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(seti
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Monaco"
                               :size 14
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
   dotspacemacs-default-layout-name "Omniscience"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t
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
   dotspacemacs-helm-resize t
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
   dotspacemacs-which-key-delay 1
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
   dotspacemacs-fullscreen-at-startup nil
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
   dotspacemacs-mode-line-unicode-symbols t
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
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq-default dotspacemacs-themes '(seti))
  (setq configuration-layer--elpa-archives
        '(("melpa-cn" . "https://elpa.zilongshanren.com/melpa/")
          ("org-cn"   . "https://elpa.zilongshanren.com/org/")
          ("gnu-cn"   . "https://elpa.zilongshanren.com/gnu/")))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
  This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;;; emacs base setting begin
  (global-unset-key (kbd "C-x m"))
  (global-set-key (kbd "C-SPC") nil)
  (global-set-key (kbd "C-c s") 'ace-swap-window)
  (global-set-key (kbd "C-c C-q") 'read-only-mode)
  (global-set-key (kbd "C-c j") 'fasd-find-file)
  (global-set-key (kbd "C-c e") 'iedit-mode)
  (global-set-key (kbd "C-c w") 'subword-mode)
  (global-set-key (kbd "C-c r") 'rename-buffer)
  (global-set-key (kbd "C-c m") 'helm-mark-ring)
  (global-set-key (kbd "C-c k") 'helm-show-kill-ring)
  (global-set-key (kbd "C-c n") 'git-gutter+-next-hunk)
  (global-set-key (kbd "C-x M-m") 'shell)
  (global-set-key (kbd "C-x n e") 'flycheck-next-error)
  (global-set-key (kbd "C-x g") 'spacemacs/toggle-golden-ratio)
  (global-set-key (kbd "C-x 5 n") 'make-frame)
  (setq undo-tree-visualizer-diff nil)
  (setq dotspacemacs-which-key-delay 1.7)
  (setq op/confound-email nil)
  (setq paradox-github-token "bc58bd5dce0f60e626b6efe3163b089dd2ea1051") ;; paradox is a enhanced packages list.
  (setq helm-dash-browser-func 'eww)
  (projectile-mode t)
  (display-time)
  (setq eyebrowse-new-workspace (lambda () (helm-find-files)))
  (fancy-battery-mode 1)
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1)
  ;;; emacs base setting end

  ;;; zone setting start
  ;; (zone-when-idle 360)
  ;; (defun zone-choose (pgm)
  ;;   "Choose a PGM to run for `zone'."
  ;;   (interactive
  ;;    (list
  ;;     (completing-read
  ;;      "Program: "
  ;;      (mapcar 'symbol-name zone-programs))))
  ;;   (let ((zone-programs (list (intern pgm))))
  ;;     (zone)))
  ;;; zone setting end

  ;;; whitespace mode setting begin
  (setq whitespace-line-column 80)
  (setq whitespace-style '(face lines-tail))
  (add-hook 'c-mode-hook 'whitespace-mode)
  (add-hook 'c++-mode-hook 'whitespace-mode)
  ;;; whitespace mode setting end

  ;;; org setting begin
  (setq org-startup-truncated nil)
  (setq org-refile-targets (quote ((nil :maxlevel . 9)
                                   (org-agenda-files :maxlevel . 9))))
  (setq org-directory "/Users/shenxuhui/Workspace/org")
  (setq org-default-notes-file "notes.org") ;; for org capture
  (setq org-agenda-files (quote ("/Users/shenxuhui/Workspace/org"
                                 "/Users/shenxuhui/Workspace/org/tech"
                                 "/Users/shenxuhui/Workspace/org/week-reports"
                                 "/Users/shenxuhui/Workspace/org/work")))
  (setq org-bullets-bullet-list '("☰" "☷" "⋗" "⇀"))
  (setq org-todo-keywords (quote ((sequence "TODO(t)" "CANCELLED(c@/!)" "DONE(d@/!)"))))
  (setq org-todo-keyword-faces
        (quote (("TODO" :foreground "OrangeRed" :weight bold)
                ("DONE" :foreground "green" :weight bold)
                ("CANCELLED" :foreground "RoyalBlue" :weight bold)
                )))
  (setq org-capture-templates
        (quote (("t" "todo" entry (file "/Users/shenxuhui/Workspace/org/notes.org")
                 "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
                ("n" "note" entry (file "/Users/shenxuhui/Workspace/org/notes.org")
                 "* %? :note:\n%U\n%a\n" :clock-in t :clock-resume t)
                ("j" "journal" entry (file+datetree "/Users/shenxuhui/Workspace/org/notes.org")
                 "* %?\n%U\n" :clock-in t :clock-resume t)
                ("p" "phone call" entry (file "/Users/shenxuhui/Workspace/org/notes.org")
                 "* phone %? :phone:\n%U" :clock-in t :clock-resume t)
                )))
  (setq org-tag-alist '(("@work" . ?w) ("@home" . ?h)))
  (with-eval-after-load 'org
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((sh . t)
       (ruby . t)
       (C . t)
       )))

  (defun make-progress (width percent has-number?)
    (let* ((done (/ percent 100.0))
           (done-width (floor (* width done))))
      (concat
       "["
       (make-string done-width ?/)
       (make-string (- width done-width) ? )
       "]"
       (if has-number? (concat " " (number-to-string percent) "%"))
       )))
  (defun insert-day-progress ()
    (interactive)
    (let* ((today (time-to-day-in-year (current-time)))
           (percent (floor (* 100 (/ today 365.0)))))
      (insert (make-progress 30 percent t))
      ))
  (global-set-key (kbd "C-M-m i p") 'insert-day-progress)
  ;;; org setting end

  ;;; translate setting begin
  (setq google-translate-default-source-language "en")
  (setq google-translate-default-target-language "zh")
  (global-set-key (kbd "C-c t") 'youdao-dictionary-search-at-point)
  ;;; translate setting end

  ;;; powerline theme setting and smart-mode-line setting begin
  (setq powerline-default-separator 'arrow)
  (spaceline-compile)
  (with-eval-after-load 'spaceline-segments
    (spaceline-toggle-minor-modes-off)
    (setq sml/theme 'powerline)
    (sml/setup))
  ;;; powerline theme and smart-mode-line setting end

  ;;; cscope and ycmd setting begin
  (setq url-show-status nil)
  (setq request-message-level -1)
  (set-variable 'ycmd-extra-conf-whitelist '("/Users/shenxuhui/Workspace/c/*"))
  (add-hook 'c-mode-hook 'ycmd-mode)
  (add-hook 'js2-mode-hook 'ycmd-mode)
  (setq company--auto-completion t
        company-show-numbers t)
  (define-key global-map (kbd "C-c y g")  'ycmd-goto)
  (define-key global-map (kbd "C-c y d")  'ycmd-goto-definition)
  (define-key global-map (kbd "C-c y l")  'ycmd-load-conf-file)
  (define-key global-map (kbd "C-c y o")  'ycmd-open)
  (add-hook 'c-mode-common-hook 'helm-cscope-mode)
  (with-eval-after-load 'cc-mode
    (define-key c-mode-base-map (kbd "C-c g s")  'helm-cscope-find-this-symbol)
    (define-key c-mode-base-map (kbd "C-c g d")  'helm-cscope-find-global-definition)
    (define-key c-mode-base-map (kbd "C-c g C")  'helm-cscope-find-called-function)
    ;; funtcion != function the bug of spelling. Here uses g(c) and G(C) for convenience.
    (define-key c-mode-base-map (kbd "C-c g c")  'helm-cscope-find-calling-this-funtcion))
  ;;; cscope and ycmd setting end

  ;;; hs function setting begin
  ;; h means hide, s means show
  (global-set-key (kbd "C-c h h") 'hs-hide-block)
  (global-set-key (kbd "C-c h s") 'hs-show-block)
  (global-set-key (kbd "C-c h w") 'hs-show-all)
  (global-set-key (kbd "C-c h m") 'hs-hide-all)
  ;;; hs function setting end

  ;;; helm setting begin
  (ido-mode -1)
  (global-set-key (kbd "C-c h o") 'helm-occur)
  (global-set-key (kbd "C-c h i") 'helm-semantic-or-imenu)
  (global-set-key (kbd "C-c f") 'helm-recentf)
  ;;; helm setting end

  ;;; checker setting begin
  (setq flycheck-pos-tip-timeout 4)
  ;;; checker setting end

  ;;; erc-mode setting begin
  (with-eval-after-load 'erc
    (setq erc-ignore-list nil)
    (setq erc-hide-list
          '("JOIN" "PART" "QUIT" "MODE")))
  ;;; erc-mode setting end

  ;;; switch-window setting begin
  (global-unset-key (kbd "C-x o"))
  (global-set-key (kbd "C-x o") 'switch-window)
  (setq switch-window-shortcut-style 'qwerty)
  ;;; switch-window setting end

  ;;; frame zoom function setting begin
  (global-set-key (kbd "C-c C-+") 'zoom-frm-in)
  (global-set-key (kbd "C-c C--") 'zoom-frm-out)
  ;;; frame zoom function setting end

  ;;; toggle files setting begin
  (global-set-key (kbd "C-c x") 'ff-find-other-file)
  ;;; toggle files setting end

  ;;; c-mode setting begin
  (setq-default tab-width 8)
  (defun c-lineup-arglist-tabs-only (ignored)
    "Line up argument lists by tabs, not spaces"
    (let* ((anchor (c-langelem-pos c-syntactic-element))
           (column (c-langelem-2nd-pos c-syntactic-element))
           (offset (- (1+ column) anchor))
           (steps (floor offset c-basic-offset)))
      (* (max steps 1)
         c-basic-offset)))
  (add-hook 'c-mode-common-hook
            (lambda ()
              ;; Add kernel style
              (c-add-style
               "linux-tabs-only"
               '("linux" (c-offsets-alist
                          (arglist-cont-nonempty
                           c-lineup-gcc-asm-reg
                           c-lineup-arglist-tabs-only))))))
  (add-hook 'c-mode-hook
            (lambda ()
              (setq indent-tabs-mode t)
              (c-set-style "linux-tabs-only")))
  ;;; c-mode setting begin
  )

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" default)))
 '(evil-want-Y-yank-to-eol t)
 '(exec-path-from-shell-arguments (quote ("-l")))
 '(package-selected-packages
   (quote
    (helm-emmet org-brain impatient-mode evil-org org-page sayid ruby-refactor password-generator flycheck-bashate evil-lion editorconfig keyfreq ghub+ apiwrap ghub realgud test-simple loc-changes load-relative string-inflection orgit symon browse-at-remote magithub fuzzy chinese-fonts-setup packed avy dash yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic winum bind-key git mustache blog-admin ctable unfill xkcd wttrin tao-theme seti-theme 2048-game flappymacs typing-game sudoku helm-dash dash-at-point insert-shebang hide-comnt helm-purpose window-purpose imenu-list xterm-color powerline org alert log4e gntp parent-mode projectile gitignore-mode flx anzu goto-chg diminish request pos-tip highlight projectile-rails org-projectile ibuffer-projectile helm-projectile git-commit magit-popup iedit undo-tree yasnippet async s pug-mode minitest dockerfile-mode docker tablist docker-tramp minimal-theme magit-gh-pulls github-search github-clone github-browse-file git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache ht diff-hl helm-gtags ggtags fasd grizzl auto-complete smartparens evil flycheck company helm helm-core markdown-mode magit with-editor hydra osx-dictionary youdao-dictionary names chinese-word-at-point tao-ying-theme clues-theme ample-theme wgrep smex ivy-hydra flyspell-correct-ivy enh-ruby-mode counsel-projectile counsel swiper ivy web-mode web-beautify tagedit slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake livid-mode skewer-mode simple-httpd less-css-mode json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc jade-mode helm-css-scss haml-mode fish-mode feature-mode erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks emmet-mode disaster company-web web-completion-data company-tern dash-functional tern company-shell company-c-headers coffee-mode cmake-mode clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg clang-format cider-eval-sexp-fu cider queue clojure-mode chruby bundler inf-ruby smart-mode-line-powerline-theme uuidgen org-download mwim link-hint git-link flyspell-correct-helm flyspell-correct evil-visual-mark-mode evil-unimpaired evil-ediff eshell-z dumb-jump f smart-mode-line rich-minority switch-window eyebrowse column-enforce-mode helm-cscope xcscope flycheck-ycmd company-ycmd ycmd request-deferred deferred zenburn-theme ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe use-package toc-org spacemacs-theme spaceline solarized-theme smooth-scrolling smeargle shell-pop reveal-in-osx-finder restart-emacs rainbow-delimiters quelpa popwin persp-mode pcre2el pbcopy paradox page-break-lines osx-trash org-repo-todo org-present org-pomodoro org-bullets open-junk-file neotree multi-term move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum linum-relative leuven-theme launchctl info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-mode-manager helm-make helm-gitignore helm-flyspell helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger gh-md flycheck-pos-tip flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu eshell-prompt-extras esh-help elisp-slime-nav define-word company-statistics company-quickhelp clean-aindent-mode buffer-move bracketed-paste auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-automatically-star t)
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(which-function-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#151718" :foreground "#D4D7D6"))))
 '(company-echo-common ((t (:foreground "#F6F6F6"))))
 '(company-preview ((t (:background "#3C3C3C" :foreground "#E8E8E8"))))
 '(company-preview-common ((t (:inherit company-preview :foreground "#F6F6F6" :weight bold))))
 '(company-scrollbar-bg ((t (:inherit company-tooltip))))
 '(company-scrollbar-fg ((t (:background "#616161"))))
 '(company-tooltip ((t (:background "#3C3C3C" :foreground "#E8E8E8"))))
 '(company-tooltip-annotation ((t (:foreground "Orange2"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :foreground "#E8E8E8" :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :foreground "#F6F6F6" :weight bold :underline nil))))
 '(company-tooltip-selection ((t (:inherit company-tooltip :background "Steelblue3" :foreground "#252525"))))
 '(erc-action-face ((t (:inherit erc-default-face))))
 '(erc-bold-face ((t (:weight bold))))
 '(erc-current-nick-face ((t (:foreground "#E8E8E8" :weight bold))))
 '(erc-dangerous-host-face ((t (:foreground "#E8E8E8" :weight bold))))
 '(erc-default-face ((t (:foreground "#F6F6F6"))))
 '(erc-direct-msg-face ((t (:inherit erc-default))))
 '(erc-error-face ((t (:foreground "#E8E8E8" :weight bold))))
 '(erc-fool-face ((t (:inherit erc-default))))
 '(erc-highlight-face ((t (:inherit hover-highlight))))
 '(erc-input-face ((t (:foreground "#F6F6F6"))))
 '(erc-keyword-face ((t (:foreground "#E8E8E8" :weight bold))))
 '(erc-my-nick-face ((t (:foreground "#D9D9D9" :weight bold))))
 '(erc-nick-default-face ((t (:foreground "#F6F6F6" :weight bold))))
 '(erc-nick-msg-face ((t (:inherit erc-default))))
 '(erc-notice-face ((t (:foreground "#C2C2C2"))))
 '(erc-pal-face ((t (:foreground "#E8E8E8" :weight bold))))
 '(erc-prompt-face ((t (:foreground "#E8E8E8" :background "#161616" :weight bold))))
 '(erc-timestamp-face ((t (:foreground "#F6F6F6"))))
 '(erc-underline-face ((t (:underline t))))
 '(git-gutter+-modified ((t (:foreground "gray" :weight bold))))
 '(helm-match ((t (:background nil :foreground "#858D8A"))))
 '(helm-match-item ((t (:background nil :foreground "#8BE03C"))))
 '(helm-swoop-target-line-block-face ((t (:foreground "#D4D7D6" :background nil))))
 '(helm-swoop-target-line-face ((t (:background nil))))
 '(helm-swoop-target-word-face ((t (:background nil :foreground "#858D8A"))))
 '(highlight ((t (:background nil))))
 '(isearch ((t (:foreground "#161616" :weight bold :background "#87ceeb" :box nil))))
 '(lazy-highlight ((t (:foreground "#161616" :weight bold :background "#4f94cd" :box nil))))
 '(mode-line ((t (:underline nil))))
 '(mode-line-buffer-id ((t (:inherit nil :background "Black" :foreground "yellow"))))
 '(powerline-active1 ((t (:inherit sml/global :background "Black"))))
 '(powerline-active2 ((t (:inherit sml/global :background "Black"))))
 '(powerline-inactive1 ((t (:inherit mode-line-inactive :background "Black"))))
 '(powerline-inactive2 ((t (:inherit font-lock-comment-face :background "Black"))))
 '(sml/filename ((((class color) (min-colors 89)) (:foreground "#F0DFAF" :weight bold))))
 '(sml/folder ((t (:inherit sml/global :background "Black" :foreground "Cyan" :weight normal))))
 '(sml/git ((t (:inherit (sml/read-only sml/prefix) :foreground "yellow" :background "Black"))))
 '(sml/name-filling ((t (:inherit sml/prefix :background "Black" :weight normal))))
 '(sml/position-percentage ((t (:inherit sml/prefix :background "Black" :foreground "Black" :weight normal))))
 '(sml/prefix ((t (:inherit sml/global :background "Black" :foreground "Cyan"))))
 '(sml/vc ((t (:inherit sml/git :background "Black" :foreground "Cyan"))))
 '(sml/vc-edited ((t (:inherit sml/prefix :background "Black" :foreground "Cyan"))))
 '(which-func ((t (:foreground "Springgreen2"))))
 '(whitespace-line ((t (:background nil :foreground "IndianRed")))))
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (github-browse-file youdao-dictionary yapfify wttrin ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org tagedit symon switch-window string-inflection spaceline smeargle smart-mode-line-powerline-theme slim-mode shell-pop seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reveal-in-osx-finder restart-emacs realgud rbenv rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode projectile-rails popwin pip-requirements persp-mode pbcopy paradox osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro org-page org-download org-bullets open-junk-file neotree mwim multi-term move-text mmm-mode minitest markdown-toc magithub magit-gitflow magit-gh-pulls macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode launchctl js2-refactor js-doc insert-shebang info+ indent-guide ibuffer-projectile hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-dash helm-css-scss helm-cscope helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot github-search github-clone gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md ggtags fuzzy flyspell-correct-helm flycheck-ycmd flycheck-pos-tip flx-ido fish-mode fill-column-indicator feature-mode fasd fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eshell-z eshell-prompt-extras esh-help erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks enh-ruby-mode emmet-mode elisp-slime-nav dumb-jump dockerfile-mode docker disaster diff-hl dash-at-point cython-mode company-ycmd company-web company-tern company-statistics company-shell company-quickhelp company-c-headers company-anaconda column-enforce-mode coffee-mode cmake-mode clojure-snippets clj-refactor clean-aindent-mode clang-format cider-eval-sexp-fu chruby bundler browse-at-remote blog-admin auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell 2048-game))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#151718" :foreground "#D4D7D6")))))
