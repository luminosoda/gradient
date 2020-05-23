import chroma
export chroma


proc interpolate(first, second, step, total: float32): float32 =
  ## Return result of interpolation 2 color values at `step`/`total
  result = first + (step / total) * (second - first)

proc linear_gradient*(first, second: Color, count: int): seq[Color] =
  ## Simple linear gradient from 2 colors, return sequence of colors with `count` length
  for step in 0..count - 1:
    result.add(Color(
      r: interpolate(first.r, second.r, float32(step), float32(count - 1)),
      g: interpolate(first.g, second.g, float32(step), float32(count - 1)),
      b: interpolate(first.b, second.b, float32(step), float32(count - 1)),
      a: interpolate(first.a, second.a, float32(step), float32(count - 1))
    ))

proc polylinear_gradient*(colors: openArray[Color], count: int): seq[Color] =
  ## Polylinear gradient from openArray of colors, return sequence of colors with `count` length
  let colors_per_gradient = int(count / (len(colors) - 1))

  for i in 0..colors.len - 2:
    result.add(linear_gradient(colors[i], colors[i + 1], colors_per_gradient))