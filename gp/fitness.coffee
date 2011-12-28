class Fitness
  constructor: (@real_func, @test_vals, @tree) ->
  eval: ->
    @_run()
    to_return = 0
    for result in @results
      to_return += Math.abs(result.real - result.aprox)
    to_return /= @results.length

  _run: ->
    @results = []
    for vals in @test_vals
      @results.push({
        real: @real_func(vals)
        aprox: @tree.execute(vals)
      })