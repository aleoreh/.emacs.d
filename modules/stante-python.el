;;; stante-python.el --- Stante Pede Modules: Python support
;;
;; Copyright (c) 2012 Sebastian Wiesner
;;
;; Author: Sebastian Wiesner <lunaryorn@gmail.com>
;; URL: https://gihub.com/lunaryorn/stante-pede.git
;; Keywords: extensions

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free Software
;; Foundation; either version 3 of the License, or (at your option) any later
;; version.

;; This program is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
;; FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
;; details.

;; You should have received a copy of the GNU General Public License along with
;; GNU Emacs; see the file COPYING.  If not, write to the Free Software
;; Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,
;; USA.


;;; Commentary:

;; Provide support for Python.
;;
;; Python editing is provided by the python-mode from
;; https://github.com/fgallina/python.el

;;; Code:

(require 'stante-lib-autoloads)
(require 'stante-programming)

(eval-when-compile
  (require 'cl))

(package-need 'python)

(defconst stante-python-checkers '("flake8" "epylint" "pyflakes")
  "Python checking tools.

Candidates for `python-check-command'.")

;; Find the best checker
(after 'python
  (setq python-check-command (dolist (checker stante-python-checkers)
                               (when (executable-find checker)
                                 (return checker)))))

(after 'expand-region
  ;; Tell expand-region about the Python mode we're using
  (setq expand-region-guess-python-mode nil
        expand-region-preferred-python-mode 'fgallina-python))

(provide 'stante-python)

;;; stante-python.el ends here
