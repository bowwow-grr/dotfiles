;;; package.el
(require 'package)
;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; MELPA-stableを追加
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
;; Marmaladeを追加
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
;; Orgを追加
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
;; 初期化
(package-initialize)

;;; mozc
(require 'mozc)					;; なぜかこのあたりでエラーが出る
(set-language-environment "Japanese") 	;; 言語環境を"Japaneseに
(setq default-input-method "japanese-mozc") 	;; IMEをjapanese-mozc
(prefer-coding-system 'utf-8) 			;;; デフォルトの文字コードをUTF-8

;;; 入力切り替え
(global-set-key (kbd "C-j") 'toggle-input-method)
