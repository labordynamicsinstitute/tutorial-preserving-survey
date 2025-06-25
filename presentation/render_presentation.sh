#!/bin/bash

# Call this from the main directory, go up a directory if we are in the presentation directory
if [[ $(basename "$PWD") == "presentation" ]]; then
    cd ..
fi

[[ -z $QUARTO_OPTS ]] && QUARTO_OPTS="--output-dir _html"
quarto render presentation/presentation.qmd $QUARTO_OPTS
quarto render presentation/01-very-imperfect-example.qmd $QUARTO_OPTS
quarto render presentation/day2.qmd $QUARTO_OPTS