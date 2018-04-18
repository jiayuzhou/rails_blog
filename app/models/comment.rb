class Comment < ApplicationRecord

  # NOTES: 
  # we use the following command to generate the model  
  #   bin/rails generate model Comment commenter:string body:text article:references
  # the article is referenced and therefore we have the following.. 
  belongs_to :article
end
