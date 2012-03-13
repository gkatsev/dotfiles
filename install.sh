#!/usr/bin/env sh

VIMRC="ln -s `pwd`/vimrc .vimrc"
VIMDIR="ln -s `pwd`/vim .vim"
VIMPRC="ln -s `pwd`/vimperatorrc .vimperatorrc"
VIMPDIR="ln -s `pwd`/vimperator .vimperator"
GITRC="ln -s `pwd`/gitconfig .gitconfig"
HGRC="ln -s `pwd`/hgrc .hgrc"
TTY="ln -s `pwd`/ttytterrc .ttytterrc"
SCREEN="ln -s `pwd`/screenrc .screenrc"

cd

echo "Linking .vimrc"
echo $VIMRC
$VIMRC
echo "Linking .vim"
echo $VIMDIR
$VIMDIR

echo "Linking .vimperatorrc"
echo $VIMPRC
$VIMPRC
echo "Linking .vimperator"
echo $VIMPDIR
$VIMPDIR

echo "Linking .gitconfig"
echo $GITRC
$GITRC
echo "Linking .hgrc"
echo $HGRC
$HGRC

echo "Linking .ttytterrc"
echo $TTY
$TTY

echo "Linking .screenrc"
echo $SCREEM
$SCREEN

echo "Finished installing"
