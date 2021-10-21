export GITHUB_TOKEN="87eb1a600b414849797f50714002536c7a295bbe"
# export NPM_TOKEN=$(cat ~/.npmrc | sed s/^.*=//)
export NPM_TOKEN="33568546-919b-412d-be87-2bac3523a1cd"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export CURL_CA_BUNDLE=/Users/karschultz/.certs/cert.pem
export CURL_CA_BUNDLE=/Users/karschultz/.certs/cert.pem
export SSL_CERT_FILE=/Users/karschultz/.certs/cert.pem
export SSL_CERT_FILE=/Users/karschultz/.certs/cert.pem
export CURL_CA_BUNDLE=/Users/karschultz/.certs/cert.pem
export SSL_CERT_FILE=/Users/karschultz/.certs/cert.pem
export CURL_CA_BUNDLE=/Users/karschultz/.certs/cert.pem
export SSL_CERT_FILE=/Users/karschultz/.certs/cert.pem

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

path+=~/.js

eval "$(starship init zsh)"