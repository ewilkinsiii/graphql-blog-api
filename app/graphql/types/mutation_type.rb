# frozen_string_literal: true
module Types
  class MutationType < Types::BaseObject
    field :create_article, Types::ArticleType, mutation: Mutations::CreateArticle

    field :update_article, Boolean , null: false, description: "Update an article" do
      argument :article, Types::ArticleInputType, required: true
    end
    
    def update_article(article:)
      existing = Article.where(id: article[:id]).first
      existing&.update article.to_h
    end
  end
end
