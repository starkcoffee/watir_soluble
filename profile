alias g="git status"
alias gpush="git push origin master --tags"
alias gpull="git pull origin master --tags"

alias webup="rake test_web:start"
alias webdown="rake test_web:stop"

function rsearch() {
    grep -r "$1" * | grep -v vendor
}
