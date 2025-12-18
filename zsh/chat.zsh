# shell chat
# requires `uv tool install llm`
llmcall() {
  local system_prompt="You are a helpful assistant running in a shell. $(uname -a)
Shell: $SHELL"
  # Check if there is piped input
  if [[ ! -t 0 ]]; then
    cat - | llm -m "$1" --system "$system_prompt" "${@:2}"
  else
    llm -m "$1" --system "$system_prompt" "${@:2}"
  fi
}
chat() {
  llmcall gemini-3-flash-preview "$@"
}
think() {
  llmcall gemini-3-pro-preview "$@"
}
