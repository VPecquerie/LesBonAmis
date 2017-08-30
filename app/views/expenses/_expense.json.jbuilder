json.extract! expense, :id, :title, :amount, :user_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)
