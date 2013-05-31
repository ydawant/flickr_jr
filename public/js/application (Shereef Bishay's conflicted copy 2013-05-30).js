  $(document).ready(function() {
  $('.each_album li').click(function(e){
    photo_id = $(this).attr('id')
    $('.overlay').css({'z-index':'10000', 
     'opacity':'0.9', 
     'background-color':'gray',
     'position': 'absolute',
     'width':'100%',
     'height':'100%'
   })

    $('.each album li').hover(function(){
      $(this).animate({rotate: '+=10deg'}, 0)
    });

    var thumb = $('li#'+photo_id).html();
    var photo = thumb.replace('thumb_', '');
    $('.overlay').append(photo);
    $('.overlay img').css({ 'position':'absolute',
      'top':'0',
      'bottom':'0',
      'left' : '0',
      'right' : '0',
      'margin':'auto',
      'padding' : '5px',
      'background-color' : 'black',
      'opacity' : '1',
      'z-index' : '20000'
    });
    $('.overlay p').css({'text-align' : 'center',
      'margin-top' : '25%',
      'font-size' : '40px',
      'color' : 'white'
    });
  });

  $(document).keyup(function(event) {
    if(event.keyCode == 27) {
      $('.overlay').css({'z-index':'0', 
       'opacity':'0', 
       'background-color':'gray',
       'height':'0%',
       'width':'0%' 
     })
      $('.overlay img').remove();
      $('.overlay p').remove();
    };
  });
  $('.overlay').click(function(e){
    $('.overlay').css({'z-index':'0', 'opacity':'0', 'background-color':'gray'})
    $('.overlay img').remove();
    $('.overlay p').remove();
  });


  $('.carousel').on("click", ".frames li.active img", function(e) {
    if ( $('.frames li.active').html() == $('.frames li:last').html()) {
      e.preventDefault }
    else {
      var current = $('.frames li.active')

      current.prev().removeClass('previous')
      current.next().next().addClass('next')
      current.next().removeClass('next')

      $('.frames li').animate({left: '-=200px'}, 600);

      current.next().addClass('active')
      current.removeClass('active')
      current.addClass('previous')
    };
  });

  $('.carousel').on("click", ".frames li.next img", function() {
    var current = $('.frames li.active')
    
    current.prev().removeClass('previous')
    current.next().next().addClass('next')
    current.next().removeClass('next')
    
    $('.frames li').animate({left: '-=200px'}, 600);

    current.next().addClass('active')
    current.removeClass('active')
    current.addClass('previous')
  });

  $('.carousel').on("click", ".frames li.previous img", function() {
    var current = $('.frames li.active')

    current.prev().removeClass('previous')
    current.prev().prev().addClass('previous')
    current.prev().addClass('active')
    
    $('.frames li').animate({left: '+=200px'}, 600);

    current.next().removeClass('next')
    current.removeClass('active')
    current.addClass('next')
  });

  var counter = 2
  $('.container').on("click", "#more_pictures", function(event) {
    event.preventDefault();
    $('form#new_picture input[type="file"]:last').after("<input type='file' name='image[" + counter + "]'><br>");
    counter ++ ;
  });

  // $('.container').on("click", ".active .like", function(e) {
  //   e.preventDefault();

  //   var url  = $(this).attr('href');
  //   var data = $(this).serialize();

  //   $.post(url, data, function(response) {
  //     // debugger 
  //     $('.container .active .like_number').text(response['likes'])
  //   });
  // });
});
