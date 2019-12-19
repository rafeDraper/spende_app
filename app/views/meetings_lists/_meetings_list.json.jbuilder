# frozen_string_literal: true

json.extract! meetings_list, :id, :title, :responsible, :created_at, :updated_at
json.url meetings_list_url(meetings_list, format: :json)
