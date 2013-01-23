#!/bin/bash

# Aria Templates command line shortcuts

# Launch attester with default config.
# Usage:
#  attester
alias attester='npm run-script attester'

# Launch attester passing one specific test classpath.
# Usage:
#  attest test.aria.widgets.form.autocomplete.issue315.OpenDropDownFromButtonTest
attest() {
    classpath=$(echo $* | sed -e 's/\//\./g') # / to . replacements allows for folder-based TAB-autocompletion to work!
    node node_modules/attester/bin/attester.js --phantomjs-instances 1 --config.resources./ src --config.resources./test test --config.tests.aria-templates.classpaths.includes ${classpath}
}

fxtest() {
    classpath=$(echo $* | sed -e 's/\//\./g') # / to . replacements allows for folder-based TAB-autocompletion to work!
    firefox "http://localhost/aria-templates/test/beta.html?dev=true&testClasspath=${classpath}" &
}
ietest() {
    classpath=$(echo $* | sed -e 's/\//\./g') # / to . replacements allows for folder-based TAB-autocompletion to work!
    ie "http://localhost/aria-templates/test/beta.html?dev=true&testClasspath=${classpath}" &
}
chtest() { # you'll need to add (at least on Windows) the folder of chrome executable to the system's PATH
    classpath=$(echo $* | sed -e 's/\//\./g') # / to . replacements allows for folder-based TAB-autocompletion to work!
    chrome "http://localhost/aria-templates/test/beta.html?dev=true&testClasspath=${classpath}" &
}

multest() {
    classpath=$(echo $* | sed -e 's/\//\./g') # / to . replacements allows for folder-based TAB-autocompletion to work!
    ietest ${classpath} &
    fxtest ${classpath} &
    chtest ${classpath} &
    attest ${classpath}
}
