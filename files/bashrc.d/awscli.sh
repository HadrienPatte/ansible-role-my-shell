if [[ -x $(which aws) ]]; then
    complete -C $(which aws_completer) aws
fi
