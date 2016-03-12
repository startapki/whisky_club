#= require simplemde.min
#= require_self

$('[data-provide=markdown]').each (_index, $element) ->
  new SimpleMDE
    element: $element[0]
