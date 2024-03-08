# frozen_string_literal: true
module Types
  class MutationType < Types::BaseObject
    field :create_article, Types::ArticleType, mutation: Mutations::CreateArticle

  end
end
