filenames = [
  "simple"
]

Enum.map(filenames, fn filename ->
  Code.eval_file("./priv/repo/seeds/#{filename}.exs")
end)
