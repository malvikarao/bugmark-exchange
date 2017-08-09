class CmdEvent < ApplicationRecord

end

# == Schema Information
#
# Table name: contracts
#
#  id              :integer          not null, primary key
#  type            :string
#  publisher_id    :integer
#  counterparty_id :integer
#  token_value     :float
#  terms           :string
#  status          :string
#  awarded_to      :string
#  matures_at      :datetime
#  repo_id         :integer
#  bug_id          :integer
#  bug_title       :string
#  bug_status      :string
#  bug_labels      :string
#  bug_presence    :boolean
#  jfields         :jsonb            not null
#  exref           :string
#  uuref           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
