# frozen_string_literal: true

require "date"

# This class is used by call all of the events of the retention
class BackupRetentionPlan
  RETENTION_PERIODS = {
    'Beginner' => [42],
    'Pro' => [42, 12],
    'Ultra' => [42, 12, 7 * 365]
  }.freeze

  def initialize(plan)
    @plan = plan
    @retention_periods = RETENTION_PERIODS[plan]
  end

  def self.should_retain(plan, date)
    retention_plan = new(plan)
    retention_plan.should_retain(date)
  end

  def should_retain(date)
    snapshot_date = Date.strptime(date, '%Y/%m/%d')
    today = Date.today

    return true if within_retention_period(snapshot_date, today)

    @retention_periods[1..].each do |period|
      return snapshot_date.month == today.month if snapshot_date.year == today.year - period
    end

    false
  end

  private

  def within_retention_period(snapshot_date, today)
    retention_period = @retention_periods[0]
    snapshot_date >= today - retention_period
  end
end
