#!/usr/bin/env bash

setupEmacs() { 
  git clone git@github.com:joelmccracken/doom-emacs.git ~/.emacs.d 
  doom sync
  doom env
} 

setupEmacs
