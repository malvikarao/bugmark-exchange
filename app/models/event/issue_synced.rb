require 'ext/hash'

class Event::IssueSynced < Event

  EXTRAS = {extras: {"html_url" => :string, "comments" => :string}}

  jsonb_fields_for :payload, Issue, EXTRAS

  validates :exid      , presence: true

  def influx_tags
    {
      type: issue.type
    }
  end

  def influx_fields
    {
      id:             issue.id            ,
      stm_issue_uuid: issue.uuid          ,
      stm_repo_uuid:  issue.stm_repo_uuid ,
      stm_status:     issue.stm_status    ,
      stm_labels:     issue.stm_labels    ,
    }.delete_if {|_k, v| v.nil?}
  end

  def cast_object
    issue.assign_attributes(payload.without_blanks)
    issue
  end

  private

  def issue
    @iss ||= Issue.find_or_initialize_by(exid: payload["exid"])
  end
end

# == Schema Information
#
# Table name: events
#
#  id           :integer          not null, primary key
#  event_type   :string
#  event_uuid   :string
#  cmd_type     :string
#  cmd_uuid     :string
#  local_hash   :string
#  chain_hash   :string
#  payload      :jsonb            not null
#  jfields      :jsonb            not null
#  user_uuids   :string           default([]), is an Array
#  projected_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
