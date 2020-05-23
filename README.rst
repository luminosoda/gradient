==================================
Color gradients generation library
==================================


✨ Features
===========

- 📈 Linear gradient
- 📉 Polyinear gradient
- ✨ Built-in beautiful gradients


🚀 Installation
===============

👑 Nimble
---------

You can install this package via nimble:

``nimble install gradient``

🐑 Cloning the repository from GitHub
-------------------------------------

::

  github clone https://github.com/luminosoda/gradient
  cd gradient
  nimble install


💁‍♀️ Examples
==================

Generate polylinear gradient for text:

::

  let text = "Example!"
  let my_colors = polylinear_gradient(parse_html_name("white"), parse_html_name("red"), parse_html_name("black"), text.len)

Generate 10 colors gradient from black to white:

::

  let bw_colors = linear_gradient(parse_html_name("black"), parse_html_name("white"), 10)