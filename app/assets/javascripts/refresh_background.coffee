images = ['duomo.jpg', 'pantheon.jpg', 'trevi.jpg', 'firenze.jpg', 'manarola.jpg', 'ponte_vecchio.jpg', 'toscani_1.jpg', 'toscani_2.jpg', 'toscani_3.jpg', 'vernazza.jpg']

$ ->
  $('body').css 'backgroundImage', "url(assets/"+images[Math.floor(Math.random() * images.length)]+")"