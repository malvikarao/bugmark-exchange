require 'rails_helper'

RSpec.describe CmdEvent, type: :model do


end

# == Schema Information
#
# Table name: bugs
#
#  id          :integer          not null, primary key
#  repo_id     :integer
#  type        :string
#  json_url     :string
#  html_url    :string
#  title       :string
#  description :string
#  status      :string
#  labels      :text             default([]), is an Array
#  jfields     :jsonb            not null
#  synced_at   :datetime
#  exref       :string
#  uuref       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#