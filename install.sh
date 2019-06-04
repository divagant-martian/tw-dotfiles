#!/bin/bash
ln -s $(pwd)/taskrc ~/.taskrc
rm -rf ~/.task/hooks
mkdir -p ~/.task
ln -s $(pwd)/hooks ~/.task/hooks
chmod +x ~/.task/hooks/*
