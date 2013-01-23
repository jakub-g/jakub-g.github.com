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
    node node_modules/attester/bin/attester.js --phantomjs-instances 1 --config.resources./ src --config.resources./test test --config.tests.aria-templates.classpaths.includes $*
}

fxtest() {
    firefox "http://localhost/aria-templates/test/beta.html?dev=true&testClasspath=$*"
}
ietest() {
    ie "http://localhost/aria-templates/test/beta.html?dev=true&testClasspath=$*"
}
chtest() { # you'll need to add (at least on Windows) the folder of chrome executable to the system's PATH
    chrome "http://localhost/aria-templates/test/beta.html?dev=true&testClasspath=$*"
}

multest() {
    ietest "$*" &
    fxtest "$*" &
    chtest "$*" &
    attest "$*"
}