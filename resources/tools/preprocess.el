#!/opt/local/bin/emacs -Q --script
(with-current-buffer (car (find-file-noselect "./*.org" nil nil t))
  (save-excursion
  (goto-char (point-min))
  (let ((re-search-str "\\(?::tangle\\|load-file \\(?:[\\]*\\)?[\"]\\)\s*\\(.*?/[dD]ev\\)/")
        (dev (getenv "DEV")))
    (while
            (re-search-forward re-search-str nil t)
            (replace-match dev t nil nil 1)))
  (save-buffer)
  (require 'org)
  (org-babel-tangle)))
