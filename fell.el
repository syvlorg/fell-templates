;;; fell.el --- a simple package                     -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Jeet Ray

;; Author: Jeet Ray <aiern@protonmail.com>
;; Keywords: lisp
;; Version: 0.0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Put a description of the package here

;;; Code:

(require 'yasnippet)
(require 'yankpad)
(require 'org)
(require 'titan)

(defun timestamp nil (interactive) (format-time-string "%Y%m%d%H%M%S%N"))

;; Adapted From: https://github.com/AndreaCrotti/yasnippet-snippets/blob/master/yasnippet-snippets.el#L35
(defconst fell-yankpad-file
  (expand-file-name
   "yankpad.org"
   (file-name-directory
    ;; Copied from ‘f-this-file’ from f.el.
    (cond
     (load-in-progress load-file-name)
     ((and (boundp 'byte-compile-current-file) byte-compile-current-file)
      byte-compile-current-file)
     (:else (buffer-file-name))))))

(define-derived-mode fell-mode org-mode "Fell"
    (setq yankpad-file-backup yankpad-file)
    (setq yankpad-file fell-yankpad-file)
    (yankpad-append-category "fell-mode")
    (setq yankpad-file yankpad-file-backup)
    (add-to-list 'auto-mode-alist '("\\.fell.org\\'" . fell-mode)))

(provide 'fell)
;;; fell.el ends here
