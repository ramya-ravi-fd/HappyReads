module UserBookHelper
  def get_shelves_name(books)
    @array ='';
   books.shelves.map{|a|  @array +=  a.shelve_nam }
  end
end
