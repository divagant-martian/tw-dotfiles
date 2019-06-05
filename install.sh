#!/bin/bash
rm ~/.taskrc
ln -s $(pwd)/taskrc ~/.taskrc
rm -rf ~/.task/hooks
mkdir -p ~/.task
echo 'include '$(pwd)/darkokai.theme >> ~/.taskrc
ln -s $(pwd)/hooks ~/.task/hooks
chmod +x ~/.task/hooks/*
