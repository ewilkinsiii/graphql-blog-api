class Types::CategoryType < Types::BaseObject
    description "one category"
    field :id, ID, null: false
    field :name, String, null: false
end
