module CarouselHelper
  def slide_count_list collection 
    list = '<ol class="carousel-indicators">'
    collection.count.times do |i|
      if i == 0 
        list = list +  '<li data-target="#myCarousel" data-slide-to="0" class="active"></li>'
      else 
        list = list +  '<li data-target="#myCarousel" data-slide-to="#{i}"></li>'
      end
    end 
    list += '</ol>'
    list.html_safe
  end
end 