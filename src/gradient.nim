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


# Beautiful gradients from github.com/bokub/gradient-string
const
  atlas_gradient* = [parse_html_hex("#feac5e"), parse_html_hex("#c779d0"), parse_html_hex("#4bc0c8")] ## Atlas gradient colors
  cristal_gradient* = [parse_html_hex("#bdfff3"), parse_html_hex("#4ac29a")] ## Cristal gradient colors
  teen_gradient* = [parse_html_hex("#77a1d3"), parse_html_hex("#79cbca"), parse_html_hex("#e684ae")] ## Teen gradient colors
  mind_gradient* = [parse_html_hex("#473b7b"), parse_html_hex("#3584a7"), parse_html_hex("#30d2be")] ## Mind gradient colors
  morning_gradient* = [parse_html_hex("#ff5f6d"), parse_html_hex("#ffc371")] ## Morning gradient colors
  vice_gradient* = [parse_html_hex("#5ee7df"), parse_html_hex("#b490ca")] ## Vice gradient colors
  passion_gradient* = [parse_html_hex("#f43b47"), parse_html_hex("#453a94")] ## Passion gradient colors
  fruit_gradient* = [parse_html_hex("#ff4e50"), parse_html_hex("#f9d423")] ## Fruit gradient colors
  instagram_gradient* = [parse_html_hex("#833ab4"), parse_html_hex("#fd1d1d"), parse_html_hex("#fcb045")] ## Instagram gradient colors
  retro_gradient* = [parse_html_hex("#3f51b1"), parse_html_hex("#5a55ae"), parse_html_hex("#7b5fac"), parse_html_hex("#8f6aae"), parse_html_hex("#a86aa4"), parse_html_hex("#cc6b8e"), parse_html_hex("#f18271"), parse_html_hex("#f3a469"), parse_html_hex("#f7c978")] ## Retro gradient colors
  summer_gradient* = [parse_html_hex("#fdbb2d"), parse_html_hex("#22c1c3")] ## Summer gradient colors
  rainbow_gradient* = [parse_html_hex("#ff0000"), parse_html_hex("#ff0100")] ## Rainbow gradient colors
  pastel_gradient* = [parse_html_hex("#74ebd5"), parse_html_hex("#74ecd5")] ## Pastel gradient colors