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
     ;; spacemacs base
     helm
     better-defaults
     osx
     fasd
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     shell-scripts
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)

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
                      auto-completion-tab-key-behavior 'complete)
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

     ;; lisp
     emacs-lisp
     (clojure :variables clojure-enable-fancify-symbols t)

     ;; c-c++
     c-c++
     cscope
     (gtags :disabled-for go)

     ;; +chat
     erc

     ;; source control
     git
     github
     (version-control :variables version-control-diff-tool 'git-gutter+
                      version-control-global-margin t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(switch-window
                                      youdao-dictionary
                                      smart-mode-line
                                      smart-mode-line-powerline-theme)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
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
   dotspacemacs-editing-style 'hybrid
   hybrid-mode-default-state 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   ;; dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-startup-lists 'nil
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
   dotspacemacs-default-font '("Source Code Pro"
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
  (setq-default dotspacemacs-themes '(tao-yin))
  (setq exec-path-from-shell-arguments '("-l"))
  (setq-default dotspacemacs-startup-banner '"~/.spacemacs.d/banners/assassin.png")
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
  This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;;; emacs base setting begin
  (global-set-key (kbd "C-SPC") nil)
  (global-set-key (kbd "C-@") 'set-mark-command)
  (global-set-key (kbd "C-c s") 'ace-swap-window)
  (global-set-key (kbd "C-x M-m") 'shell)
  (global-set-key (kbd "C-c w") 'subword-mode)
  (global-set-key (kbd "C-c C-q") 'read-only-mode)
  (global-set-key (kbd "C-c j") 'fasd-find-file)
  (global-set-key (kbd "C-c e") 'iedit-mode)
  (setq undo-tree-visualizer-diff nil)
  (setq dotspacemacs-which-key-delay 1.7)
  (setq op/confound-email nil)
  (display-time)
  ;;; emacs base setting end

  ;;; whitespace mode setting begin
  (setq whitespace-line-column 80)
  (setq whitespace-style '(face lines-tail))
  (add-hook 'c-mode-hook 'whitespace-mode)
  (add-hook 'c++-mode-hook 'whitespace-mode)
  ;;; whitespace mode setting end

  ;;; org setting begin
  (setq org-directory "~/Workspace/org")
  (setq org-default-notes-file "notes.org")
  (with-eval-after-load 'org
    (setq org-bullets-bullet-list '("☰" "☷" "⋗" "⇀"))
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((sh . t)
       (ruby . t)
       (C . t)
       )))
  ;;; org setting end

  ;;; hs function setting begin
  ;; h means hide, o means open
  (global-set-key (kbd "C-c M-h") 'hs-hide-block)
  (global-set-key (kbd "C-c M-o") 'hs-show-block)
  ;;; hs function setting end

  ;;; translate setting begin
  (setq google-translate-default-source-language "en")
  (setq google-translate-default-target-language "zh")
  (global-set-key (kbd "C-c t") 'youdao-dictionary-search-at-point)
  ;;; translate setting end

  ;;; powerline theme setting and smart-mode-line setting begin
  (which-func-mode t)
  (setq powerline-default-separator 'arrow)
  (with-eval-after-load 'spaceline-segments
    (spaceline-toggle-minor-modes-off)
    (setq sml/theme 'powerline)
    (sml/setup))
  (spaceline-compile)
  ;;; powerline theme and smart-mode-line setting end

  ;;;  ycmd setting begin
  (setq url-show-status nil)
  (setq request-message-level -1)
  (set-variable 'ycmd-extra-conf-whitelist '("~/Workspace/c/*"))
  (setq company-backends-c-mode-common '((company-c-headers
                                          company-ycmd
                                          company-dabbrev :with company-yasnippet)))
  (add-hook 'c-mode-hook 'ycmd-mode)
  (add-hook 'js2-mode-hook 'ycmd-mode)
  (setq company--auto-completion t
        company-show-numbers t)
  ;;;  ycmd setting end

  ;;; helm setting begin
  (ido-mode nil)
  (with-eval-after-load 'helm
    (global-set-key (kbd "C-c h o") 'helm-occur)
    (global-set-key (kbd "C-c h i") 'helm-semantic-or-imenu)
    (global-set-key (kbd "C-c f") 'helm-recentf))
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

  ;;; cscope setting begin
  (add-hook 'c-mode-common-hook 'helm-cscope-mode)
  (define-key global-map (kbd "C-c g s")  'helm-cscope-find-this-symbol)
  (define-key global-map (kbd "C-c g d")  'helm-cscope-find-global-definition)
  (define-key global-map (kbd "C-c g g")  'helm-cscope-find-called-function)
  ;; funtcion != function the bug of spelling. Here uses g(c) and G(C) for convenience.
  (define-key global-map (kbd "C-c g G")  'helm-cscope-find-calling-this-funtcion)
  ;;; cscope setting end

  ;;; c-mode setting begin
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
              (let ((filename (buffer-file-name)))
                ;; Enable kernel mode for the appropriate files
                (when (and filename
                           (string-match (expand-file-name "~/Workspace/c/linux")
                                         filename))
                  (setq indent-tabs-mode t)
                  (c-set-style "linux-tabs-only")))))
  ;;; c-mode setting begin
  )

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
 '(org-agenda-files (quote ("~/Workspace/org/adc.org")))
 '(org-todo-keywords (quote ((sequence "TODO(t)" "DONE(d)"))))
 '(package-selected-packages
   (quote
    (magit-gh-pulls github-search github-clone github-browse-file git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache ht diff-hl helm-gtags ggtags fasd grizzl auto-complete smartparens evil flycheck company helm helm-core markdown-mode projectile magit with-editor hydra osx-dictionary youdao-dictionary names chinese-word-at-point tao-ying-theme clues-theme ample-theme wgrep smex ivy-hydra ibuffer-projectile flyspell-correct-ivy enh-ruby-mode counsel-projectile counsel swiper ivy web-mode web-beautify tagedit slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv projectile-rails rake livid-mode skewer-mode simple-httpd less-css-mode json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc jade-mode helm-css-scss haml-mode fish-mode feature-mode erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks emmet-mode disaster company-web web-completion-data company-tern dash-functional tern company-shell company-c-headers coffee-mode cmake-mode clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg clang-format cider-eval-sexp-fu cider queue clojure-mode chruby bundler inf-ruby smart-mode-line-powerline-theme uuidgen org-projectile org-download mwim link-hint git-link flyspell-correct-helm flyspell-correct evil-visual-mark-mode evil-unimpaired evil-ediff eshell-z dumb-jump f smart-mode-line rich-minority switch-window eyebrowse column-enforce-mode helm-cscope xcscope flycheck-ycmd company-ycmd ycmd request-deferred deferred zenburn-theme xterm-color ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe use-package toc-org spacemacs-theme spaceline solarized-theme smooth-scrolling smeargle shell-pop reveal-in-osx-finder restart-emacs rainbow-delimiters quelpa popwin persp-mode pcre2el pbcopy paradox page-break-lines osx-trash orgit org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets open-junk-file neotree multi-term move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum linum-relative leuven-theme launchctl info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flyspell helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger gh-md flycheck-pos-tip flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu eshell-prompt-extras esh-help elisp-slime-nav define-word company-statistics company-quickhelp clean-aindent-mode buffer-move bracketed-paste auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(which-function-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-annotation ((t (:inherit nil :background nil :foreground "ForestGreen"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(company-tooltip-selection ((t (:foreground "White" :background "#252525"))))
 '(git-gutter+-modified ((t (:foreground "gray" :weight bold))))
 '(hl-line ((t (:background "#252525")) (t :weight bold)))
 '(hl-line-face ((t (:background "#252525")) (t :weight bold)))
 '(hl-paren-face ((t (:foreground "#F0F0F0" :wight bold :background nil))) t)
 '(isearch ((t (:foreground "#161616" :weight bold :background "#F0F0F0"))))
 '(lazy-highlight ((t (:foreground "#161616" :weight bold :background "#9D9D9D"))))
 '(mode-line-buffer-id ((t (:inherit nil :background "Black" :foreground "yellow"))))
 '(org-done ((t (:bold t :background nil :foreground "green" :weight bold))))
 '(org-todo ((t (:bold t :background nil :foreground "OrangeRed" :weight bold))))
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
 '(whitespace-line ((t (:background nil :foreground "IndianRed")))))
