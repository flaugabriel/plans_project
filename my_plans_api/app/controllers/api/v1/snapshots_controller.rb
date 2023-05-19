class SnapshotsController < ApiController
  def should_retain
    return json_error_response(messenger, status) unless params[:plan].blank? || params[:date].blank?

    should_retain = BackupRetentionPlan.should_retain(params[:plan], params[:date])
    render json: { should_retain: should_retain }
  end
end
