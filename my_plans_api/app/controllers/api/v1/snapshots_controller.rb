class SnapshotsController < ApplicationController
  def should_retain
    should_retain = BackupRetentionPlan.should_retain(params[:plan], params[:date])

    render json: { should_retain: should_retain }
  end
end
