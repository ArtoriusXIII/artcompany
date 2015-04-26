json.array!(@accounts) do |account|
  json.extract! account, :id, :address1, :address2, :comments, :details, :employee_id
  json.url account_url(account, format: :json)
end
