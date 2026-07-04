# shell chat
# requires `uv tool install llm`
# llm install llm-gemini
# llm keys set gemini
#
# update model with
# > uv tool update llm
# > llm models
llmcall() {
  local system_prompt="You are a helpful assistant running in a shell. $(uname -a)
Shell: $SHELL
Give responses which answer the question succinctly. Do not give long explanations unless explicitly asked.
"
  # Check if there is piped input
  if [[ ! -t 0 ]]; then
    cat - | llm "${@:2}" -m "$1" --system "$system_prompt"
  else
    llm "${@:2}" -m "$1" --system "$system_prompt"
  fi
}
chat() {
  llmcall gemini-3.5-flash "$@"
}
think() {
  llmcall gemini-3.1-pro-preview "$@"
}
