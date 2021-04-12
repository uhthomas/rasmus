# Rasmus

Rasmus is a toy application used as a platform for learning
[Elixir](https://elixir-lang.org/).

Semantically versioned images are deployed with
[Automata](https://github.com/uhthomas/automata), available at
[rasmus.6f.io](https://rasmus.6f.io).

## Getting started
Although images are created and pushed using Bazel, it's strongly recommended to
use the standard Elixir tooling for local development.

### Prerequisites
- Elixir
- Erlang

### Run
```
mix do deps.get, release
```
