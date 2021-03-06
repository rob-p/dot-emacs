;;; test-ob-lob.el

;; Copyright (c) 2010 Eric Schulte
;; Authors: Eric Schulte

;; Released under the GNU General Public License version 3
;; see: http://www.gnu.org/licenses/gpl-3.0.html

;;;; Comments:

;; Template test file for Org-mode tests


;;; Code:
(let ((load-path (cons (expand-file-name
			".." (file-name-directory
			      (or load-file-name buffer-file-name)))
		       load-path)))
  (require 'org-test)
  (require 'org-test-ob-consts))


;;; Tests
(ert-deftest test-ob-lob/ingest ()
  "Test the ingestion of an org-mode file."
  (should (< 0 (org-babel-lob-ingest
		(expand-file-name "babel.org" org-test-example-dir)))))

(ert-deftest test-ob-lob/call-with-header-arguments ()
  "Test the evaluation of a library of babel #+call: line."
  (org-test-at-marker
      (expand-file-name "babel.org" org-test-example-dir)
      "69fbe856-ca9c-4f20-9146-826d2f488c1d"
    (move-beginning-of-line 1)
    (forward-line 1)
    (should (string= "testing" (org-babel-lob-execute
				(org-babel-lob-get-info))))
    (forward-line 1)
    (should (string= "testing" (caar (org-babel-lob-execute
				      (org-babel-lob-get-info)))))
    (forward-line 1)
    (should (string= "testing" (org-babel-lob-execute
    				(org-babel-lob-get-info))))
    (forward-line 1)
    (should (string= "testing" (caar (org-babel-lob-execute
    				      (org-babel-lob-get-info)))))))

(provide 'test-ob-lob)

;;; test-ob-lob.el ends here
