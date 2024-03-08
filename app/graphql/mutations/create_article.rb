class Mutations::CreateArticle < GraphQL::Schema::Mutation
  null true

  
  argument :article, Types::ArticleInputType, required: true

  def resolve(article:)
    article = article.to_h
    article["user_id"] = context[:current_user].id
    Article.create article
  end
 
end
