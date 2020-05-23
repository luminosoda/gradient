proc interpolate(first, second, step, total: float32): float32 =
  ## Return result of interpolation 2 color values at `step`/`total
  result = first + (step / total) * (second - first)