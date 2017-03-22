;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(add-to-list 'load-path
             ;; for now, just contains a local versions of term.el
             (expand-file-name "~/.emacs.d/private/")
             )

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     csv
     sql
     python
     javascript
     html
     yaml
     (ruby :variables
           ruby-enable-enh-ruby-mode t
           ruby-version-manager 'rvm)
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     ;; auto-completion
     ;; better-defaults
     emacs-lisp
     git
     markdown
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     version-control
     rust
     elm
     racket
     elixir
     osx
     haskell
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

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
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
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
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
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
   dotspacemacs-fullscreen-use-non-native t
   ns-use-native-fullscreen nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
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
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (defun embiggen-steve ()
    (interactive)
    (set-face-attribute 'default nil :height 170))

  (defun not-steve ()
    (interactive)
    (set-face-attribute 'default nil :height 125))

  (setq javascript-indent-level 2)


  (evil-search-highlight-persist nil)


  (setq web-mode-markup-indentation 2)

  (global-set-key (kbd "s-e") 'embiggen-steve)
  (global-set-key (kbd "s-E") 'not-steve)

  (setq-default evil-escape-key-sequence "jk")
  ;; turn off disabling evil-escape-mode

  (add-to-list 'evil-emacs-state-modes 'magit-mode)

  (setq projectile-use-git-grep t)

  ;; override option sent through ansi-term
  (defun jnm/term-ansi-make-term (fn &rest args)
    (let ((new-args (if (string= (second args) "/bin/bash")
                        (append args (list nil "--login"))
                      args)))
      (apply fn new-args)))

  (advice-add 'term-ansi-make-term :around #'jnm/term-ansi-make-term)

  (global-set-key (kbd "s-n") 'ansi-term)
  (setq projectile-switch-project-action 'magit-status)
  (setq mark-ring-max 1000)
  (setq global-mark-ring-max 1000)
  (setq avy-all-windows nil)

  (defvar spacemacs-mode-line-new-version-lighterp t)

  (defun jnm/reset-term-mode ()
    "Switch to fundamental mode, then back again.

This is an attempt to fix the occasional term mode problem."
    (interactive)
    (fundamental-mode)
    (term-mode))

  (require 'term)
  (define-key term-raw-map (kbd "s-R") 'jnm/reset-term-mode)
  (define-key term-mode-map (kbd "s-R") 'jnm/reset-term-mode)


  (defun ruby-local-to-let ()
    (interactive)
    (kmacro-exec-ring-item (quote ([108 101 116 40 4 58 19 32 return 2 41 4 4 32 123 4 5 32 63 backspace 125 16 14] 0 "%d")) nil))



  ;; this bit of code is used to generate the list of all the variables to log
  ;; im just stcking it here so I dont need to re-figure it out
  (when nil
    (setq t-syms nil)

    (mapatoms (lambda (x)

                (when (and (string-match "^term"
                                         (symbol-name x))
                           (not (functionp x))
                           ;; (get x 'variable-documentation)

                           )
                  (add-to-list 't-syms x)
                  ))))

  (setq jnm/debug-term-mode-vars
        '(term-input-filter-functions
         term-prompt-regexp
         term-kill-echo-list
;;         term-pending-delete-marker
         term-suppress-hard-newline
         term-terminal-previous-parameter
         term-file-name-prefix
         term-scroll-to-bottom-on-output
         term-home-marker
         terminals
         term-page
         term-escape-char
         term-dynamic-complete-functions
         term-termcap-format
         term-bind-key-alist
         Terminal
;;         term-raw-escape-map
         term-default-fg-color
         term-ansi-at-user
         term-input-filter
         term-in-char-mode
         term-completion-addsuffix
         term-pending-frame
         term-ansi-current-color
         term-input-ignoredups
         term-color-green
         term-ansi-face-already-done
         term-input-ring-file-name
         term-log-buffer
         term-ansi-current-reverse
         term-input-ring
         term-last-input-match
         term-ansi-current-bold
         term-underline
         term-pager-count
         term-cmd
;;         term-mode-map
         term-pager-filter
         term-ansi-at-message
         term-saved-home-marker
         term-color-magenta
         term-using-alternate-sub-buffer
         term-ansi-at-host
         term-term-name
         term-color-black
         term-saved-cursor
         term-init-func
         term-terminal-previous-parameter-2
         term-terminal-previous-parameter-3
         term-terminal-previous-parameter-4
         term-scroll-show-maximum-output
         term-input-ring-index
;;         term-display-table
         term-default-bg-color
         term-scroll-start
         term-pager-enabled
         term-terminal-state
         term-ansi-buffer-name
         term-ansi-current-invisible
         term+
         term-ptyp
         term-last-input-end
         term-pos
;;         term-pager-break-map
         term-current-face
         term-ansi-default-program
         term-exec-hook
         term-bold
         term-completion-recexact
         term-ansi-at-save-pwd
         term-ansi-buffer-base-name
         term-input-chunk-size
         term-scroll-with-delete
         terminal-frame
;;         term-mode-syntax-table
         term-color-yellow
         term-width
         term-insert-mode
         term-buffer-maximum-size
         term-input-autoexpand
;;         term-raw-map
         term+mux
         term-color-cyan
         term-terminal-more-parameters
         term-terminal-parameter
         term-get-old-input
         term-vertical-motion
         terminal
         term-matching-input-from-input-string
         term-file-prefix
         term-scroll-end
         term-protocol-version
         termbright-theme
         term-mode-hook
         term-alert
         term+key-intercept
         term-eol-on-send
         term-delimiter-argument-list
         term-old-mode-line-format
         term-ansi-at-dir
;;         term-pager-old-local-map
         term-ansi-at-save-user
         term-in-line-mode
         terminal-initted
;;         term-old-mode-map
         term-load-hook
         term-ansi-at-save-anon
         term-color-red
         terminal-init-xterm-hook
         term-input-ring-size
         term-input-sender
         term-completion-autolist
         term-color-white
         term-run
         term-setup-hook
;;         term-mode-abbrev-table
         term-pager-old-filter
         term-last-input-start
         term-ansi-current-bg-color
         term-ansi-current-underline
         term-color-blue
         term-completion-fignore
         term-handling-pager
         terminator
         term-height))

  (defun jnm/debug-term-mode ()
    "debug term mode, run from term"
    (interactive)

    (with-current-buffer (get-buffer-create "*debug-term-log*")
      (goto-char (point-max))
      (insert "\n")
      (insert "term mode debugging:\n")
      (insert "--------------------\n")

      (-each jnm/debug-term-mode-vars
        (lambda (var)
          (ignore-errors
              (insert (format "%S: %S\n" var (eval var)))))
      (insert "\n\n\n"))

    (message "Debug output sent to *debug-term-log*")
    ))

  (define-key term-raw-map (kbd "s-d") 'jnm/debug-term-mode)
  (define-key term-mode-map (kbd "s-d") 'jnm/debug-term-mode)

  (setq delete-by-moving-to-trash t)

  (setq git-magit-status-fullscreen t)

  (setq js-indent-level 2)

  (setq elm-format-on-save t)

  (add-to-list 'load-path "~/Projects/process-inbox")
  (require 'process-inbox)

  (spacemacs/set-leader-keys-for-major-mode 'enh-ruby-mode
    "tb" 'ruby-test-run
    "tt" 'ruby-test-run-at-point)


  (clean-aindent-mode -1)


  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-push-arguments (quote ("--set-upstream")))
 '(package-selected-packages
   (quote
    (csv-mode sql-indent powerline org alert markdown-mode multiple-cursors hydra yasnippet git-gutter magit magit-popup iedit inf-ruby rust-mode highlight anzu smartparens bind-map evil undo-tree elixir-mode git-commit with-editor request helm helm-core popup haskell-mode company avy async projectile f js2-mode dash s yapfify uuidgen rake py-isort pug-mode osx-dictionary org-projectile org-download ob-elixir minitest livid-mode skewer-mode simple-httpd live-py-mode link-hint intero hlint-refactor hide-comnt helm-hoogle git-link flycheck-mix flycheck eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff eshell-z dumb-jump company-ghci company-ghc column-enforce-mode cargo yaml-mode xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe use-package toml-mode toc-org tern tagedit spacemacs-theme spaceline smooth-scrolling smeargle slim-mode shm shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-end rubocop rspec-mode robe reveal-in-osx-finder restart-emacs rbenv rainbow-delimiters racket-mode racer quelpa pyvenv pytest pyenv-mode py-yapf popwin pip-requirements persp-mode pbcopy paradox page-break-lines osx-trash orgit org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets open-junk-file neotree multi-term move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum linum-relative leuven-theme less-css-mode launchctl json-mode js2-refactor js-doc jade-mode info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-ag haskell-snippets google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-gutter-fringe git-gutter-fringe+ ghc gh-md flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu eshell-prompt-extras esh-help enh-ruby-mode emmet-mode elm-mode elisp-slime-nav diff-hl define-word cython-mode coffee-mode cmm-mode clean-aindent-mode chruby bundler buffer-move bracketed-paste auto-highlight-symbol auto-compile anaconda-mode alchemist aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(paradox-github-token t)
 '(safe-local-variable-values
   (quote
    ((ef/files "actions.org" "projects-maintenance.org" "projects.org" "upcoming.org" "waiting.org")
     (elixir-enable-compilation-checking . t)
     (elixir-enable-compilation-checking)
     (encoding . utf-8)
     (eval progn
           (let*
               ((load-path
                 (cons
                  (locate-dominating-file default-directory "ef.el")
                  load-path)))
             (require
              (quote ef))))
     (ef/files "actions.org" "maintenance.org" "projects.org" "upcoming.org" "waiting.org")
     (ef/files quote
               ("actions.org" "maintenance.org" "projects.org" "upcoming.org" "waiting.org"))
     (eval progn
           (load
            (expand-file-name "./ef.el")))
     (eval progn
           (make-local-variable
            (quote projectile-make-test-cmd))
           (setq projectile-ruby-test-cmd "rake"))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
