#!/bin/sh

if [ -e objects/pack/*.pack ]; then
    mv $(ls objects/pack/*.pack) ./
    git unpack-objects < $(ls ./*.pack)
fi