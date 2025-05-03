;;; packages.el --- Large GitHub Copilot Client for Spacemacs  -*- lexical-binding: nil; -*-
;;
;; Copyright (c) 2012-2025 Sylvain Benner & Contributors
;;
;; Author: Codruț Constantin Gușoi <mail+spacemacs@codrut.pro>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.


(defconst github-copilot-packages
  '((copilot)))

(defun github-copilot/init-copilot ()
  (use-package copilot
    :hook '(prog-mode-hook . copilot-mode)
    :custom
    (copilot-enable-predicates '(spacemacs//copilot-enable-predicate
                                 copilot--buffer-changed))
    :defer t
    :config
    (with-eval-after-load 'company
      (define-key copilot-completion-map (kbd "C-<iso-lefttab>") 'github-copilot/next-completion)
      (define-key copilot-completion-map (kbd "C-M-<iso-lefttab>") 'github-copilot/previous-completion)
      (define-key copilot-completion-map (kbd "C-M-<return>") 'copilot-accept-completion)
      (define-key copilot-completion-map (kbd "C-M-S-<return>") 'copilot-accept-completion-by-word))))

(defun github-copilot/next-completion ()
  "Move to the next completion in the Copilot completion menu.
This function will make sure to show the next completion,
if necessary triggering a `copilot-complete' command beforehand."
  (interactive)
  (copilot-complete)
  (copilot-next-completion))

(defun github-copilot/previous-completion ()
  "Move to the previous completion in the Copilot completion menu.
This function will make sure to show the previous completion,
if necessary triggering a `copilot-complete' command beforehand."
  (interactive)
  (copilot-complete)
  (copilot-previous-completion))
