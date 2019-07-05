if [[ -f $(which kubectl) ]]; then
    . <(kubectl completion bash)
fi
