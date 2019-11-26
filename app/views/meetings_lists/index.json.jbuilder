# frozen_string_literal: true

json.array! @meetings_lists, partial: 'meetings_lists/meetings_list', as: :meetings_list
